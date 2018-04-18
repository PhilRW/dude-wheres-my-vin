*** Settings ***
Documentation     Check on a single Tesla reservation.
Suite Setup       Authenticate
Suite Teardown    Cleanup
Resource          resource.robot
Library           OperatingSystem

*** Variables ***
${RESERVATION NUMBER}    123456789

*** Test Cases ***
VIN check
    Go To    ${ACCOUNT URL}/profile?rn=RN${RESERVATION NUMBER}
    Run Keyword And Continue On Failure    Page Should Contain    5YJ
    [Teardown]    Run Keyword If    '${TEST STATUS}' == 'PASS'    Notify    Tesla VIN found!
