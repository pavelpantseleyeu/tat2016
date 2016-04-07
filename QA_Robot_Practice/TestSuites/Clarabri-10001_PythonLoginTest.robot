*** Settings ***
Resource          Resources/Resources.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          ../globalConfig/GlobalSettings.robot
Library           ../services/UI/LoginServiceUI.py
Library           ../services/UI/ManageProjectServiceUI.py

*** Test Cases ***
Valid Credentials Test
    Login As Admin
    Go To Projects Page
    Check Location    ${WELCOM_URL}
    [Teardown]    Sign Out

Invalid Login Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${USER_PASSWORD}
    Check Location    ${ERROR_URL}
    Check Error Message Presence

Invalid Password Test
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${USER_LOGIN}    ${password}
    Check Location    ${ERROR_URL}
    Check Error Message Presence

Invalid Login And Password Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${password}
    Check Location    ${ERROR_URL}
    Check Error Message Presence
