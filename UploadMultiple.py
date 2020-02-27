class UploadMultiple(object):

    ROBOT_LIBRARY_VERSION = 1.0

	def choose_multiple_files(self, locator, basePath="",  *files):
	    fileList = []
	    for file in files:
	        path_to_image = os.path.join(basePath, file)
	        if not os.path.isfile(path_to_image):
	            raise AssertionError("File '%s' does not exist on the local file system" % path_to_image)
	        fileList.append(path_to_image)
	    selenium2Lib = BuiltIn().get_library_instance('Selenium2Library')
	    selenium2Lib._element_find(locator, True, True).send_keys("\n".join(fileList))
	    
from robot.libraries.BuiltIn import BuiltIn

class CustomKeywords:
  def choose_files(self, locator, file_paths):
    sl = BuiltIn().get_library_instance('SeleniumLibrary')
    sl.find_element(locator).send_keys(file_paths)