*** Settings ***
Library   AppiumLibrary
*** Test Cases ***
TC5
     Open Application    remote_url=http://localhost:4723/wd/hub
    ...    platformName=android
    ...    deviceName=vivo1920
    ...     appPackage=com.ubercab
    ...     appActivity=com.ubercab.presidio.app.core.root.RootActivity



    Set Appium Timeout    30s
    Click Element    xpath=//android.widget.Button[@text='WHILE USING THE APP']
    Wait Until Page Contains Element    xpath=//android.widget.Button[@resource-id='com.ubercab:id/welcome_screen_continue']
    Click Element    xpath=//android.widget.Button[@resource-id='com.ubercab:id/welcome_screen_continue']
    Wait Until Page Contains Element    xpath=//android.widget.Button[@resource-id='com.google.android.gms:id/cancel']
    Click Element    xpath=//android.widget.Button[@resource-id='com.google.android.gms:id/cancel']
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id='PHONE_NUMBER']
    Input Text     xpath=//android.widget.EditText[@resource-id='PHONE_NUMBER']     8390340051
    Click Element    xpath=//android.widget.Button[@resource-id='forward-button']
    Sleep    30s
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@]resource-id='com.ubercab:id/medium_nav_grid_tile_item_title']
    Click Element    xpath=//android.widget.TextView[@]resource-id='com.ubercab:id/medium_nav_grid_tile_item_title']
    Input Text    xpath=//android.widget.TextView[@resource-id='com.ubercab:id/ub__location_edit_search_pickup_view']    L&T gate 4
    Input Text    xpath=//android.widget.EditText[@text='Where to?']    Statue of unity

    ${page_source}  Get Source
    Log     ${page_source}
    Sleep    10s
    [Teardown]   Close Application