*** Settings ***
Documentation     A resource file for checking on a Tesla Account.
Library           SeleniumLibrary     run_on_failure=NOTHING

*** Variables ***
${USERNAME}       user@example.com
${PASSWORD}       thisisabadpassword
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      https://auth.tesla.com/login
${ACCOUNT URL}    https://www.tesla.com/teslaaccount
${PUSHBULLET KEY}    x.12345678911234567892123456789312

*** Keywords ***
Open Browser To Login Page
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    Tesla SSO – Login

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    Sign In

Authenticate
    Open Browser To Login Page
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Submit Credentials
    Title Should Be    Tesla Account | Tesla

Notify
    [Arguments]    ${message}
    Run    export PUSHBULLET_KEY=${PUSHBULLET KEY} && pb push "${message}"

Cleanup
    Close Browser
