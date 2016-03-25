*** Settings ***
Documentation     A test suite with positive and negative login tests.
Suite Setup       Open Login Page
Suite Teardown    Close Browser
Resource          ../services/UI/LoginServiceUI.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          ../globalConfig/GlobalSettings.robot
Resource          TestResourses/Resourses.robot

*** Variables ***
${CREDENTIAL_SIZE}    5

*** Test Cases ***
Valid Credentials Test
    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}
    Go To Projects Page
    Check Location    ${WELCOM_URL}
    [Teardown]    Sign Out

Invalid Login Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${USER_PASSWORD}
    Check Location    ${ERROR_URL}
    Check Error Login Message Presence

Invalid Password Test
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${USER_LOGIN}    ${password}
    Check Location    ${ERROR_URL}
    Check Error Login Message Presence

Invalid Login And Password Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Login To Clarabridge    ${login}    ${password}
    Check Location    ${ERROR_URL}
    Check Error Login Message Presence