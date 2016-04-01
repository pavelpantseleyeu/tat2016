*** Settings ***
Resource         ../../pages/MainPage.robot
Resource          ../../utils/RandomWordsUtil.robot

*** Keywords ***
Sign Out
    Click On System Dropdown
    Click Sign Out

Go To Projects Page
    Click On Logo

Create New Project
    [Arguments]    ${projectName}
    Click On Logo
    Click On Create New Project Button
    Click On Project Name Field
    Input New Project's Name    ${projectName}
    Off Upload Data
    Click Create Button
    Awaiting Finish Creating    ${projectName}

Create Test Project
     ${projectName}    RandomWordsUtil.Get Random String    ${DEFAULT_PROJECT_NAME_LENGTH}
     Set Global Variable    ${projectName}
     Create New Project    ${projectName}

Check Project Creation
    [Arguments]    ${projectName}
    Page Should Contain Element   //.[contains(text(), '${projectName}')]

Delete Project
    [Arguments]    ${projectName}
    Click On Delete Project Link    ${projectName}
    Delete Project Notification

Check Project Deletion
    [Arguments]    ${projectName}
    Awaiting Deleting Project    ${projectName}
    Page Should Not Contain Element   //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]

