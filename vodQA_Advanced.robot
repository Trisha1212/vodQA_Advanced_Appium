*** Settings ***
Test Setup    Open the application
Test Teardown    Close the application
Library    AppiumLibrary
Library    OperatingSystem
Library    Process
Library    CustomLibrary.py
*** Variables ***
${platform_version}    "6.0.1"
${apk_path}    "${EXECDIR}//app.apk"
${udid}    "0515444646413736"
${phone_name}  "Note5"
${platform_name}    "Android"    
${appium_command}    appium --command-timeout "7200" --debug-log-spacing --platform-version ${platform_version} --platform-name ${platform_name} --app ${apk_path} --udid ${udid} --device-name ${phone_name} --launch-timeout "90000" 
${menu_button}    //android.widget.ImageButton
${input_control_menu}    //android.widget.TextView[@text='Input Controls']
${text_field_subheader}    //android.widget.TextView[@text='Text Field']
${text_field_id}    //android.widget.EditText
${checkbox_subheader}   //android.widget.TextView[@text='Checkbox']
${unchecked_text}    //android.widget.TextView[@text='Unchecked']
${checked_text}    //android.widget.TextView[@text='Checked']
${check_box_id}    //android.widget.CheckBox
${alert_menu}    //android.widget.TextView[@text='Alerts']
${alert_subheader}   //android.widget.TextView[@text='Alerts and Dialogs']
${alert_button}    //android.widget.Button[@text='ALERT']
${alert_message}    //android.widget.TextView[@text='This is the alert message']
${toast_button}    //android.widget.Button[@text='TOAST']
${text_data}    vodQA is awesome!
${native_components_menu}    //android.widget.TextView[@text='Native Components']
${content_scrolling_header}   //*[@text="Content Scrolling" ]
${toggle_button}    //android.widget.Switch
*** Test Cases ***
Verify TextField
    Given I navigate to the side menu bar
    When I click on Input Controls menu
    And I can see the input controls page
    And I should be able to enter text on the textfield
Verify Checkbox
    Given I navigate to checkbox page
    When I select checkbox
    Then I should see the Checked status
Verify Alert Message
    Given I navigate to alert page
    When I click on ALERT button
    Then I should see the alert message
Verify User can scroll down 5 times
    Given I naviage to content scrolling page
    And I should be able to scroll down 5 times
Verify Toast Message
    Given I navigate to alert page
    When I click on TOAST button
    Verify Text Present On Image    Toast_ocr    i love testing
Verify the colour change when click on toggle button
    Given I navigate to toggle button page
    When I swipe right three times
    And I click on toggle button
    Then I should see yellow colour
*** Keywords ***
Then I should see yellow colour
    Image Should Be Visible    yellow   0.8
And I click on toggle button
    #Click   ${toggle_button}
    Click Using Image    toggle    0.5
Given I navigate to toggle button page
    Given I navigate to the side menu bar
    When I click on Input Controls menu
When I swipe right three times
    Swipe Right   3
And I should be able to scroll down 5 times
    Swipe Down   5   
Given I naviage to content scrolling page
    Given I navigate to the side menu bar
    And I click on native components menu
And I click on native components menu
    Click    ${native_components_menu}
    Click    ${content_scrolling_header}
    Get Screen Size
Then I should see the Checked status
    Wait Until Page Contains Element  ${checked_text} 
When I select checkbox
    Click   ${check_box_id} 
Given I navigate to checkbox page
    Given I navigate to the side menu bar
    When I click on Input Controls menu
    Then I shoud be able to click on checkbox header
Then I shoud be able to click on checkbox header
    Click   ${checkbox_subheader}
And I should be able to enter text on the textfield
    Type   ${text_field_id}   ${text_data}
And I can see the input controls page
    Wait Until Page Contains Element  ${text_field_id}
When I click on Input Controls menu
    Click   ${input_control_menu}
    Wait Until Page Contains Element  ${text_field_subheader}
Click
    [Arguments]    ${id}
    Wait Until Page Contains Element    ${id}
    Click Element    ${id}
Type
    [Arguments]    ${id}   ${text}
    Wait Until Page Contains Element    ${id}
    Input Text   ${id}     ${text}
    Hide Keyboard
Given I navigate to the side menu bar
    Click    ${menu_button}
    Wait Until Page Contains Element    ${input_control_menu}
Print
    [Arguments]  ${msg}
    Log  ${msg}
Open the application
    Start the appium server
    Open Application    http://127.0.0.1:4723/wd/hub   
Close the application
    Close Application
    Kill Node Instances
Start the appium server
    Kill Node Instances
    Log To Console        ${appium_command} 
    CustomLibrary.Start Appium Server  ${appium_command}
    Sleep   10s
Kill Node Instances
    #OperatingSystem.Run    taskkill.exe /F /IM node.exe
    Run Command    killall node
Given I navigate to alert page
    Click    ${menu_button}
    Click    ${alert_menu} 
    Wait Until Page Contains Element    ${alert_subheader} 
When I click on ALERT button
    Click    ${alert_button}
Then I should see the alert message
    Wait Until Page Contains Element    ${alert_message} 
When I click on TOAST button
    Click    ${toast_button}
Click Using Image
    [Arguments]    ${image}   ${threshold}
    ${x}    ${y}=    Find Coordinates Of Image     ${image}   ${threshold}
    Click Element At Coordinates     ${x}    ${y}
