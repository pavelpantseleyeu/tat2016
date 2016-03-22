*** Settings ***
Documentation     A test suite with positive login tests.
Suite Setup       Open login page
Suite Teardown    Close Browser
Resource         ../services/LoginService.robot
Resource         ../utils/RandomWordsUtil.robot

*** Variables ***
${WELCOM_URL}     ${PROTOCOL}//${SERVER}:${PORT}/cmp/projects
${ERROR_URL}      ${LOGIN_URL}/login?login_error=1
${CREDENTIAL_SIZE}     5

*** Test Cases ***
Valid Credentials Test
    Login To Clarabridge
    Check Location     ${WELCOM_URL}
    check main page content
    [Teardown]    Sign out Clarabridge

Invalid Login Test
    ${login}=    random credential     ${CREDENTIAL_SIZE}
    Login Expected Failure        ${login}          ${USER_PASSWORD}
    Check Location     ${ERROR_URL}
    Check Error Login Message

Invalid Password Test
    ${password}=    random credential     ${CREDENTIAL_SIZE}
    Login Expected Failure       ${USER_LOGIN}        ${password}
    Check Location     ${ERROR_URL}
    Check Error Login Message

Invalid Login and Password Test
    ${login}=    random credential     ${CREDENTIAL_SIZE}
    ${password}=    random credential     ${CREDENTIAL_SIZE}
    Login Expected Failure       ${login}          ${password}
    Check Location     ${ERROR_URL}
    Check Error Login Message