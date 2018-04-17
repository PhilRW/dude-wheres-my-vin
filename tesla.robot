*** Settings ***
Documentation    Check on a single Tesla reservation.
Resource         resource.robot
Library          OperatingSystem
Suite Setup      Authenticate
Suite Teardown   Cleanup

*** Test Cases ***
Configured check
    Page Should Contain    Your delivery profile is complete.

VIN check
    Run Keyword And Continue On Failure    Page Should Contain    VIN
    [Teardown]    Run Keyword If    '${TEST STATUS}' == 'PASS'    Notify    Tesla VIN found!
