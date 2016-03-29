*** Settings ***
Resource          ../services/UI/ManageProjectServiceUI.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          Resources/Resourses.robot

*** Test Case ***
Delete Project Test
    [Setup]    Run Keywords    Login And Open Projects Page
    ...    AND    Create New Project ${EMPTY}
    ...    AND    Delete Project
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_LENGTH}
    Create New Project    ${projectName}
