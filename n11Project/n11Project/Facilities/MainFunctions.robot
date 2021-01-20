*** Settings ***
Library           Selenium2Library
Resource          ../Resources/MainVariables.robot



*** Keywords ***

Launch Browser
    Set Screenshot Directory  ${CURDIR}/../Tests/testresults/${TEST_NAME}
    Chrome    ${n11_URL}    alias=Main

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Chrome
    [Arguments]   ${URL}   ${alias}=None
    ${chrome_options}=    Set Chrome Options
    ${disableLogging}=    Set Variable    --log-level=3
    Call Method   ${chrome_options}    add_argument    ${disableLogging}
    Create Webdriver    Chrome   ${alias}   chrome_options=${chrome_options}
    Log To Console    \nCreated WebDriver..
    Set Screenshot Directory  ${CURDIR}/../Tests/testresults/${TEST_NAME}
    Go To  ${URL}
    Maximize Browser Window
    Capture Page Screenshot

When Test Fail Take Screenshot
    Run Keyword If Test Failed    Capture Page Screenshot
    Run Keyword If Test Failed    Close All Browsers
    Run Keyword If Test Passed    Close All Browsers

Wait For Element
    [Arguments]    ${element}    ${timeout}=90 sec    ${interval}=1 sec
    Wait Until Keyword Succeeds    ${timeout}    ${interval}    Page Should Contain Element    ${element}
    Capture Page Screenshot

Wait And Click Element
    [Arguments]    ${element}    ${timeout}=60 sec    ${interval}=1 sec
    wait for element    ${element}    ${timeout}    ${interval}
    click element    ${element}

Wait And Send Text
    [Arguments]    ${element}    ${text}    ${timeout}=20 sec    ${interval}=1 sec
    wait for element    ${element}    ${timeout}    ${interval}
    Input Text    ${element}    ${text}