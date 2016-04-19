*** Settings ***
Library           ../services/UI/LoginService.py
Library           ../libraries/GenerateWordsLibrary.py
Library           ../services/UI/NavigateService.py
Library           ../globalConfig/GlobalSettings.py
Library           Resources/Resources.py

*** Test Cases ***
Valid Credentials Test
    ${globalSettings}    Get Library Instance    GlobalSettings
    Open Login Page    ${GlobalSettings.LOGIN_URL}
    Login To Clarabridge
    Go To Projects Page
    Check Location    ${GlobalSettings.WELCOM_URL}
    [Teardown]    Sign Out

Invalid Login Test
    ${globalSettings}    Get Library Instance    GlobalSettings
    ${resources}    Get Library Instance    Resources
    ${login}    Get Random String    ${Resources.CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${GlobalSettings.USER_PASSWORD}
    Check Location    ${GlobalSettings.ERROR_URL}
    Check Error Message Presence

Invalid Password Test
    ${globalSettings}    Get Library Instance    GlobalSettings
    ${resources}    Get Library Instance    Resources
    ${password}   Get Random String    ${Resources.CREDENTIAL_SIZE}
    Login To Clarabridge    ${GlobalSettings.USER_LOGIN}    ${password}
    Check Location    ${GlobalSettings.ERROR_URL}
    Check Error Message Presence

Invalid Login And Password Test
    ${globalSettings}    Get Library Instance    GlobalSettings
    ${resources}    Get Library Instance    Resources
    ${login}    Get Random String    ${Resources.CREDENTIAL_SIZE}
    ${password}    Get Random String    ${Resources.CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${password}
    Check Location    ${GlobalSettings.ERROR_URL}
    Check Error Message Presence