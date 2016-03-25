*** Settings ***
Resource          ../services/UI/LoginServiceUI.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          ../globalConfig/GlobalSettings.robot
Resource          ../services/UI/ManageProjectsServiceUI.robot

*** Variables ***
${WELCOM_URL}     ${LOGIN_URL}/projects
${PROJECT_NAME_SIZE}    19

*** Test Case ***
Create New Project Test
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_SIZE}
    Login And Open Projects Page
    Create New Project    ${projectName}
    Check Project Creation    ${projectName}
    [Teardown]    Close Browser
