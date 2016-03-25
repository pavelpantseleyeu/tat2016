*** Settings ***
Resource          ../../globalConfig/GlobalSettings.robot

*** Variables ***
${WELCOM_URL}     ${LOGIN_URL}/projects
${ERROR_URL}      ${LOGIN_URL}/login?login_error=1