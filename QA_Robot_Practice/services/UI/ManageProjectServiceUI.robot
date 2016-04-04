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
    Unselect Upload Data Checkbox
    Click Create Button
    Awaiting Finish Creating    ${projectName}
    Check Project Creation    ${projectName}

Create Test Project
    ${projectName}    RandomWordsUtil.Get Random String    ${DEFAULT_PROJECT_NAME_LENGTH}
    Set Global Variable    ${projectName}
    Create New Project    ${projectName}

Delete Project
    [Arguments]    ${projectName}
    Click On Delete Project Link    ${projectName}
    Delete Project Notification
    Check Project Deletion    ${projectName}
