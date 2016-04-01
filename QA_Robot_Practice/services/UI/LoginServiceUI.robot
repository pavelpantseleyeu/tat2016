*** Settings ***
Resource         ../../pages/LoginPage.robot
Resource          ../../globalConfig/GlobalSettings.robot

*** Keywords ***
Open Login Page
    Open Browser On Login Page

Login To Clarabridge
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    ${status}    ${value}    Run Keyword And Ignore Error    Page Should Contain Element    ${OK_BUTTON_LOCATOR}
    Run Keyword If    '${status}' == 'PASS'    Confirm Error Message

Check Location
    [Arguments]    ${expectedLocation}
    ${actuaslLocation}    Get Location
    Should Be Equal    ${expectedLocation}    ${actuaslLocation}    Location is ${actuaslLocation} but should be ${expectedLocation}

Login As Admin
    Open Browser On Login Page
    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}

Check Error Login Message Presence
    Page Should Contain Element    ${ERROR_CASE_ELEMENT}    The Login page doesn't contain error message element, but should be