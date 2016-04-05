from globalConfig.GlobalSettings import GlobalSettings
from ui.Browser import Browser

LOGIN_TEXT_INPUT_LOCATOR = "//input[@id='j_username']"
PASSWORD_TEXT_INPUT_LOCATOR = "//input[@id='j_password']"
SUBMIT_BUTTON_LOCATOR = "//button[@type='submit']"
ERROR_CASE_ELEMENT = "//font[@color='red']"


def open_login_page():
    Browser.open(GlobalSettings.LOGIN_URL)


def login_in(user):
    Browser.type(LOGIN_TEXT_INPUT_LOCATOR, user.login)
    Browser.type(PASSWORD_TEXT_INPUT_LOCATOR, user.password)
    Browser.submit(SUBMIT_BUTTON_LOCATOR)


def is_login_error_message_present():
    return Browser.is_present(ERROR_CASE_ELEMENT)