*** Settings ***
Resource          ../globalConfig/GlobalSettings.robot
Resource          res/MainPageLocators.robot
Library           Selenium2Library

*** Keywords ***
Skip message
    wait until element is enabled  ${CLOSE_BUTTON_LOCATOR}
    click element  ${CLOSE_BUTTON_LOCATOR}

Sign out
    WAIT UNTIL ELEMENT IS ENABLED  ${SYSTEM_LINK_LOCATOR}
    click element  ${SYSTEM_LINK_LOCATOR}
    wait until element is enabled  ${LOGOUT_LINK_LOCATOR}
    click element  ${LOGOUT_LINK_LOCATOR}