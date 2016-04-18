#from ui.Browser import *
from globalConfig.GlobalSettings import GlobalSettings
from Selenium2Library import Selenium2Library as sel
from pages import BasePage


LOGIN_TEXT_INPUT_LOCATOR = "//*[@id='j_username']"
PASSWORD_TEXT_INPUT_LOCATOR = "//*[@name='j_password']"
SUBMIT_BUTTON_LOCATOR = "//button[@type='submit']"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
ERROR_CASE_ELEMENT = "//font[@color='red']"
OK_BUTTON_LOCATOR = "//div[@class='gwt-DialogBox'][3]//div[@class='okButton nowrap']"
ERROR_COLOR_ATTRIBUTE = "color"
ERROR_TEXT_COLOR = "red"


def open_browser_on_login_page():
    #Browser.open(GlobalSettings.LOGIN_URL)
    sel.open_browser(BasePage.driver, GlobalSettings.LOGIN_URL)

def confirm_error_message():
    #Browser.click(OK_BUTTON_LOCATOR)
    sel.click_button(BasePage.driver, OK_BUTTON_LOCATOR)


def login(user_name, password):
    #Browser.type(LOGIN_TEXT_INPUT_LOCATOR, user_name)
    #Browser.type(PASSWORD_TEXT_INPUT_LOCATOR, password)
    #Browser.click(SUBMIT_BUTTON_LOCATOR)
    sel.input_text(BasePage.driver, LOGIN_TEXT_INPUT_LOCATOR, user_name)
    sel.input_text(BasePage.driver, PASSWORD_TEXT_INPUT_LOCATOR, password)
    sel.click_button(BasePage.driver, SUBMIT_BUTTON_LOCATOR)
    try:
        confirm_error_message()
    except:
        pass


def check_error_message():
    #color = Browser.get_attribute_value_from_element(ERROR_CASE_ELEMENT, ERROR_COLOR_ATTRIBUTE)
    color = sel._get_value(BasePage.driver, ERROR_CASE_ELEMENT, ERROR_COLOR_ATTRIBUTE)
    assert color in ERROR_TEXT_COLOR