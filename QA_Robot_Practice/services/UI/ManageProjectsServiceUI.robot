*** Settings ***
Resource         ../../pages/MainPage.robot

*** Keywords ***
Sign Out
    Click On System Dropdown
    Click Sign Out

Create New Project
    [Arguments]    ${projectName}
    Click On Create New Project Button
    Click On Project Name Field
    Input New Project's Name    ${projectName}
    Off Upload Data
    Click Create Button
    Awaiting Finish Creating

Check Project Creation
    [Arguments]    ${projectName}
    Page Should Contain Element   //.[contains(text(), '${projectName}')]

Delete Project
    [Arguments]    ${projectName}
    Click On Logo
    Wait Until Element Is Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'since')]    ${DELETE_PROJECT_TIMEOUT}
    Wait Until Element Is Not Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'since')]    ${DELETE_PROJECT_TIMEOUT}
    Wait Until Element Is Visible    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]    ${DELETE_PROJECT_TIMEOUT}
    Click On Delete Project Link    ${projectName}
    Delete Project Notification

Check Project Deletion
    [Arguments]    ${projectName}
    Awaiting Deleting Project    ${projectName}
    Page Should Not Contain Element   //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]

