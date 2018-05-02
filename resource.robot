*** Settings ***
Documentation     A resource file for checking on a Tesla Account.
Library           SeleniumLibrary

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
