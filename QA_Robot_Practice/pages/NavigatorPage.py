from globalConfig import GlobalSettings
from pages.BasePage import driver as driver

SYSTEM_DROPDOWN_LOCATOR = "//*[@id='GButtonUserMenu']"
LOGOUT_LINK_LOCATOR = "//*[@id='GBLgf']"
LAST_LOGIN_LABEL_LOCATOR = "GTlastLoginLabel"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"

def click_on_system_dropdown():
    driver.click_element(SYSTEM_DROPDOWN_LOCATOR)

def click_sign_out():
    driver.click_element(LOGOUT_LINK_LOCATOR)

def click_on_logo():
    while driver.get_location()!= GlobalSettings.WELCOM_URL:
        driver.click_element(LOGO_LOCATOR)