
class GlobalSettings(object):

    PROTOCOL = "http://"
    SERVER = "ecsd001004eb.epam.com:"
    PORT = "18080"
    LOGIN_URL = PROTOCOL + SERVER + PORT + "/cmp"
    WELCOM_URL = LOGIN_URL + "/projects"
    ERROR_URL = LOGIN_URL + "/login?login_error=1"
    SELENIUM_SPEED = 0
    BROWSER = "firefox"
    USER_LOGIN = "admin"
    USER_PASSWORD = "admin"
    PAGE_LOAD_TIMEOUT = 30
    IMPLYCITLY_WAIT = 10
    PROJECT_PROCESSING_TIMEOUT = 500
