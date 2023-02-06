*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource
Library     SeleniumLibrary
Library     DataDriver
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser


*** Test Cases ***
TC1
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    url=https://www.starbucks.com/
    Click Element    xpath=//a[text()='Order now']
    ${var1}   Get WebElement    xpath=//*[contains(text(),'Flavors')]
    Execute Javascript      arguments[0].click()     ARGUMENTS    ${var1}
    Click Element    xpath=//p[text()='Add Caramel Syrup']
    Click Element    xpath=//p[text()='Add Hazelnut Syrup']
    ${var1}   Get WebElement    xpath=//*[contains(text(),'Toppings')]
    Execute Javascript      arguments[0].click()     ARGUMENTS    ${var1}
    Click Element    xpath=//option[text()='Barista Cocoa Powder']
    Click Element    xpath=//option[text()='Cookie Crumble Topping']