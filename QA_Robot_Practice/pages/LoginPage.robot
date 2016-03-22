*** Settings ***
Resource          res/LoginPageLocators.robot
Resource          ../globalConfig/GlobalSettings.robot
Library           Selenium2Library

*** Variables ***

*** Keywords ***
Open browser in login
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser    ${LOGIN_URL}
    Maximize Browser Window

Login
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_INPUT_FIELD_LOCATOR}    ${username}
    Input Text    ${PASSWORD_INPUT_FIELD_LOCATOR}    ${password}
    Click Button    ${SUBMIT_BUTTON_LOCATOR}