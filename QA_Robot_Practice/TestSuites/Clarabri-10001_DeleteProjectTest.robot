*** Settings ***
Resource          ../utils/RandomWordsUtil.robot
Resource          Resources/Resourses.robot
Resource          ../services/UI/ManageProjectServiceUI.robot

*** Test Case ***
Delete Project Test
    [Setup]    My Keyword    Delete Project
    Delete Project    ${projectName}
    Check Delete Project    ${projectName}
    [Teardown]    Close Browser
