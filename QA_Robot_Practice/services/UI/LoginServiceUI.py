from pages import LoginPage
from globalConfig.GlobalSettings import GlobalSettings

def open_login_page():
    LoginPage.open_browser_on_login_page()


def login_to_clarabridge(user_name, password):
    LoginPage.login(user_name, password)


def login_as_admin():
    LoginPage.open_browser_on_login_page()
    LoginPage.login(GlobalSettings.USER_LOGIN, GlobalSettings.USER_PASSWORD)


def check_error_message_presence():
    LoginPage.check_error_message()