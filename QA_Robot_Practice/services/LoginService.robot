*** Settings ***
Documentation    This is implementing of the login functionality
Resource         ../pages/LoginPage.robot
Resource         ../pages/MainPage.robot

*** Keywords ***
Open Login Page
    Open Browser On Login Page

Sign Out Clarabridge
    Sign Out

Login To Clarabridge
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    ${status}    ${value}    Run Keyword And Ignore Error    page should contain element    ${OK_BUTTON_LOCATOR}
    Run Keyword If    '${status}' == 'PASS'    Confirm Error Message

Go To Projects Page
    Click On Logo

Check Location
    [Arguments]    ${expectedLocation}
    ${actuaslLocation}    Get Location
    Should Be Equal    ${expectedLocation}    ${actuaslLocation}    Location is ${actuaslLocation} but should be ${expectedLocation}

Check Error Login Message Presence
    Page Should Contain Element    ${ERROR_CASE_ELEMENT}    The Login page doesn't contain error message element, but should be