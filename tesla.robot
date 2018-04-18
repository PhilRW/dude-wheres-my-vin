*** Settings ***
Documentation    Check on a single Tesla reservation.
Resource         resource.robot
Library          OperatingSystem
Suite Setup      Authenticate
Suite Teardown   Cleanup

*** Test Cases ***
VIN check
    Run Keyword And Continue On Failure    Page Should Contain    5YJ
    [Teardown]    Run Keyword If    '${TEST STATUS}' == 'PASS'    Notify    Tesla VIN found!
