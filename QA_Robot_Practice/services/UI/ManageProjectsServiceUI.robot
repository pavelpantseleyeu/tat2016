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
    Click On Delete Project Link    ${projectName}
    Click On Submit Delete Project Button

Check Project Deletion
    [Arguments]    ${projectName}
    Awaiting Deleting Project    ${projectName}
    Page Should Not Contain Element   //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]

