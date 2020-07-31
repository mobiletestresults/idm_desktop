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
#page Organization Manage
${Organization_btnCreateOrganization}                      xpath=//html/body/div/div[2]/div[2]/div[1]/div[2]/div/div/a/span
${Organization_btnCancelPopupOrganization}                    //div[@id='new-organisation-modal']/div[3]/button[2]
${Organization_txtCode}    			            id=new-organisation-code
${Organization_txtName}    			            id=new-organisation-name
${Organization_txtTimeOut}    			           id=new-org-timeout

${Organization_btnNewOrganization}                         css=#new-organisation-modal > div.modal-footer > button.btn.btn-primary
${Organization_txtOrganizationDesciption}    	                    id=new-organisation-description

${Organization_selectOrg}    	                    id=organisation-list

${Organization_txtEditOrgCode}                    id=organisation-code
${Organization_txtEditOrgName}                    id=organisation-name
${Organization_txtEditOrgDescription}                    id=organisation-description
${Organization_selectEmailType}    	                    id=org-usernameIsEmail
${Organization_txtOrgTimeout}             id=org-timeout
${Organization_btnUpdateOrg}             css=button.btn.btn-primary


${Organization_txtOrgUnit}                    id=new-organisation-unit
${Organization_btnAddOrgUnit}                css=button.btn


*** Keywords ***

Organization_error message validation for timout
    [Arguments]    ${msg}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${msg}

Organization_Input timeout
    [Arguments]    ${to}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtTimeOut}       ${to}


Organization_Validate error messages for all empy fields
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     You must enter an organisation code
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     You must enter an organisation name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     You must enter an organisation description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     You must enter a session time-out

Organization_Click Create Button without filling values
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtTimeOut}    ${EMPTY}
    Organization_Click on Create

Organization_validate organization name exits
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation already exists

Organization_Input name in New organisational unit text field
    ${Random_Org_UNIT} =  Generate Random String  6  [UPPER]
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtOrgUnit}    UNIT_${Random_Org_UNIT}
	Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Organization_btnAddOrgUnit}

Organization_Successful update
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Successful update

Organization_Edit Organisation details
    ${Random_Org_Name} =  Generate Random String  6  [UPPER]
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtEditOrgCode}    USL_${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtEditOrgName}    USL_${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtEditOrgDescription}    USL_DES_${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label     ${Organization_selectEmailType}    Plain text
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtOrgTimeout}    40
	Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Organization_btnUpdateOrg}

Organization_Select organization
    [Arguments]     ${org}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label    ${Organization_selectOrg}    ${org}

Organization_Verify empty form
    ${text_org_code} =  Get Value  ${Organization_txtCode}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal  ${text_org_code}  ${EMPTY}
    ${text_org_name} =  Get Value  ${Organization_txtName}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal  ${text_org_name}  ${EMPTY}
    ${text_org_des} =  Get Value  ${Organization_txtOrganizationDesciption}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal  ${text_org_des}  ${EMPTY}


Organization_Cancel popup
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Organization_btnCancelPopupOrganization}

Organization_Enter Organisation details with name alrady exist
    ${Random_Org_TEXT} =  Generate Random String  6  [UPPER]
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtCode}    ${Random_Org_TEXT}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtName}    USL
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtOrganizationDesciption}    USLDES
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtTimeOut}    10


#https://envl.portal.fxdms.net/up/admin/organisations-manage.html
Organization_Verify new organisation name exists
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain    USL

#https://envl.portal.fxdms.net/up/admin/organisations-manage.html
Organization_Click on Create
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${Organization_btnNewOrganization}
	sleep   4s

#https://envl.portal.fxdms.net/up/admin/organisations-manage.html
Organization_Enter Organisation details
    ${Random_Org_Name} =  Generate Random String  6  [UPPER]
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtCode}    ${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtName}    ${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Organization_txtOrganizationDesciption}    AUTO_USLDES
	sleep   3s
    [Return]  ${Random_Org_Name}

Organization_Created Organisation verify
    [Arguments]     ${Random_Org_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${Random_Org_Name}
	sleep   3s

#https://envl.portal.fxdms.net/up/admin/organisations-manage.html
Organization_Click on Create new Organisation
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Organization_btnCreateOrganization}
