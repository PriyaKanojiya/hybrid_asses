*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource
Library     SeleniumLibrary
Library     DataDriver        file=../test_data/starbucks_auto.xlsx      sheet_name=Invalid Login Test
Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser
Test Template   Invalid Login Template

*** Test Cases ***
TC1
*** Keywords ***
Invalid Login Template
    [Arguments]     ${user_name}     ${password}     ${expected_error}
    Click Element    link=Sign in
    Input Text    name=username      ${user_name}
    Input Text    name=password       ${password}
    Click Element    xpath=//*[contains(text(),'Sign in')]
    Element Should Contain    xpath=//*[contains(text(),'Sign in')]     ${expected_error}




