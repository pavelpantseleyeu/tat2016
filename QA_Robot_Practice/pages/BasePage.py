from globalConfig import GlobalSettings
from Selenium2Library import Selenium2Library as sel

driver = sel()
driver.set_selenium_implicit_wait(GlobalSettings.IMPLYCITLY_WAIT)