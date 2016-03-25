*** Settings ***
Resource         ../../pages/MainPage.robot
Resource         LoginServiceUI.robot

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
    Wait Until Element Is Not Visible    ${ONLOAD_LOCATOR}    ${CREATE_PROJECT_TIMEOUT}

Check Project Creation
    [Arguments]    ${projectName}
    Assign ID To Element   //.[contains(text(), '${projectName}')]    projectNameLocator
    Page Should Contain Element    projectNameLocator