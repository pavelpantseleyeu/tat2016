from globalConfig.GlobalSettings import GlobalSettings

class Resources(object):

    ERROR_URL = GlobalSettings.LOGIN_URL + "/login?login_error=1"
    CREDENTIAL_SIZE = 5
    PROJECT_NAME_LENGTH = 19