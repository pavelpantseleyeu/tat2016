from Selenium2Library import Selenium2Library as sel
from pages import BasePage

SYSTEM_DROPDOWN_LOCATOR = "//*[@id='GButtonUserMenu']"
LOGOUT_LINK_LOCATOR = "//*[@id='GBLgf']"
LAST_LOGIN_LABEL_LOCATOR = "GTlastLoginLabel"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
driver=BasePage.driver

def click_on_system_dropdown():
    sel.click_element(driver, SYSTEM_DROPDOWN_LOCATOR)

def click_sign_out():
    sel.click_element(driver, LOGOUT_LINK_LOCATOR)

def click_on_logo():
    for x in range(0, 3):
        sel.click_element(driver, LOGO_LOCATOR)
