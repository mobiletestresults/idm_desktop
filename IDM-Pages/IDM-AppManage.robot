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
#page Application manage
${AppManage_btnApplication}     		                    css=a[href='../admin/applications-manage.html']
${AppManage_btnCreateNewApplication}                   css=a.btn.btn-success.pull-right
${AppManage_ddlNewAppOrganizattion}                     jquery=select[id='new-application-organisation']:visible
${AppManage_ddlNewAppOrganizattion_secondElement}                xpath=//*[@id="organisation"]
${AppManage_txtApplicationName}                         jquery=input[id='new-application-name']:visible
${AppManage_txtApplicationDescription}                  jquery=input[id='new-application-description']:visible
${AppManage_btnCreateNewApplicationConfirm}                   css=button[href='#']

${AppManage_ddlNewAppOrganizattionPop}              xpath=//*[@id="new-application-organisation"]
${AppManage_ddlNewAppOrganizattionPop_secondElement}          xpath=//html/body/div[1]/div[2]/form/div/div[2]/div[1]/div/div/select

${AppManage_ddlSelectOrgnizationFromList}              xpath=//*[@id="application-list"]
${AppManage_clickApp}           xpath=//*[@id="application-list"]/option[3]

*** Keywords ***

AppManage_select organization from main list
    [Arguments]    ${org}
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlSelectOrgnizationFromList}
    Run Keyword if      '${try1Status}' == 'PASS'       Select From List by label    ${AppManage_ddlSelectOrgnizationFromList}    ${org}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlSelectOrgnizationFromList}
    Run Keyword if      '${try2Status}' == 'PASS'          Select From List by label     ${AppManage_ddlSelectOrgnizationFromList}       ${org}


AppManage_validate application propaties
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Roles

AppManage_Application details for the first app listed on the textbox should reflect on Application Properties section 
    [Arguments]     ${app}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by Label  ${AppManage_ddlSelectOrgnizationFromList}        ${app}  #new line   
    ${app_name}=       Get Value    xpath=//*[@id="application-name"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${app_name}       ${app}
    ${app_des}=        Get Value     xpath=//*[@id="application-description"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${app_des}        ${app}    


# AppManage_Application details for the first app listed on the textbox should reflect on Application Properties section 
#     Wait Until Keyword Succeeds     1 min   1 sec   page should contain     FXDMS Read Only
#     ${app_name}=       Get Value    xpath=//*[@id="application-name"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${app_name}       app
#     ${app_des}=        Get Value     xpath=//*[@id="application-description"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${app_des}        app    

AppManage_select org
    [Arguments]    ${org}
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlNewAppOrganizattion}
    Run Keyword if      '${try1Status}' == 'PASS'       Select From List by label    ${AppManage_ddlNewAppOrganizattion}    ${org}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlNewAppOrganizattion_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          Select From List by label     ${AppManage_ddlNewAppOrganizattion_secondElement}       ${org}

AppManage_select org in popup
    [Arguments]    ${org}
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlNewAppOrganizattionPop}
    Run Keyword if      '${try1Status}' == 'PASS'       Select From List by label    ${AppManage_ddlNewAppOrganizattionPop}    ${org}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${AppManage_ddlNewAppOrganizattionPop_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          Select From List by label     ${AppManage_ddlNewAppOrganizattionPop_secondElement}       ${org}


#https://envl.portal.fxdms.net/up/admin/applications-manage.html page contents
AppManage_Enter application name and description
    ${Random_App_Name} =  Generate Random String  6  [UPPER]
    AppManage_select org in popup       ORG_USEREMAILFORMAT
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${AppManage_txtApplicationName}    ${Random_App_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${AppManage_txtApplicationDescription}    testapp2 description
	Wait Until Keyword Succeeds     1 min   1 sec   click button    ${AppManage_btnCreateNewApplicationConfirm}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${Random_App_Name}

AppManage_Fill out text fields
    ${Random_App_Name} =  Generate Random String  6  [UPPER]
    AppManage_select org in popup       FXAUTO
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${AppManage_txtApplicationName}    ${Random_App_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${AppManage_txtApplicationDescription}    testapp2 description
    [Return]    ${Random_App_Name}

AppManage_Click on create button
    [Arguments]     ${Random_App_Name}
    Wait Until Keyword Succeeds     1 min   1 sec   click button    ${AppManage_btnCreateNewApplicationConfirm}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${Random_App_Name}


#https://envl.portal.fxdms.net/up/admin/applications-manage.html page contents
AppManage_Select Organisation
	AppManage_select org    FXDMS

AppManage_Select ORG_USERMAILFORMAT Organisation
	AppManage_select org    ORG_USEREMAILFORMAT

#https://envl.portal.fxdms.net/up/admin/applications-manage.html page contents
AppManage_Click on Create new application
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${AppManage_btnCreateNewApplication}

#https://envl.portal.fxdms.net/up/admin/applications-manage.html page contents
AppManage_Click on Applications
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${AppManage_btnApplication}
