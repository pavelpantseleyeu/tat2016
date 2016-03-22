*** Settings ***
Documentation    This is implementing of the login functionality
Resource         ../pages/LoginPage.robot
Resource         ../pages/MainPage.robot
Resource         ../globalConfig/GlobalSettings.robot

*** Keywords ***
Open login page
    Open browser in login

Sign out Clarabridge
    sign out

Login To Clarabridge
    Login      ${USER_LOGIN}    ${USER_PASSWORD}
    ${status}    ${value}=    run keyword and ignore error    page should contain element    ${CLOSE_BUTTON_LOCATOR}
    run keyword if    '${status}' == 'PASS'    Skip message


Login Expected Failure
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}

Check Location
    [Arguments]    ${expectedLocation}
    ${actuaslLocation}    Get Location
    Should Be Equal    ${expectedLocation}    ${actuaslLocation}    Location is ${actuaslLocation} but should be ${expectedLocation}

Check Error Login Message
    page should contain element    ${ERROR_CASE_ELEMENT}    The Login page doesn't contain error message element, but should be

Check Main Page Content
    page should contain element    ${PROJECTS_CONTENT_LOCATOR}     The Main page doesn't contain Projects contain element, but should be

