from selenium import webdriver
from globalConfig.GlobalSettings import GlobalSettings


class Browser(object):
    driver = webdriver.Firefox()
    driver.implicitly_wait(GlobalSettings.IMPLYCITLY_WAIT)
    driver.set_page_load_timeout(GlobalSettings.PAGE_LOAD_TIMEOUT)


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
    def get_current_url(cls):
        return cls.driver.current_url


    @classmethod
    def get_text_from_element(cls, locator):
        text = cls.driver.find_element_by_xpath(locator).text
        return text


    @classmethod
    def get_attribute_value_from_element(cls, locator, attribute):
        attribute_value = cls.driver.find_element_by_xpath(locator).get_attribute(attribute)
        return attribute_value