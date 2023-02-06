'''import time
from selenium import webdriver
from selenium.webdriver.common.by import By

d= webdriver.Edge()
d.maximize_window()
d.implicitly_wait(30)
d.get("https://www.starbucks.com/")
d.find_element(By.XPATH,"//a[text()='Menu']").click()
d.find_element(By.XPATH,"//*[@class='block linkOverlay__primary tile___1wb3i']").click()'''


from selenium import webdriver
from selenium.webdriver.common.by import By

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
            self.driver.find_element(By.XPATH, "//*[@class='block linkOverlay__primary tile___1wb3']").click()
        except:
            print("Invalid xpath")


s = StarbucksMenu()
while True:
    print("Enter 1 for select")
    print("Enter 2 for exception")
    print("Enter 3 for exit")
    userchoice=int(input())
    if userchoice==1:
        s.click_menu()
    elif  userchoice==2:
        s.exception1()
    elif  userchoice==3:
       quit()
