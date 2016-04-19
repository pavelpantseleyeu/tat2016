from globalConfig.GlobalSettings import GlobalSettings
from Selenium2Library import Selenium2Library as sel

driver = sel()
sel.set_selenium_implicit_wait(driver, GlobalSettings.IMPLYCITLY_WAIT)