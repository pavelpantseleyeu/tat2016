#from ui.Browser import Browser
from Selenium2Library import Selenium2Library as sel
from pages import BasePage

SYSTEM_DROPDOWN_LOCATOR = "//*[@id='GButtonUserMenu']"
LOGOUT_LINK_LOCATOR = "//*[@id='GBLgf']"
LAST_LOGIN_LABEL_LOCATOR = "GTlastLoginLabel"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"


def click_on_system_dropdown():
    #Browser.click(SYSTEM_DROPDOWN_LOCATOR)
    sel.click_element(BasePage.driver, SYSTEM_DROPDOWN_LOCATOR)


def click_sign_out():
    #Browser.click(LOGOUT_LINK_LOCATOR)
    sel.click_element(BasePage.driver, LOGOUT_LINK_LOCATOR)

def click_on_logo():
    for x in range(0, 3):
        #Browser.click(LOGO_LOCATOR)
        sel.click_element(BasePage.driver, LOGO_LOCATOR)


def check_url(url):
    #actual_url = Browser.get_current_url()
    actual_url = sel.get_location(BasePage.driver)
    assert actual_url in url