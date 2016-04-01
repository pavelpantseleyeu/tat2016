*** Settings ***
Resource          res/MainPageLocators.robot
Resource          ../globalConfig/GlobalSettings.robot
Library           Selenium2Library

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
    Wait Until Element Is Enabled    ${PROJECT_NAME_FIELD_LOCATOR}    ${SELENIUM_DEFAULT_TIMEOUT}
    Click Element    ${PROJECT_NAME_FIELD_LOCATOR}

Input New Project's Name
    [Arguments]    ${projectName}
    Input Text    ${PROJECT_NAME_FIELD_LOCATOR}    ${projectName}

Click Create Button
    Click Button    ${CREATE_BUTTON_LOCATOR}

Off Upload Data
    Unselect Checkbox    ${NEWPROJECT_CHECKBOX_LOCATOR}

Awaiting Finish Creating
    [Arguments]    ${projectName}
    Wait Until Element Is Not Visible    ${ONLOAD_LOCATOR}    ${PROJECT_PROCESSING_TIMEOUT}
    Click On Logo
    Wait Until Element Is Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'since')]    ${PROJECT_PROCESSING_TIMEOUT}
    Wait Until Element Is Not Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'since')]    ${PROJECT_PROCESSING_TIMEOUT}

Awaiting Deleting Project
    [Arguments]    ${projectName}
    Wait Until Element Is Not Visible    ${SUBMIT_DELETE_BUTTON_LOCATOR}
    Wait Until Element Is Not Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]

Delete Project Notification
     Wait Until Element Is Visible    ${OK_DELETE_BUTTON_LOCATOR}    ${PROJECT_PROCESSING_TIMEOUT}
     Unselect Checkbox    ${RETAIN_SCHEMAS_CHECKBOX_LOCATOR}
     Click Element    ${OK_DELETE_BUTTON_LOCATOR}
     Wait Until Element Is Not Visible    ${DELETE_TABLE_LOCATOR}    ${PROJECT_PROCESSING_TIMEOUT}

Click On Delete Project Link
    [Arguments]    ${projectName}
    Wait Until Element Is Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]    ${PROJECT_PROCESSING_TIMEOUT}
    Click Element    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]

Click On Submit Delete Project Button
    Wait Until Element Is Enabled    ${SUBMIT_DELETE_BUTTON_LOCATOR}
    Click Element    ${SUBMIT_DELETE_BUTTON_LOCATOR}
