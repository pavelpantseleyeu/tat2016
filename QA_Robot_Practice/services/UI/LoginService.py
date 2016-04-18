from globalConfig.GlobalSettings import GlobalSettings
from pages import LoginPage


def open_login_page():
    LoginPage.open_browser_on_login_page()

def login_to_clarabridge(user_name=GlobalSettings.USER_LOGIN, password=GlobalSettings.USER_PASSWORD):
    LoginPage.login(user_name, password)

def login_as_admin():
    open_login_page()
    LoginPage.login(GlobalSettings.USER_LOGIN, GlobalSettings.USER_PASSWORD)

def check_location(url):
    LoginPage.check_url(url)

def check_error_message_presence():
    LoginPage.check_error_message()