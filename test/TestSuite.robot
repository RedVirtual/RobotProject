 *** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    Estoy dentro del Test Suite Setup 
Suite Teardown    Log    Estoy dentro del Test Suite Teardown 
Test Setup    Log    Estoy dentro del Test Setup 
Test Teardown    Log    Estoy dentro del Test Teardown 

Default Tags    sanity

*** Test Cases ***
# MyFirstTest
    # Log     Hola Mundo   
    # Log To Console    Esto es una prueba 

# FirstSeleniumTest
# #   Create Webdriver     Chrome     executable_path=C:\\Python38-32\\Scripts\\chromedriver.exe
    # Open Browser  https://www.google.com  browser=chrome
    # Set Browser Implicit Wait    5
# #    Close All Browsers
    # Input Text    name=q    Novotec it sada  
    # Press Keys    name=q    ENTER
# #    Click Button    name=BtnK    
    # Sleep    2      
    # Close Browser
    # Log To Console    Test completado 
   
# SampleLoginTest
    # [Documentation]    This is a sample login test
    # Open Browser  https://opensource-demo.orangehrmlive.com/  browser=chrome
# #    pausa
    # Set Browser Implicit Wait    5
# # ( Username : Admin | Password : admin123 )
    # Input Text        id=txtUsername    Admin
    # Input Password    id=txtPassword    admin123
    # Click Button      id=btnLogin 
# #    Click Element     id=welcome
# #    Click Button     id=welcome
     # Click Element     link=Welcome Admin
# #    Click Link    Logout   
# #    necesita pausa para localizar el link
    # Click Element     link=Logout   
    # Sleep    5      
    # Close Browser
    # Log To Console    Test completado 
   

# C:\Java\eclipse-workspace\RobotProject>robot -t SampleLoginTest2 test\TestSuite.robot

SampleLoginTest2
    [Tags]    SMOKE
    [Documentation]    This is a sample login test
    Open Browser  ${URL}  browser=chrome
#    pausa
    Set Browser Implicit Wait    5
## ( Username : Admin | Password : admin123 )
#    Input Text        id=txtUsername    @{CREDENTIALS}[0]
##    Input Password    id=txtPassword    @{CREDENTIALS}[1]
#    Input Password    id=txtPassword   &{LOGINDATA}[pass]
#    Click Button      id=btnLogin 
    LoginKW
#    Click Element     id=welcome
#    Click Button     id=welcome
     Click Element     link=Welcome Admin
#     Click Element     link=Welcome John
#    Click Link    Logout   
#    necesita pausa para localizar el link
    Click Element     link=Logout   
    Sleep    5      
    Close Browser
    Log To Console    Test completado 
    Log To Console    Test realizado por %{username} en %{os}
    Set Tags    regression1
    Remove Tags    regression1

FileUpload
    Open Browser  ${UPL}  browser=chrome
#    pausa
    Set Browser Implicit Wait    5
#    subir fichero  
    Choose File  id=files    C://Temporal/Excel.xlsx
    Click Button      id=upload
    Sleep    5      
    Close Browser
    Log To Console    Test completado   
    
 
*** Variables ***
${URL}  https://opensource-demo.orangehrmlive.com/ 
${UPL}  https://localhost:44364/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    user=Admin    pass=admin123 

*** Keywords ***
LoginKW
# ( Username : Admin | Password : admin123 )
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
#    Input Password    id=txtPassword    @{CREDENTIALS}[1]
    Input Password    id=txtPassword   &{LOGINDATA}[pass]
    Click Button      id=btnLogin 