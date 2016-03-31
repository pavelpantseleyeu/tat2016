*** Settings ***
Resource          ../../pages/MainPage.robot
Resource          LoginServiceUI.robot
Resource          ../../utils/RandomWordsUtil.robot

*** Keywords ***
Login And Open Projects Page
    Open Login Page
    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}
    Go To Projects Page

Create New Project
    [Arguments]    ${projectName}
    Click On Create New Project Button
    Click On Project Name Field
    Input New Project's Name    ${projectName}
    Off Upload Data
    Click Create Button
    Waiting For Project Creation

Check Project Creation
    [Arguments]    ${projectName}
    Page Should Contain Element    //.[text()='${projectName}']

Create Test Project
    [Arguments]    ${projectName}
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_LENGTH}
    Set Global Variable    ${projectName}
    Login And Open Projects Page
    Create New Project    ${projectName}
    Go To Projects Page

Delete Project
    [Arguments]    ${projectName}
    Wait Until Element Is Enabled    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]    ${DELETE_PROJECT_TIMEOUT}
    Click Element    //a[contains(text(), '${projectName}')]//..//..//.[contains(text(), 'Delete project')]
    Delete Project Notification

Check Delete Project
    [Arguments]    ${projectName}
    Wait Until Page Does Not Contain Element    //.[text()='${projectName}']    ${DELETE_PROJECT_TIMEOUT}
    Page Should Not Contain Element    //.[text()='${projectName}']
