*** Settings ***
Library        AppiumLibrary
Suite Setup    Set Appium Timeout  10s

# Executes Start App before each test and closes the app at the end
Test Setup     Start App
Test Teardown  Close Application

Resource       login_test_data.robot

*** Variables ***
# UI texts remain in Portuguese to match the application elements
${TEXT_ELEMENT}   //android.widget.TextView[@text="Falta pouco pra matar sua fome!"]
${ERROR_MESSAGE}  //android.widget.TextView[@text="Erro ao realizar login"]

*** Keywords ***
Start App
    Open Application    http://127.0.0.1:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Pixel8
    ...                 app=${EXECDIR}/app/qazandofood.apk
    ...                 udid=emulator-5554

Fill Login And Submit
    [Arguments]    ${email_input}    ${password_input}
    Wait Until Element Is Visible    ${TEXT_ELEMENT}    10s
    
    # Clears the fields before typing to avoid caching issues
    Clear Text    accessibility_id=email
    Clear Text    accessibility_id=password
    
    # Only inputs text if the variable is not empty
    IF  '${email_input}' != '${EMPTY}'
        Input Text    accessibility_id=email    ${email_input}
    END
    
    IF  '${password_input}' != '${EMPTY}'
        Input Text    accessibility_id=password    ${password_input}
    END
    
    Click Element    accessibility_id=login-button

Validate Login Error
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    10s

*** Test Cases ***
Scenario 1: Login successfully
    Fill Login And Submit    ${EMAIL}    ${PASSWORD}
    # Success validation should be added here

Scenario 2: Try to login without password
    Fill Login And Submit    ${EMAIL}    ${EMPTY}
    Validate Login Error

Scenario 3: Try to login without email
    Fill Login And Submit    ${EMPTY}    ${PASSWORD}
    Validate Login Error

Scenario 4: Try to login without email and password
    Fill Login And Submit    ${EMPTY}    ${EMPTY}
    Validate Login Error