*** Settings ***
Test Setup        Launch Browser
Test Teardown     When Test Fail Take Screenshot
Library           Selenium2Library
Library           DebugLibrary
Resource          ../Facilities/MainFunctions.robot
Resource          ../Facilities/SearchProductFacilities.robot
Resource          ../Facilities/BasketFacilities.robot

*** Test Cases ***

00. n11 Test Case
    Search Computer
    Basket Process





