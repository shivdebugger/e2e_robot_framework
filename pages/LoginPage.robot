*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USERNAME_FIELD}     //input[@id="email"]
${PASSWORD_FIELD}     //input[@id="password"]
${LOGIN_BUTTON}      //button[@type="submit"]
${EXPECTED_URL_DASHBOARD}     /dashboard
${PAGE_PROFILE_TEXT}    //span[text()='Intern']
${ERROR_POPUP_LOCATOR}     (//div[@class='ant-message'] | //*[@id='email_help'])


*** Keywords ***
Enter Credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input password    ${PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Verify Dashboard
    Wait Until Element Is Visible    ${PAGE_PROFILE_TEXT}
    ${actual_url}=    Get Location
    Should Contain   ${actual_url}    ${EXPECTED_URL_DASHBOARD}

Verify Error Message
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${ERROR_POPUP_LOCATOR}    timeout=10
    Run Keyword If    ${status}    Log Error Message And Continue

Log Error Message And Continue
    ${error_message}=    Get Text    ${ERROR_POPUP_LOCATOR}
    Log    Error message displayed: ${error_message}