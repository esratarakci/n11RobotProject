*** Settings ***
Library           Selenium2Library
Library           DebugLibrary
Library           String
Resource          ../Facilities/MainFunctions.robot
Resource          ../Resources/MainVariables.robot
Resource          ../Resources/BasketVariables.robot

*** Keywords ***

Basket Process
    Sleep   2s
    Wait And Click Element  ${addBasketButton}
    Sleep   1s
    Wait And Click Element  ${addBasketButton}
    Wait And Click Element  ${goToBasket}
    Sleep   3s
    Wait And Click Element  ${closePopupButton}
    Sleep   2s
    Get Basket Price Value
    Compare Price
    Add and Check Quantity
    Delete Product

Get Basket Price Value
    ${basketPriceValue}=  Get Element Attribute   ${priceTextfromBasket}    value
    ${basketPriceValue}=  Convert To String    ${basketPriceValue}
    ${basketPriceValue}=  Strip String     ${SPACE}${basketPriceValue}${SPACE}
    log to console  \nPrice Value from Basket: ${basketPriceValue}
    Set Global Variable     ${basketPriceValue}

Compare Price
    ${status}    ${value}=  Run Keyword And Ignore Error   Should Be Equal   ${priceValue}    ${basketPriceValue}
    Run Keyword If    '${status}'=='PASS'    log to console    \nprices are identical
    ...     ELSE    log to console  \nprices are different
    Sleep    4s

Add and Check Quantity
    Wait And Click Element  ${plusButton}
    Sleep   1s
    ${quantityValue}=   Get Element Attribute   ${quantity}     value
    ${quantityValue}=   Convert To String   ${quantityValue}
    Sleep   1s
    ${status}    ${value}=  Run Keyword And Ignore Error   Should Be Equal As Strings   ${quantityValue}    2
    Run Keyword If    '${status}'=='PASS'    log to console    \nquantity:2
    ...     ELSE   log to console   \nquantity is not 2

Delete Product
    Wait And Click Element  ${deleteButton}
    Sleep   1s
    Reload Page
    Sleep   5s
    ${status}    ${value}=  Run Keyword And Ignore Error   Page Should Contain Element   ${sepetinizBosLabel}
    Run Keyword If    '${status}'=='PASS'    log to console    \nproduct has been deleted.
    ...     ELSE    log to console  \nproduct has not been deleted.

