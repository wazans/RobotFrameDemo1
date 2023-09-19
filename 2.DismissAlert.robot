*** Settings ***
Documentation   Navigate to the JavaScript Alerts page and click on the JS Alert button dismiss
Library         SeleniumLibrary

*** Test Cases ***
Verify Text in JS Alert dismiss button
    Open Browser    http://the-internet.herokuapp.com/javascript_alerts    Firefox
    Maximize Browser Window

    Log    Opening the browser...



    # Click on the "Click for JS Alert" button
    Click Button    xpath=//button[text()='Click for JS Confirm']


    Sleep    5

    # Dismiss the alert (clicking the "CANCEL" button)
    Handle Alert    dismiss

    Sleep    5

    Capture Page Screenshot

    Capture Page Screenshot     filename=C:\\Users\\Wasim Ansari\\IdeaProjects\\RobotFW_DEmo\\TestSuites\\MyScreenshots\\new432.png



    Close Browser
