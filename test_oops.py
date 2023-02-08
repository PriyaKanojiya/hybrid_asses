import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By


class menu():
    def click_menu():
        return 0


class Starbucks:
    def __init__(self, browser='Edge'):
        if browser == 'Edge':
            self.driver = webdriver.Edge()
        else:
            self.driver = webdriver.Firefox()
        self.driver.maximize_window()
        self.driver.implicitly_wait(10)

    def navigate_to_starbucks(self):
        self.driver.get("https://www.starbucks.com/")

    def click_menu(self):
        self.driver.find_element(By.XPATH,"//a[text()='Menu']").click()
        self.driver.find_element(By.XPATH,"//*[@class='block linkOverlay__primary tile___1wb3i']").click()


class StarbucksMenu(Starbucks):
    def __init__(self, browser='Edge'):
        Starbucks.__init__(self, browser)
        self.navigate_to_starbucks()

    def exception1(self):
        self.navigate_to_starbucks()
        try:
            self.driver.find_element(By.XPATH,"//*[@class='block linkOverlay__primary tile___1wb3']").click()
        except:
            print("Invalid xpath")\

@pytest.mark.fixture()
def StarbucksMenu():
    s = StarbucksMenu()
    yield s
    s.driver.quit()

def test_click_menu(s):
    s.click_menu()
    assert s.driver.current_url == "https://www.starbucks.com/menu"

def test_exception1(s):
    s.exception1()
    assert "Invalid xpath" in s.driver.page_source
