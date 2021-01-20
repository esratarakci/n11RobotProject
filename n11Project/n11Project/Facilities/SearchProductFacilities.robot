*** Settings ***
Library           Selenium2Library
Resource          ../Facilities/MainFunctions.robot
Resource          ../Resources/MainVariables.robot
Resource          ../Resources/SearchProductVariables.robot
Library           Selenium2Library

*** Keywords ***

Search Computer
    Sleep   5s
    Wait And Click Element  ${closePopupButton}
    Wait And Click Element  ${laterButton}
    Wait And Click Element  ${searchInputBox}
    Wait And Send Text      ${searchInputBox}   bilgisayar
    Press Keys  ${searchInputBox}   ENTER
    Sleep  3s
    Select First Product
    Get Price Value

Select First Product
    Wait And Click Element  ${firstProduct}
    Sleep   2s

Get Price Value
    ${priceValue}=  Get Text   ${priceText}
    ${priceValue}=  Convert To String   ${priceValue}
    ${priceValue}=  Remove String   ${priceValue}      TL
    ${priceValue}=  Strip String     ${SPACE}${priceValue}${SPACE}
    log to console  \nPrice: ${priceValue}
    Set Global Variable     ${priceValue}

