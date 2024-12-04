*** Settings ***
Resource    ../pages/LoginPage.robot
Resource    ../resources/commonKeywords.resource
Library     SeleniumLibrary
Resource    ../testdata/test_data.resource

Test Setup    Open Browser and Navigate to URL
Test Teardown    Close Browser and Store results

*** Test Cases ***
Login With Valid Username and Valid Password Test
    [Documentation]    This test case verifies the login functionality with Valid Username and Valid Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${username}   ${password}
    Click Login
    Verify Dashboard

Login With Invalid Username and Invalid Password Test
    [Documentation]    This test case verifies the login functionality with Invalid Username and Invalid
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${Invalid_username}   ${Invalid_password}
    Click Login
    Verify Error Message

Login With Invalid Username and Valid Password Test
    [Documentation]    This test case verifies the login functionality with Invalid Username and Valid Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${Invalid_username}    ${password}
    Click Login
    Verify Error Message

Login With Valid Username and Invalid Password Test
    [Documentation]    This test case verifies the login functionality with Valid Username and Invalid Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${username}   ${Invalid_password}
    Click Login
    Verify Error Message

Login with Empty Username and Empty Password Test
    [Documentation]    This test case verifies the login functionality with Empty Username and Empty Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${EMPTY}   ${EMPTY}
    Click Login
    Verify Error Message

Login with Empty Username and Non-Empty Password Test
    [Documentation]    This test case verifies the login functionality with Empty Username and Non-Empty Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials    ${EMPTY}   ${password}
    Click Login
    Verify Error Message

Login with Non-Empty Username and Empty Password Test
    [Documentation]    This test case verifies the login functionality with Non-Empty Username and Empty Password
    [Tags]    REGRESSION    SMOKE    DRYRUN
    Enter Credentials   ${username}   ${EMPTY}
    Click Login
    Verify Error Message

