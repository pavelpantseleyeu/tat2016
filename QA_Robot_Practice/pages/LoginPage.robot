*** Settings ***
Resource          res/LoginPageLocators.robot
Resource          ../globalConfig/GlobalSettings.robot
Library           Selenium2Library

*** Variables ***

*** Keywords ***
Open Browser On Login Page
    Set Selenium Speed    ${SELENIUM_SPEED}
    Open Browser    ${LOGIN_URL}
    Maximize Browser Window

Confirm Error Message
    Wait Until Element Is Visible    ${OK_BUTTON_LOCATOR}
    Click Element    ${OK_BUTTON_LOCATOR}

Login
    [Arguments]    ${username}    ${password}
    Input Text    ${LOGIN_TEXT_INPUT_LOCATOR}    ${username}
    Input Text    ${PASSWORD_TEXT_INPUT_LOCATOR}    ${password}
    Click Button    ${SUBMIT_BUTTON_LOCATOR}
