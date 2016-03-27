*** Settings ***
Resource          ../utils/RandomWordsUtil.robot
Resource          ../services/UI/ManageProjectServiceUI.robot

*** Variables ***
${PROJECT_NAME_LENGTH}    19

*** Test Case ***
Create New Project Test
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_LENGTH}
    Login And Open Projects Page
    Create New Project    ${projectName}
    Check Project Creation    ${projectName}
    [Teardown]    Close Browser