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
    Click Element    xpath=//a[text()='Menu']
    Click Element    link=Cold Coffees
    Click Element    xpath=//*[@class='block linkOverlay__primary prodTile']