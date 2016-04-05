from selenium import webdriver
from globalConfig.GlobalSettings import GlobalSettings


class Browser(object):
    driver = webdriver.Firefox()
    driver.implicitly_wait(GlobalSettings.IMPLICITLY_WAIT)
    driver.set_page_load_timeout(GlobalSettings.SELENIUM_DEFAULT_TIMEOUT)


    @classmethod
    def open(cls, url):
        cls.driver.get(url)


    @classmethod
    def close_browser(cls):
        cls.driver.close()


    @classmethod
    def click(cls, locator):
        elem = cls.driver.find_element_by_xpath(locator)
        elem.click()


    @classmethod
    def type(cls, locator, text):
        elem = cls.driver.find_element_by_xpath(locator)
        elem.send_keys(text)


    @classmethod
    def submit(cls, locator):
        elem = cls.driver.find_element_by_xpath(locator)
        elem.submit()


    @classmethod
    def is_present(cls, locator):
        return cls.driver.find_elements_by_xpath(locator).size() > 0


    @classmethod
    def get_test_from_element(cls, locator):
        text = cls.driver.find_element_by_xpath(locator).text
        return text