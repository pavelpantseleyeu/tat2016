def test2016():
    return TestEnvironment('http://', 'ecsd001004eb.epam.com', '18080', 'admin', 'admin')

class GlobalSettings():
    def __init__(self):
        pass

    @staticmethod
    def get_test_environment():
        return test2016()

    SELENIUM_DEFAULT_TIMEOUT = 30
    IMPLICITLY_WAIT = 30
    BROWSER = 'FIREFOX'
    LOGIN_URL = get_test_environment().protocol + get_test_environment().host + ':' + get_test_environment().port + "/cmp"

class TestEnvironment():
    def __init__(self, protocol, host, port, user, password):
        self.protocol = protocol
        self.host = host
        self.port = port
        self.user = user
        self.password = password