import sys
sys.path.append("../pages")
sys.path.append("../globalConfig")
import GlobalSettings
import LoginPage

def open_login_page():
    LoginPage.open_browser_on_login_page()

def login_to_clarabridge(user_name, password):
    LoginPage.login(user_name, password)

def login_as_admin():
    LoginPage.open_browser_on_login_page()
    LoginPage.login(GlobalSettings.USER_LOGIN, GlobalSettings.USER_PASSWORD)

