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
#page Group manage
#${GroupManage_btnCreateNewGroup}                       jquery=span[data-i18n='button.create-group']:visible
${GroupManage_btnCreateNewGroup}                                css=a.btn.btn-success.pull-right
${GroupManage_txtGroupName}    		            id=new-group-name
${GroupManage_txtGroupDescription}                 id=new-group-description
${GroupManage_txtGroupRolesSt1}    		           id=new-group-form-create-new-group-button
${GroupManage_txtGroupRolesSt2}    		           xpath=//html/body/div[1]/div[2]/form/div/div[2]/div[3]/div/div/div/ul/li/input
#${GroupManage_btnCreateGroup}     	            jquery=span[data-i18n='button.create-group']:visible
${GroupManage_btnCreateGroup}                      id=new-group-form-create-new-group-button
${GroupManage_txtGroupRoleItems}                 jquery=input[id='s2id_autogen118']:visible
${GroupManage_ddlOrganization}     	                    jquery=select[id='organisation']:visible
#${GroupManage_btnAddParticipant}                      	jquery=a[data-i18n='page.groups-manage.tab.title.add-parts']:visible
${GroupManage_btnAddParticipant}                      	xpath=//*[@id="tab3title"]/a
${GroupManage_btnAddParticipant_secondElement}           xpath=//html/body/div/div[2]/div[2]/div[2]/div/ul/li[3]/a
${GroupManage_btnParticipantingUsers}                      	xpath=//*[@id="tab2title"]/a
${GroupManage_btnParticipantingUsers_secondElement}          xpath=//html/body/div/div[2]/div[2]/div[2]/div/ul/li[2]/a

${GroupManage_btnParticipantSearch}                         xpath=//*[@id="search-users-submit"]
#id=search-users-submit
${GroupManage_listGroups}                           xpath=//*[@id="groupslist"]
${GroupManage_cbEmail}				                    	jquery=#results>tbody>tr:nth-child(1)>td:nth-child(1)>input[type='checkbox']
${GroupManage_btnAddParticipantSearch}                   jquery=a[id='add-selected-button']:visible
${GroupManage_btnParticipatingUsers}                      css=a[href='#tab2']
${GroupManage_cbEmailParticipant}		                    jquery=#participants>tbody>tr:nth-child(1)>td:nth-child(1)>input[type='checkbox']
${GroupManage_btnRemoveSelectedUsers}            css=a[href='#confirm-remove-action-modal']
${GroupManage_btnRemoveSelectedUsersConf}    id=confirm-remove-btn-success


${GroupManage_txtUserName_addParticipantTab}                     xpath=//*[@id="username"]
${GroupManage_cbEmail_participatingUsers}				         xpath=//*[@id="participants"]/tbody/tr/td[1]/input

${GroupManage_btnRemoveSelectedUsers_participatingUsers}				         xpath=//*[@id="group-participants-form"]/div[2]/a/i
${GroupManage_btnRemoveSelectedUsers_confirm_participatingUsers}				         xpath=//*[@id="confirm-remove-btn-success"]




*** Keywords ***
#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Click on Create new group
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${GroupManage_btnCreateNewGroup}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Enter group name description
    Wait Until Keyword Succeeds     1 min   1 sec   Wait Until Element Is Visible    ${GroupManage_btnCreateGroup}
    ${Random_Group_Name} =  Generate Random String  6  [UPPER]
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${GroupManage_txtGroupName}    ${Random_Group_Name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${GroupManage_txtGroupDescription}    usl group description
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${GroupManage_btnCreateGroup}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${Random_Group_Name}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain      Success! New group was created

#GroupManage_click Create new group button
#    Wait Until Keyword Succeeds     1 min   1 sec   Wait Until Element Is Visible    ${GroupManage_btnCreateGroup}

GroupManage_Fill-out Group name and Group description fields
    ${Random_Group_Name} =  Generate Random String  6  [UPPER]
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${GroupManage_txtGroupName}    ${Random_Group_Name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${GroupManage_txtGroupDescription}    usl group description
    [Return]    ${Random_Group_Name}

GroupManage_Select Role FXDMS Read Only
    #Wait Until Keyword Succeeds     1 min   1 sec   click element      xpath=//html/body/div[1]/div[2]/form/div/div[2]/div[3]/div/div/div/ul/li/input
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${GroupManage_txtGroupRolesSt2}    FXDMS Read Only
    Wait Until Keyword Succeeds     1 min   1 sec   Press Keys    NONE    RETURN

#    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     0 min   12 sec   wait until element is visible    ${CollaborationV2_3_txtTags}
#    Run Keyword if      '${try1Status}' == 'PASS'       input text		${CollaborationV2_3_txtTags} 	Belongs to collection
#    Run Keyword if      '${try1Status}' == 'PASS'       Press Key    ${CollaborationV2_3_txtTags}    \\13
#    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${CollaborationV2_3_txtTags_secondElement}
#    Run Keyword if      '${try2Status}' == 'PASS'       input text		${CollaborationV2_3_txtTags_secondElement} 	Belongs to collection
#    Run Keyword if      '${try2Status}' == 'PASS'       Press Key    ${CollaborationV2_3_txtTags_secondElement}    \\13

GroupManage_Click create new group button
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${GroupManage_btnCreateGroup}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain      Success! New group was created


GroupManage_select ORG_USERMAILFORMAT organization
	GroupManage_select org    ORG_USEREMAILFORMAT

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_select organization
	GroupManage_select org    USL

GroupManage_select org
    [Arguments]    ${org}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by Label     ${GroupManage_ddlOrganization}    ${org}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Click on Add Participants
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${GroupManage_btnAddParticipant}
    Run Keyword if      '${try1Status}' == 'PASS'       click element    ${GroupManage_btnAddParticipant}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${GroupManage_btnAddParticipant_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element    ${GroupManage_btnAddParticipant_secondElement}

GroupManage_Click on Participating users
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${GroupManage_btnParticipantingUsers}
    Run Keyword if      '${try1Status}' == 'PASS'       click element    ${GroupManage_btnParticipantingUsers}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${GroupManage_btnParticipantingUsers_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element    ${GroupManage_btnParticipantingUsers_secondElement}

GroupManage_Select desired group
    [Arguments]     ${group_name}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label    ${GroupManage_listGroups}       ${group_name}

GroupManage_Search for usename
    [Arguments]     ${usename}
    Wait Until Keyword Succeeds     1 min   1 sec   input text      ${GroupManage_txtUserName_addParticipantTab}       ${usename}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Click on Search
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_btnParticipantSearch}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    Results
    sleep   3s

GroupManage_user should be listed
    [Arguments]     ${user}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    ${user}
    sleep  3s


GroupManage_user should not be listed anymore
    [Arguments]     ${user}
    Wait Until Keyword Succeeds     1 min   1 sec   page should not contain    ${user}
    sleep       5s

GroupManage_Click on the confrim button
    Wait Until Keyword Succeeds     1 min   1 sec   click element      ${GroupManage_btnRemoveSelectedUsers_confirm_participatingUsers}


GroupManage_Click on the Remove selected users button
    Wait Until Keyword Succeeds     1 min   1 sec   click element       ${GroupManage_btnRemoveSelectedUsers_participatingUsers}

GroupManage_Tick on the check box of the user
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_cbEmail_participatingUsers}

GroupManage_click user to be added
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_cbEmail}

GroupManage_click add user button
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_btnAddParticipantSearch}
	sleep      6s


#GroupManage_Click on Search
#	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_btnParticipantSearch}
#	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_cbEmail}
#	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${GroupManage_btnAddParticipantSearch}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Search for the use previously added User
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${GroupManage_btnParticipatingUsers}
	#Wait Until Keyword Succeeds     1 min   1 sec   page should contain    fujitest007+Emailformat@gmail.com

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Click on Participanting users
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${GroupManage_btnParticipatingUsers}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Select users you want to remove
	#Wait Until Keyword Succeeds     1 min   1 sec   click element    ${GroupManage_cbEmailParticipant}
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${GroupManage_cbEmailParticipant}
    Run Keyword if      '${try1Status}' == 'PASS'       click element    ${GroupManage_cbEmailParticipant}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     log to console      \n Participated users are not in the list.
    Run Keyword if      '${try2Status}' == 'PASS'          click element    ${GroupManage_cbEmailParticipant}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Click on Remove selected users
	Wait Until Keyword Succeeds     1 min   1 sec   click link    ${GroupManage_btnRemoveSelectedUsers}
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${GroupManage_btnRemoveSelectedUsersConf}

#page Group Manage https://envl.portal.fxdms.net/up/admin/groups-manage.html
GroupManage_Search for the use previously removed
	#Wait Until Keyword Succeeds     1 min   1 sec   page should not contain    fujitest007+Emailformat@gmail.com
	Wait Until Keyword Succeeds     1 min   1 sec   page should not contain    fujitest007+Autouser1@gmail.com



