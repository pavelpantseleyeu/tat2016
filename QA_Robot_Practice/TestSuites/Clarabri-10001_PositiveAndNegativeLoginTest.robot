*** Settings ***
Documentation     A test suite with positive login tests.
Suite Setup       Open Login Page
Suite Teardown    Close Browser
Resource         ../services/LoginService.robot
Resource         ../utils/RandomWordsUtil.robot

*** Variables ***
${WELCOM_URL}     ${LOGIN_URL}/analyze#
${ERROR_URL}      ${LOGIN_URL}/login?login_error=1
${CREDENTIAL_SIZE}    5

*** Test Cases ***
Valid Credentials Test
    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}
    Check Location     ${WELCOM_URL}
    Check Main Page Contents Last Login Label
    [Teardown]    Sign Out Clarabridge

Invalid Login Test
    ${login}     Generate Random Credential     ${CREDENTIAL_SIZE}
    Login To Clarabridge        ${login}          ${USER_PASSWORD}
    Check Location     ${ERROR_URL}
    Check Error Login Message Presence

Invalid Password Test
    ${password}    Generate Random Credential     ${CREDENTIAL_SIZE}
    Login To Clarabridge       ${USER_LOGIN}        ${password}
    Check Location     ${ERROR_URL}
    Check Error Login Message Presence

Invalid Login And Password Test
    ${login}    Generate Random Credential     ${CREDENTIAL_SIZE}
    ${password}    Generate Random Credential     ${CREDENTIAL_SIZE}
    Login To Clarabridge       ${login}          ${password}
    Check Location     ${ERROR_URL}
    Check Error Login Message Presence