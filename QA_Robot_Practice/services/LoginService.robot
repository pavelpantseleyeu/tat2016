*** Settings ***
Documentation    This is implementing of the login functionality
Resource         ../pages/LoginPage.robot
Resource         ../pages/MainPage.robot
Resource         ../globalConfig/GlobalSettings.robot

*** Keywords ***
Open Login Page
    Open browser in login

Sign Out Clarabridge
    sign out

Login To Clarabridge
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    ${status}    ${value}    run keyword and ignore error    page should contain element    ${CLOSE_BUTTON_LOCATOR}
    run keyword if    '${status}' == 'PASS'    Skip message

Check Location
    [Arguments]    ${expectedLocation}
    ${actuaslLocation}    Get Location
    Should Be Equal    ${expectedLocation}    ${actuaslLocation}    Location is ${actuaslLocation} but should be ${expectedLocation}

Check Error Login Message Presence
    Page Should Contain Element    ${ERROR_CASE_ELEMENT}    The Login page doesn't contain error message element, but should be

Check Main Page Contents Last Login Label
    Page Should Contain Element    ${LAST_LOGIN_LABEL_LOCATOR}    The Main page doesn't contain last login label element, but should be