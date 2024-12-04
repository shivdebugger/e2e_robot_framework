*** Settings ***
Library    OperatingSystem
Library    Collections
Library    RequestsLibrary
Resource    ../testdata/test_data.resource
Library    ../resources/apihelper.py

*** Variables ***
${end_point}    /generateAuthToken

*** Test Cases ***
Valid Admin Credentials Test
    [Documentation]    This Test Case will verify the api response with valid test data
    ${payload}=   Create Dictionary    email=${ADMIN_USER}    password=${ADMIN_PASS}
    ${response}=    send post request    ${end_point}    ${payload}    ${200}
    log to console    ${response}
    Should Contain    ${response['status']}    Successful

Invalid Credentials Test
    [Documentation]    This Test Case will verify the api response with Invalid test data
    ${payload}=   Create Dictionary    email=${Invalid_username}    password=${Invalid_password}
    ${response}=    send post request   ${end_point}    ${payload}    ${401}
    log to console    ${response}
    Should Contain    ${response['status']}    Message
    Should Contain    ${response['message']}    Invalid Credentials!

Non Admin Role Test
    [Documentation]    This Test Case will verify the api response with non admin test data
    ${payload}=   Create Dictionary    email=${NON_ADMIN_USER}    password=${NON_ADMIN_PASS}
    ${response}=    send post request    ${end_point}    ${payload}    ${401}
    log to console    ${response}
    Should Contain    ${response['status']}    Message
    Should Contain    ${response['message']}    Invalid Credentials!

Empty Credentials Test
    [Documentation]    This Test Case will verify the api response with empty test data
    ${payload}=   Create Dictionary    email=${EMPTY}    password=${EMPTY}
    ${response}=    send post request    ${end_point}    ${payload}    ${400}
    log to console    ${response}
    Should Contain    ${response['status']}    Error
    Should Contain    ${response['error']}    "Email" is not allowed to be empty
