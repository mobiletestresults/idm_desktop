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

#page Role manage
${Role_btnRoles}     			                    css=a[href='../admin/roles-manage.html']
${Role_btnRoles_secondElement}                                                        //*[@id="app-submenu"]/li[4]/a
${Role_btnCreateRoles}     	                    id=create-role-button
${Role_txtRolesName}    		                        id=new-role-name
${Role_txtRolesRoleDes}                            id=new-role-description
#${TXTX_ROLE_DIV}    		jquery=input[class='select2-input']:visible
#${TXTX_ROLE}    			jquery=select[id='new-role-groups']
#${GroupManage_btnRemoveSelectedUsers}     jquery=button[data-i18n='button.create']:visible
${Role_btnCreateRoleConfirm}                    css=button[href='#']
${Role_btnAddRoleParticipant}                     xpath=//*[@id="tab3title"]/a
#css=a[href='#tab3']
${Role_btnAddSelectedUsers}                     xpath=//*[@id="add-selected-button"]
${Role_btnParticipatingUsers}                css=a[href='#tab2']
${Role_btnParticipatingUsersSearch}				xpath=//*[@id="search-users"]/div[4]/button[1]
#css=#search-users div:nth-of-type(4) button:nth-of-type(1)
${Role_btnAddParticipat_Username}            xpath=//*[@id="username"]
${Role_ddlOrganization}     	                    jquery=select[id='organisation']:visible

${Role_listRoles}     	                            xpath=//*[@id="roleslist"]
${Role_cbUserInResult}     	                        xpath=//*[@id="results"]/tbody/tr/td[1]/input
${Role_cbUserInResult_participatingUserTab}     	                xpath=//*[@id="participants"]/tbody/tr/td[1]/input
${Role_txtfilter_participatingUserTab}                  xpath=//*[@id="participants_filter"]/label/input

${Role_btnRemoveSelected}                  xpath=//*[@id="role-participants-form"]/div[2]/a
${Role_btnRemoveSelected_confirm}                  xpath=//*[@id="confirm-remove-btn-success"]
${Role_txtAddGroups}            xpath=//*[@id="s2id_new-role-groups"]/ul/li/input
${role_clickFXDMS}              xpath=//*[@id="roleslist"]/optgroup[3]/option[1]
${Role_tbl_participatingUser}                   xpath=//tr[@class="odd"][1]/td[@class][2]

*** Keywords ***
Role_user should not be in the list
    Wait Until Keyword Succeeds     1 min   1 sec       page should contain   No users found in role

Role_Press Remove selected users confirm
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_btnRemoveSelected_confirm}
    sleep       8s

Role_Press Remove selected users
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_btnRemoveSelected}


Role_Tick on the check box of the user in participating tab
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_cbUserInResult_participatingUserTab}

Role_Filter usename
    [Arguments]     ${user_name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtfilter_participatingUserTab}    ${user_name}
    Wait Until Keyword Succeeds     1 min   1 sec   Press Keys    ${Role_txtfilter_participatingUserTab}    RETURN

Role_Tick on the check box of the user
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_cbUserInResult}

Role_On roles list Select role
    [Arguments]     ${role}
    Wait Until Keyword Succeeds     1 min   1 sec  Select From List by label   ${Role_listRoles}    ${role}

Role_validate role propaties
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Role name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Role description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Groups
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application

Role_validate role propaties text boxes values
    [Arguments]     ${role}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List By Label   ${Role_listRoles}    ${role}   #new line and variable
    ${role_name}=       Get Value    xpath=//*[@id="role-name"] 
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${role_name}       ${role}
    ${role_des}=       Get Value    xpath=//*[@id="role-description"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${role_des}       ${role}


# Role_validate role propaties text boxes values
#     Wait Until Keyword Succeeds     1 min   1 sec   page should contain     FXAUTO
#     ${role_name}=       Get Value    xpath=//*[@id="role-name"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${role_name}       FXDMS Read Only
#     ${role_des}=       Get Value    xpath=//*[@id="role-description"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${role_des}       FXDMS Read Only


#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Enter group name description for roles
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtRolesName}    uslrole
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtRolesRoleDes}    uslroledes
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_btnCreateRoleConfirm}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain     uslrole

  

Role_Fill-out text fields
    ${Random_Role_Name} =  Generate Random String  6  [UPPER]
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtRolesName}    uslrole ${Random_Role_Name}
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtRolesRoleDes}    uslroledes
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Role_txtAddGroups}    AutomationTestGroup
    Wait Until Keyword Succeeds     1 min   1 sec   Press Keys    NONE    RETURN
	[Return]    uslrole ${Random_Role_Name}

Role_Click create buton
    [Arguments]     ${Random_Role_Name}
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Role_btnCreateRoleConfirm}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain     ${Random_Role_Name}


#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Click on Participating Users
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${Role_btnParticipatingUsers}

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Click on roles
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${Role_btnRoles}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${Role_btnRoles}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${Role_btnRoles_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${Role_btnRoles_secondElement}

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_select role organization
    [Arguments]    ${org}
	Role_select org      ${org}

Role_select ORG_USERMAILFORMAT organization
	Role_select org    ORG_USEREMAILFORMAT

Role_select org
    [Arguments]    ${org}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label    ${Role_ddlOrganization}    ${org}


#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Click on Add role Participants
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${Role_btnAddRoleParticipant}

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Search for usename
    [Arguments]     ${username}
    Wait Until Keyword Succeeds     1 min   1 sec   input text      ${Role_btnAddParticipat_Username}       ${username}

Role_Click on users Search
	Wait Until Keyword Succeeds     1 min   1 sec   click button   ${Role_btnParticipatingUsersSearch}

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Select users you want to add
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_cbEmail}

Role_Click on Add selected users
    Wait Until Keyword Succeeds     1 min   1 sec   click link   ${Role_btnAddSelectedUsers}
    sleep   60s

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_Click on Create new Role
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${Role_btnCreateRoles}

#https://envl.portal.fxdms.net/up/admin/roles-manage.html
Role_verify participated user
	#Wait Until Keyword Succeeds     1 min   1 sec       page should contain    fujitest007+Emailformat@gmail.com
	Wait Until Keyword Succeeds     1 min   1 sec       page should contain    fujitest007+Autouser1@gmail.com

Role_user should be listed
   [Arguments]     ${user}
   Wait Until Element contains     ${Role_tbl_participatingUser}     ${user}    60s

Role_verify participated user for smoke
    sleep   5s
	#Wait Until Keyword Succeeds     1 min   1 sec       page should contain    fujitest007+Emailformat@gmail.com
	Wait Until Keyword Succeeds     1 min   1 sec       page should contain    fujitest007+Autouser1@gmail.com