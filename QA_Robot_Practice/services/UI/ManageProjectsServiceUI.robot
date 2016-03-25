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

Check Project Creation
    [Arguments]    ${projectName}
    Wait Until Element Is Not Visible    ${ONLOAD_LOCATOR}    ${CREATE_PROJECT_TIMEOUT}
    Wait Until Element Is Visible    //.[contains(text(), '${projectName}')]    ${SELENIUM_DEFAULT_TIMEOUT}