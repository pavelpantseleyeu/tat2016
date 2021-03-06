*** Settings ***
Resource          res/MainPageLocators.robot
Library           Selenium2Library
Resource          ../globalConfig/GlobalSettings.robot
Resource          ../utils/RandomWordsUtil.robot

*** Keywords ***
Confirm Error Message
    Wait Until Element Is Visible    ${OK_BUTTON_LOCATOR}
    Click Element    ${OK_BUTTON_LOCATOR}

Click On System Dropdown
    Wait Until Element Is Visible    ${SYSTEM_DROPDOWN_LOCATOR}
    Click Element    ${SYSTEM_DROPDOWN_LOCATOR}

Click Sign Out
    Wait Until Element Is Visible    ${LOGOUT_LINK_LOCATOR}
    Click Element    ${LOGOUT_LINK_LOCATOR}

Click On Logo
    Wait Until Element Is Visible    ${LOGO_LOCATOR}
    : FOR    ${try}    IN RANGE    0    3
    \    Click Element    ${LOGO_LOCATOR}
    \    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${CREATE_NEW_PROJECT_LOCATOR}
    \    Run Keyword If    ${status}    Exit For Loop

Click On Create New Project Button
    Wait Until Element Is Visible    ${CREATE_NEW_PROJECT_BUTTON_LOCATOR}    ${SELENIUM_DEFAULT_TIMEOUT}
    Click Button    ${CREATE_NEW_PROJECT_BUTTON_LOCATOR}

Click On Project Name Field
    Wait Until Element Is Visible    ${PROJECT_NAME_FIELD_LOCATOR}    ${SELENIUM_DEFAULT_TIMEOUT}
    Click Element    ${PROJECT_NAME_FIELD_LOCATOR}

Input New Project's Name
    [Arguments]    ${projectName}
    Input Text    ${PROJECT_NAME_FIELD_LOCATOR}    ${projectName}

Click Create Button
    Click Button    ${CREATE_BUTTON_LOCATOR}

Off Upload Data
    Unselect Checkbox    ${NEWPROJECT_CHECKBOX_LOCATOR}

Find New Project
    [Arguments]    ${projectName}
    Wait Until Element Is Not Visible    ${ONLOAD_LOCATOR}    ${CREATE_PROJECT_TIMEOUT}
    Wait Until Element Is Visible    //.[contains(text(), '${projectName}')]    ${SELENIUM_DEFAULT_TIMEOUT}
