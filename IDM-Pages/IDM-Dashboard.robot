*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library			  Collections
Library           String
Library			  uuid
Library			  Dialogs


*** Variables ***
${Dashbord_btnMenuSignOut}           		//div[@id='sc-header']/div/div/div/div/ul/li[2]/a/span
${Dashbord_btnMenuSignOutConf}          	id=sign-out-link
${Dashbord_adminMenu}     			        jquery=a[data-i18n='menu.admin']:visible
${Dashbord_adminMenu_secondElement}         xpath=//*[@id="idm"]
${Dashboard_mainMenu}                       xpath=//*[@id="sc-menu"]/ul[contains(@class,"main-menu")]
${Dashboard_tabMenuName}                    xpath=//*[@id="TAB_MENU_NAME"]

*** Keywords ***
#page https://envl.portal.fxdms.net/dashboard/

Dashboard_Go to [${menu}] page
    ${Dashboard_tabMenuName}=    Replace String    ${Dashboard_tabMenuName}    TAB_MENU_NAME    ${menu}
    Wait until element is visible    ${Dashboard_tabMenuName}    1min
    Wait Until Keyword Succeeds     1 min   1 sec   Click element    ${Dashboard_tabMenuName}

Dashboard_Validate menu not present
    [Arguments]    ${menu}
    Wait until element is visible    ${Dashboard_mainMenu}    1min
    Wait Until Keyword Succeeds     1 min   1 sec   Element should not contain    ${Dashboard_mainMenu}    ${menu}

Dashboard_Validate menu present
    [Arguments]    ${menu}
    Wait until element is visible    ${Dashboard_mainMenu}    1min
    Wait Until Keyword Succeeds     1 min   1 sec   Element should contain    ${Dashboard_mainMenu}    ${menu}

Dashbord_Validate dashbord page
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   page should not contain        The credentials you provided cannot be determined to be authentic.
    Run Keyword if      '${try1Status}' == 'PASS'       page should not contain        The credentials you provided cannot be determined to be authentic.
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   Title Should Be     Dashboard
    Run Keyword if      '${try2Status}' == 'PASS'          Title Should Be     Dashboard


Dashbord_Confirm signout
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Dashbord_btnMenuSignOutConf}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Sign in

Dashbord_menu signout
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Dashbord_btnMenuSignOut}

Dashbord_go to admin page
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${Dashbord_adminMenu}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${Dashbord_adminMenu}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${Dashbord_adminMenu_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${Dashbord_adminMenu_secondElement}
    sleep       3s


