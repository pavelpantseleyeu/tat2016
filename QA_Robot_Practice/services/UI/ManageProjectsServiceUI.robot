*** Settings ***
Resource         ../../pages/MainPage.robot

*** Keywords ***
Create New Project
    [Arguments]    ${projectName}
    Click On Create New Project Button
    Click On Project Name Field
    Input New Project's Name    ${projectName}