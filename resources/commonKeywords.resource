*** Settings ***
Library    SeleniumLibrary
Resource    ../testdata/test_data.resource
Library    OperatingSystem
Library    DateTime

*** Keywords ***
Open Browser and Navigate to URL
    [Documentation]    This is the keyword to opening a given url in the given browser
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Set Screenshot Directory    ../screenshots

Close Browser and Store results
    run keyword if test failed    Take Screenshot on failure
    Close All Browsers

Take Screenshot on failure
    ${date}=    get current date    result_format=%Y-%m-%d %H-%M-%S
    Capture Page Screenshot	    ${TEST_NAME}/${date}.png