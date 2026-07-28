# Qazando Food - Mobile Automation Tests

This repository contains automated UI tests for the Qazando Food Android application. The tests are written using **Robot Framework** and executed via **Appium**, utilizing the W3C standard with the UiAutomator2 driver.

## Project Structure

*   **`tests/login/login.robot`**: The main test suite containing the Appium keywords, setup/teardown configurations, and the test cases.
*   **`tests/login/login_test_data.robot`**: A resource file used to cleanly separate and store test data, such as login credentials.
*   **`app/qazandofood.apk`**: The target Android application binary used for local execution.

## Test Scenarios

The current test suite focuses on the authentication flow, ensuring that both successful logins and form validations behave as expected.

*   **Scenario 1: Login successfully**
    *   Inputs a valid email and password, submits the form, and validates a successful entry into the application.
*   **Scenario 2: Try to login without password**
    *   Submits the login form with a valid email but an empty password field, expecting the application to display a specific error message.
*   **Scenario 3: Try to login without email**
    *   Submits the login form with an empty email field but a valid password, verifying that the authentication is blocked and an error is shown.
*   **Scenario 4: Try to login without email and password**
    *   Submits the form with both fields completely blank, validating the application's required field error handling.

## How to Run

### Prerequisites

Ensure you have the following installed on your machine:
*   **Python 3.x**
*   **Node.js & Appium** (Version 2.x or newer)
*   **Appium UiAutomator2 Driver** (`appium driver install uiautomator2`)
*   **Robot Framework & AppiumLibrary** (`pip install robotframework robotframework-appiumlibrary`)
*   An active Android Emulator (e.g., Pixel 8) running locally.

### Running Locally (Default)

By default, the test suite is configured to target a local Appium server and Android emulator.

1. Start your Appium server in a terminal:
```bash
appium
```

Open a new terminal instance and execute the test suite:

```bash
robot tests/login/login.robot
```
