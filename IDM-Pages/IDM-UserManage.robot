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
#page https://envl.portal.fxdms.net/up/admin/users-manage.html
${User_btnAdminUser}     			    jquery=a[data-i18n='submenu.admin.users']:visible
${User_btnAdminUserUrl}                https://envl.portal.fxdms.net/up/admin/users-manage.html
${User_btnCreateUser}     	            jquery=span[data-i18n='button.create-user']:visible
${User_btnCreateUserUrl}     	        //*[@id="manage-users"]/div[5]/a/span

#POPUP from admin/user-manage FORM-Create New User
${User_txtUsername}                          jquery=input[id='create-user-username']:visible
${User_txtSearchUsername}                          xpath=//*[@id="username"]
${User_txtSearchFirstName}                          xpath=//*[@id="firstname"]
${User_txtSearchLastName}                          xpath=//*[@id="surname"]
${User_txtFilter}                           xpath=//*[@id="results_filter"]/label/input
${User_btnCancel}                           xpath=//*[@id="validation-reset"]

${User_txtUserEmail}    		            jquery=#create-user-email
${User_txtUserFirstName}    	            jquery=input[id='create-user-firstname']:visible
${User_txtUserSurName}    		            jquery=input[id='create-user-surname']:visible
${User_txtUserMobile}    		            jquery=input[id='create-user-mobile']:visible
${User_txtUserPhone}    		            jquery=input[id='create-user-phone']:visible
${User_txtUserGroups}    		            xpath=//*[@id="s2id_autogen9"]
${User_activeDesendentGroups}    		    jquery=input[area-activedescendant='select2-result-label-553']:visible
${User_txtUserRoles}    		            jquery=input[id='s2id_autogen2']:visible
${User_selectUserGroups}                    jquery=input[aria-activedescendant='select2-result-label']:visible
${User_btnCreateNewUserConfirm}              xpath=//*[@id="create-user-submit"]
${User_btnCreateNewUserConfirm_secondElement}        xpath=//html[@class=' js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths']/body[@class='ember-application modal-open']/div[@id='ember285']/div[@class='container']/div[@id='create-user-modal']/form[@id='create-user-form']/div[@class='modal-footer']/button[@id='create-user-submit']/span

#page User Manage
${User_menuOrgnaization}              				css=a.dropdown-toggle
${User_menuOrgnaization_secondElement}               xpath=//*[@id="app-submenu"]/li[3]/a/span

${User_menuOrgnaizationMod}                       css=a[href='../admin/organisations-manage.html']
${User_menuOrgnaizationMod_secondElement}                                 xpath=//*[@id="app-submenu"]/li[3]/ul/li[1]/a

${User_menuGroups_secondElement}    			                jquery=a[data-i18n='submenu.admin.groups']:visible
${User_menuGroups}                    							css=a[href='../admin/groups-manage.html']
${User_menuOrgPasswordPolicy}                    	xpath=//*[@id="app-submenu"]/li[3]/ul/li[3]/a
${User_btnRemoveSelectedUsers}                               jquery=span[data-i18n='button.remove-users']:visible

${User_btnSearchUsrs}                       xpath=//*[@id="search-users-submit"]
${User_btnFirstUserOnTable}                 xpath=//*[@id="results"]/tbody/tr[1]/td[1]

${User_btnUserpermissionTabOnPopup}         xpath=//*[@id="edit-user-modal"]/div[2]/div/ul/li[2]/a
${User_btnUserContactInfoTabOnPopup}        xpath=//*[@id="edit-user-modal"]/div[2]/div/ul/li[3]/a
${User_btnUserDetailsTabOnPopup}            xpath=//*[@id="edit-user-modal"]/div[2]/div/ul/li[1]/a

${User_btnGroupParticipatingUsers}          xpath=//*[@id="tab2title"]/a
${User_btnGroupParticipatingUsers_secondElement}           xpath=//html/body/div/div[2]/div[2]/div[2]/div/ul/li[2]/a

${User_btnGroupAddParticipating}            xpath=//*[@id="tab3title"]/a
${User_btnGroupAddParticipating_secondElement}         xpath=//html/body/div/div[2]/div[2]/div[2]/div/ul/li[3]/a

${User_btnGroupPropatiesTab}       xpath=//*[@id="tab1title"]/a
${User_btnGroupPropatiesTab_secondElement}         xpath=//html/body/div/div[2]/div[2]/div[2]/div/ul/li[1]/a

${User_menuRoles}                    	xpath=//*[@id="app-submenu"]/li[4]/a
${User_menuRoles_secondElement}                  xpath=//html/body/div/div[2]/div[1]/ul[2]/li[4]/a

${User_menuApplication}                    	xpath=//*[@id="app-submenu"]/li[5]/a
${User_menuApplication_secondElement}                      xpath=//html/body/div/div[2]/div[1]/ul[2]/li[5]/a

${User_btnSelectOrgnisation}        xpath=//*[@id="organisation-list"]
${User_btnSelectOrgnisationForPassPolicy}                                           xpath=//*[@id="organisation-list"]

${User_ddlCreateNewUser_OrganisationTree}                xpath=//*[@id="create-user-organisation"]
${User_ddlUNumberOFRecordsPerPage}             xpath=//*[@id="results_length"]/label/select

${User_btnSecondPage}             xpath=//*[@id="results_wrapper"]/div[2]/div[2]/div/ul/li[3]/a
${User_btnNextPage}             xpath=//*[@id="results_wrapper"]/div[2]/div[2]/div/ul/li[7]/a/span
${User_btnPreviousPage}            xpath=//*[@id="results_wrapper"]/div[2]/div[2]/div/ul/li[1]/a/span

${User_txtNewUser_userName}            xpath=//*[@id="create-user-username"]
${User_selectAutomationTestGroup}       xpath=//*[@id="groupslist"]/option[8]

${User_modalCreateNewUser}             xpath=//*[@id="create-user-modal" and @class="modal hide in"]
${User_btnCancelCreateNewUser}         xpath=//*[@id="create-user-validation-reset"]
${User_searchResultsTable}             xpath=//*[@id="results"]

${User_modalEditUser}                  xpath=//div[@id='edit-user-modal'][not(contains(@style,'display: none'))]
${User_btnUpdateEditUser}              xpath=//*[@id="edit-user-submit"]
${User_txtGroupsPermissions}           xpath=//*[@id="s2id_autogen5"]
${User_listGroups}                     xpath=//*[@id="s2id_edit-user-groups"]/ul
${User_txtInputRoleOrGroup}            xpath=//div[contains(text(),"INPUT_ROLEorGROUP")]//following-sibling::a
${User_txtRoles}                       xpath=//*[@id="s2id_autogen6"]
${User_listRoles}                      xpath=//*[@id="s2id_edit-user-roles"]/ul

${User_txtCurrentStatus}               xpath=//*[@id="current-user-status"]
${User_statusValue}                    xpath=//*[@id="edit-user-status"]/option[2]
${User_listPreferredLangDetails}       xpath=//*[@id="edit-user-lang"]
${User_listFirstUserRoleValue}         xpath=//*[@id="select2-drop"]/ul/li/ul/li
${User_txtEditUsername}                xpath=//*[@id="edit-user-firstname"]
${User_txtEditSurname}                 xpath=//*[@id="edit-user-surname"]
${User_firstnameError}                 xpath=//html/body/div[1]/div[2]/div[9]/div[2]/div/form/div[1]/div[1]/div[5]/div/div/p/ul/li
${User_surnameError}                   xpath=//html/body/div[1]/div[2]/div[9]/div[2]/div/form/div[1]/div[1]/div[6]/div/div/p/ul/li
${User_txtEditPhone}                   xpath=//*[@id="edit-user-phone"]
${User_txtEditMobile}                  xpath=//*[@id="edit-user-mobile"]
${User_labelPhone}                     xpath=//div[@class="tab-pane active" and @id="user-contact-modal-tab"]/div/label[text()="Phone"]
${User_txtContentOfTab}                xpath=//div[@id="edit-user-modal" and @class="modal hide in"]//div[contains(@class, 'tab-pane active') and contains(@id, 'user-TAB_NAME-modal-tab')]

*** Keywords ***
User_Maximum 25 records will be listed on results
    Wait Until Keyword Succeeds     1 min   1 sec      List Selection Should Be        ${User_ddlUNumberOFRecordsPerPage}        25

User_Validate updated contact info
    [Arguments]     ${phone}     ${mobile}
    ${actualphone} =   Get Value   ${User_txtEditPhone}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal    ${actualphone}    ${phone}
    ${actualmobile} =   Get Value   ${User_txtEditMobile}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal    ${actualmobile}    ${mobile}

User_Update User Contact Info Details
    [Arguments]     ${phone}     ${mobile}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtEditPhone}    ${phone}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtEditMobile}    ${mobile}

User_Click Update User Details
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${User_btnUpdateEditUser}

User_Validate surname validation
    Wait Until Element is Visible     ${User_surnameError}   10s
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain     ${User_surnameError}     You must enter a last name

User_Validate first name validation
    Wait Until Element is Visible     ${User_firstnameError}   10s
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain     ${User_firstnameError}     You must enter a first name

User_Validate updated surname details
    [Arguments]     ${surname}
    ${actualsurname} =   Get Value   ${User_txtEditSurname}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal    ${actualsurname}    ${surname}

User_Validate updated first name details
    [Arguments]     ${firstname}
    ${actualfirstname} =   Get Value   ${User_txtEditUsername}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal    ${actualfirstname}    ${firstname}

User_Update Surname details
    [Arguments]     ${random_surname}
    Wait Until Keyword Succeeds     1 min   1 sec   input text     ${User_txtEditSurname}     ${random_surname}
    [Return]     ${random_surname}

User_Update First Name details
    [Arguments]     ${random_firstname}
    Wait Until Keyword Succeeds     1 min   1 sec   input text     ${User_txtEditUsername}     ${random_firstname}
    [Return]     ${random_firstname}

User_Add user role
    [Arguments]    ${oldUserRole}
    ${roleNotExists}    ${value}=    Run keyword and ignore error    Wait Until Element Does Not Contain     ${User_listRoles}     ${oldUserRole}     10s
    ${User_txtInputRoleOrGroup}=    Replace String    ${User_txtInputRoleOrGroup}    INPUT_ROLEorGROUP    ${oldUserRole}
    Run Keyword if    '${roleNotExists}' == 'FAIL'    click element    ${User_txtInputRoleOrGroup}
    Wait Until Element Is Visible    ${User_txtRoles}     10s
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtRoles}    ${oldUserRole}
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_listFirstUserRoleValue}

User_Delete User Role
    [Arguments]    ${role}
    ${roleExists}     ${value}=    Run keyword and ignore error    Wait Until Element Contains    ${User_listRoles}    ${role}    10s
    Run Keyword if    '${roleExists}' == 'FAIL'    User_Add user role    ${role}
    ${User_txtInputRoleOrGroup}=    Replace String    ${User_txtInputRoleOrGroup}    INPUT_ROLEorGROUP    ${role}
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_txtInputRoleOrGroup}

User_Validate Deleted User Role Is Not Present
    [Arguments]     ${deletedRole}
    Wait Until Element Does Not Contain     ${User_listRoles}     ${deletedRole}     10s    The "${deletedRole}" role still exists

User_Validate New User Role Is Present
    [Arguments]     ${newuserRole}
    Wait Until Element Contains     ${User_listRoles}     ${newuserRole}    10s    The "${newuserRole}" role does not exists

User_Verify if the removed group is no longer displayed
    [Arguments]    ${removedGroup}
    Wait Until Element Does Not Contain    ${User_listGroups}     ${removedGroup}     10s    The "${removedGroup}" group still exists

User_Remove selected group
    [Arguments]    ${group}
    ${groupExists}    ${value}=    Run keyword and ignore error    Wait Until Element Contains     ${User_listGroups}     ${group}     10s
    Run Keyword if    '${groupExists}' == 'FAIL'    User_Select a group from the Groups dropdown list field    ${group}
    ${User_txtInputRoleOrGroup}=    Replace String    ${User_txtInputRoleOrGroup}    INPUT_ROLEorGROUP    ${group}
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_txtInputRoleOrGroup}

User_Verify if the selected group is displayed in the Groups field
    [Arguments]         ${newGroup}
    Wait Until Element Contains     ${User_listGroups}     ${newGroup}    10s    The "${newGroup}" group does not exists

User_Select a group from the Groups dropdown list field
    [Arguments]         ${group}
    ${groupNotExists}    ${value}=    Run keyword and ignore error    Wait Until Element Does Not Contain     ${User_listGroups}     ${group}     10s
    ${User_txtInputRoleOrGroup}=    Replace String    ${User_txtInputRoleOrGroup}    INPUT_ROLEorGROUP    ${group}
    Run Keyword if    '${groupNotExists}' == 'FAIL'    click element    ${User_txtInputRoleOrGroup}
    Wait Until Element Is Visible    ${User_txtGroupsPermissions}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   Input Text     ${User_txtGroupsPermissions}          ${group}
    Press Keys       NONE      RETURN

User_Verify preferred language is successfully revert back to English
    User_Choose [English] on User details tab with list value [en]
    User_Click Update on Edit User pop up
    User_Click user from the search list      
    User_Verify successful update of language to [English] with list value [en]

User_Verify successful update of language to [${preferredLanguage}] with list value [${languageListValue}]
    ${selected}=    Get Selected List Value    ${User_listPreferredLangDetails}
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal    ${selected}    ${languageListValue}

User_Click Update on Edit User pop up
    Wait Until Element Is Visible      ${User_btnUpdateEditUser}   30s      Update button not found
    Wait Until Keyword Succeeds     1 min   1 sec   Click Element     ${User_btnUpdateEditUser}
    Wait Until Page contains          Success!      30s
    Wait Until Element Is Not Visible       ${User_modalEditUser}         60s     Edit User Modal is still visible

User_Choose [${preferredLanguage}] on User details tab with list value [${languageListValue}]
    Wait Until Element Is Visible      ${User_listPreferredLangDetails}    30s      Language dropdown not found
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List By Value     ${User_listPreferredLangDetails}          ${languageListValue}

User_Verify Search results is displayed for specific user
    [Arguments]    ${user}
    Wait Until Element Is Visible      ${User_searchResultsTable}    30s      Results table not found
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_searchResultsTable}    ${user}

User_Verify successful update of user Status
    [Arguments]    ${stat}
    ${currentstat}=    Get Text   ${User_txtCurrentStatus}
    Wait Until Keyword Succeeds     1 min   1 sec   Should be equal    ${currentstat}    ${stat}

User_Update User Status    
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_statusValue}
    User_Click Update on Edit User pop up

User_Update status to preconditioned status
    [Arguments]    ${stat}
    User_Update User Status
    User_Click Search button
    User_Click user from the search list
    User_Verify successful update of user Status    ${stat}

User_Update user status to INACTIVE
    wait until element is visible    ${User_txtCurrentStatus}    10s
    ${currentstat}=    Get Text    ${User_txtCurrentStatus}
    ${isCurrentStatEqualActive}     ${value}=   Run keyword and ignore error    Should be Equal    ${currentstat}    ACTIVE
    Run keyword if  '${isCurrentStatEqualActive}' == 'FAIL'   Run keyword    User_Update status to preconditioned status    ACTIVE
    User_Update User Status

User_Update user status to ACTIVE
    wait until element is visible    ${User_txtCurrentStatus}    10s 
    ${currentstat}=    Get Text      ${User_txtCurrentStatus}
    ${isCurrentStatEqualInactive}     ${value}=   Run keyword and ignore error    Should be Equal    ${currentstat}    INACTIVE
    Run keyword if    '${isCurrentStatEqualInactive}' == 'FAIL'    Run keyword    User_Update status to preconditioned status    INACTIVE
    User_Update User Status

User_Click Search button
    Wait Until Element Is Visible      ${User_btnSearchUsrs}    30s      Search button not found
    Wait Until Keyword Succeeds     1 min   1 sec   click element       ${User_btnSearchUsrs}

User_Search user records using username value 
    [Arguments]    ${userName}
    User_Enter the username for filter    ${userName}
    User_Click Search button
    User_Verify Search results is displayed for specific user    ${userName}

User_Cancel Creation of New User
    wait until element is visible    ${User_btnCreateUserUrl}    10s    Create New User button not visible
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnCreateUserUrl}
    wait until element is visible    ${User_btnCancelCreateNewUser}    10s    Cancel button on Create New User modal is not visible
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnCancelCreateNewUser}   
    wait until element is not visible   ${User_modalCreateNewUser}    10s    Create New User modal is still visible

User_Validate role participating users tab propaties
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupParticipatingUsers}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_btnGroupParticipatingUsers}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupParticipatingUsers_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_btnGroupParticipatingUsers_secondElement}

User_Validate role add participats propaties
    ${try3Status}    ${value3}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupAddParticipating}
    Run Keyword if      '${try3Status}' == 'PASS'       click element       ${User_btnGroupAddParticipating}
    ${try4Status}      ${value4} =     Run Keyword if      '${try3Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupAddParticipating_secondElement}
    Run Keyword if      '${try4Status}' == 'PASS'          click element       ${User_btnGroupAddParticipating_secondElement}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     User name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     First name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Last name


User_Validate role group propaties tab
    ${try5Status}    ${value6}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupPropatiesTab}
    Run Keyword if      '${try5Status}' == 'PASS'       click element       ${User_btnGroupPropatiesTab}
    ${try7Status}      ${value8} =     Run Keyword if      '${try5Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupPropatiesTab_secondElement}
    Run Keyword if      '${try7Status}' == 'PASS'          click element       ${User_btnGroupPropatiesTab_secondElement}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Role name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Role description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Groups
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application

User_Select organisation on organisation text box in password policy
    [Arguments]     ${org_name}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label        ${User_btnSelectOrgnisationForPassPolicy}       ${org_name}
    sleep   4s

User_Password Policy setting details should be displayed on Policy settings section
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     FXAUTO
    ${org_pass_strength}=       Get Value    xpath=//*[@id="password-length-min"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_pass_strength}       6
    ${org_exp_date}=        Get Value     xpath=//*[@id="password-expiry-days"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_exp_date}        60    

User_Select organisation on organisation text box
    [Arguments]     ${org_name}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label        ${User_btnSelectOrgnisation}        ${org_name}
    sleep   4s

User_Org details should be displayed on orgnaization propaties
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     FXAUTO
    ${org_code}=       Get Value    xpath=//*[@id="organisation-code"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_code}       org261
    ${org_name}=        Get Value     xpath=//*[@id="organisation-name"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_name}        FXAUTO
    ${org_des}=        Get Value     xpath=//*[@id="organisation-description"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_des}        for automation testing
    ${org_timeout}=        Get Value     xpath=//*[@id="org-timeout"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${org_timeout}        30
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Plain text

User_Validate application
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage applications
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Applications
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application properties
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Application description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Roles


User_Click on application
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuApplication}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuApplication}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuApplication_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuApplication_secondElement}


User_Validate roles
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage roles
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage roles
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Roles


User_Click on roles
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuRoles}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuRoles}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuRoles_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuRoles_secondElement}

User_Validate Groups page propaties
    ${try55Status}    ${value56}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage groups
    Run Keyword if      '${try55Status}' == 'PASS'       page should contain     Manage groups
    ${try75Status}      ${value84} =     Run Keyword if      '${try55Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   title should be     IDM Groups
    Run Keyword if      '${try75Status}' == 'PASS'          title should be     IDM Groups


User_The details of the first group listed on textbox are displayed on the group properties
    [Arguments]     ${group}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List By label   ${GroupManage_listGroups}   ${group}  #new line   
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     ${group}
    ${group_name}=       Get Value    xpath=//*[@id="group-name"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${group_name}       ${group}
    ${group_des}=        Get Value     xpath=//*[@id="group-description"]
    Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${group_des}        ${group}


# User_The details of the first group listed on textbox are displayed on the group properties
#     Wait Until Keyword Succeeds     1 min   1 sec   page should contain     AutomationTestGroup
#     ${group_name}=       Get Value    xpath=//*[@id="group-name"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${group_name}       AutomationTestGroup
#     ${group_des}=        Get Value     xpath=//*[@id="group-description"]
#     Wait Until Keyword Succeeds     1 min   1 sec   Should Be Equal     ${group_des}        AutomationTestGroup


User_Validate participating users tab propaties
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupParticipatingUsers}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_btnGroupParticipatingUsers}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupParticipatingUsers_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_btnGroupParticipatingUsers_secondElement}

User_Validate add participats propaties
    ${try3Status}    ${value3}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupAddParticipating}
    Run Keyword if      '${try3Status}' == 'PASS'       click element       ${User_btnGroupAddParticipating}
    ${try4Status}      ${value4} =     Run Keyword if      '${try3Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupAddParticipating_secondElement}
    Run Keyword if      '${try4Status}' == 'PASS'          click element       ${User_btnGroupAddParticipating_secondElement}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     User name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     First name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Last name


User_Validate group propaties tab
    ${try5Status}    ${value6}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupPropatiesTab}
    Run Keyword if      '${try5Status}' == 'PASS'       click element       ${User_btnGroupPropatiesTab}
    ${try7Status}      ${value8} =     Run Keyword if      '${try5Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnGroupPropatiesTab_secondElement}
    Run Keyword if      '${try7Status}' == 'PASS'          click element       ${User_btnGroupPropatiesTab_secondElement}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Group name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Group description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Roles


User_Validate popup tabs availability
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     User details
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Permissions
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Contact info

User_Validate user permission tab propaties availability
    wait until element is visible    ${User_modalEditUser}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnUserpermissionTabOnPopup}
    ${User_txtContentOfTab}=    Replace String    ${User_txtContentOfTab}    TAB_NAME    permissions
    wait until element is visible    ${User_txtContentOfTab}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Organisation tree
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Groups
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Roles

User_Validate contact info tab propaties availability
    wait until element is visible    ${User_btnUserContactInfoTabOnPopup}
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnUserContactInfoTabOnPopup}
    ${User_txtContentOfTab}=    Replace String    ${User_txtContentOfTab}    TAB_NAME    contact
    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible    ${User_txtContentOfTab}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   element should be visible    ${User_labelPhone}   
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Mobile phone

User_Validate user details tab propaties availability
    wait until element is visible    ${User_btnUserDetailsTabOnPopup}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnUserDetailsTabOnPopup}
    ${User_txtContentOfTab}=    Replace String    ${User_txtContentOfTab}    TAB_NAME    details
    wait until element is visible    ${User_txtContentOfTab}    10s
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Current status
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Change status
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    User name
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Email address
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    First name
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Last name
    Wait Until Keyword Succeeds     1 min   1 sec   element should contain    ${User_txtContentOfTab}    Preferred language

User_Click user from the search list
    Wait Until Keyword Succeeds     1 min   1 sec   click element       ${User_btnFirstUserOnTable}

User_Verify user search transaction
    Wait Until Keyword Succeeds     1 min   1 sec   click element       ${User_btnSearchUsrs}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Results
    sleep   4s
    Wait Until Keyword Succeeds     1 min   1 sec   page should not contain     NO Results

User_Verify newly created user existence
    [Arguments]     ${user_name}
    sleep   3s
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     ${user_name}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     UNCONFIRMED
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     test        #added this line
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     testsur     #added this line
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     FXAUTO      #added this line

# User_Verify newly created user existence
#     [Arguments]     ${user_name}
#     sleep   3s
#     Wait Until Keyword Succeeds     1 min   1 sec   page should contain     ${user_name}
#     Wait Until Keyword Succeeds     1 min   1 sec   page should contain     UNCONFIRMED



#page https://envl.portal.fxdms.net/up/admin/users-manage.html
User_goto user page
	#Wait Until Element Is Visible       ${User_btnAdminUserUrl}
	#Wait Until Keyword Succeeds     1 min   1 sec   go to      ${User_btnAdminUserUrl}
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnCreateUserUrl}

#POPUP from admin/user-manage FORM Create New User
User_new user fill new user details
    ${Random_PostFix} =  Generate Random String  2  [NUMBERS]
	Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label    ${User_ddlCreateNewUser_OrganisationTree}       FXDMS Automation
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserEmail}    fujitest007+Automation${Random_PostFix}@gmail.com
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserFirstName}    test
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserSurName}    testsur
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserMobile}    0122336598
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserPhone}    0552365998
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnCreateNewUserConfirm}
	Wait Until Keyword Succeeds     1 min   1 sec   page should contain      Success! New user was created

User_new user Select organisation
    [Arguments]     ${org}
    Wait Until Keyword Succeeds     1 min   1 sec   Select From List by label    ${User_ddlCreateNewUser_OrganisationTree}       ${org}

User_new user Fill out Email firstname and lastname fields
    ${Random_PostFix} =  Generate Random String  5  [NUMBERS]
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtNewUser_userName}       fujitest007+Automation${Random_PostFix}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserEmail}    fujitest007+Automation${Random_PostFix}@gmail.com
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserFirstName}    test
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserSurName}    testsur
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserMobile}    0122336598
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtUserPhone}    0552365998
    [Return]    fujitest007+Automation${Random_PostFix}

User_new user Press create button
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnCreateNewUserConfirm}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_btnCreateNewUserConfirm}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_btnCreateNewUserConfirm_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_btnCreateNewUserConfirm_secondElement}
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain      Success! New user was created

User_new user Enter the username of the new USER in the user names text field
    [Arguments]   ${user_name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtSearchUsername}    ${user_name}

User_Enter the username for filter
    [Arguments]   ${user_name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtSearchUsername}    ${user_name}

User_Enter first name for filter
    [Arguments]   ${first_name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtSearchFirstName}    ${first_name}

User_Enter last name for filter
    [Arguments]   ${last_name}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtSearchLastName}    ${last_name}

User_Enter filter text
    [Arguments]   ${filter_text}
    Wait Until Keyword Succeeds     1 min   1 sec   input text    ${User_txtFilter}    ${filter_text}

User_validate entered filter text
    sleep       4s
    Wait Until Keyword Succeeds     1 min   1 sec       page should contain     fxdms

User_Click Cancel button
    Wait Until Keyword Succeeds     1 min   1 sec       click element       ${User_btnCancel}
    #sleep   5s
    #Wait Until Keyword Succeeds     1 min   1 sec       BuiltIn.Should Be Empty         ${User_txtSearchUsername}
    #Textfield Value Should Be

User_User name/First name/Last textfield will be cleared
    Textfield Value Should Be       ${User_txtSearchUsername}       ${EMPTY}
    Textfield Value Should Be       ${User_txtSearchFirstName}       ${EMPTY}
    Textfield Value Should Be       ${User_txtSearchLastName}       ${EMPTY}

User_Maximum 10 records will be listed on results
    Wait Until Keyword Succeeds     1 min   1 sec      List Selection Should Be        ${User_ddlUNumberOFRecordsPerPage}        10

User_validate records per page dropdown list
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    10
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    25
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    50
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain    100

User_Filter records listed on results
    [Arguments]         ${rec}
    Select From List by label        ${User_ddlUNumberOFRecordsPerPage}       ${rec}
    sleep   3s

User_Click page 2
    Wait Until Keyword Succeeds     1 min   1 sec       click element       ${User_btnSecondPage}

User_Click next button
    Wait Until Keyword Succeeds     1 min   1 sec       click element       ${User_btnNextPage}

User_Click Previous button
    Wait Until Keyword Succeeds     1 min   1 sec       click element       ${User_btnPreviousPage}

User_verify removed user
	Wait Until Keyword Succeeds     1 min   1 sec   page should not contain    binoy.batuwitage@fujixerox.com

User_Remove selected users
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnRemoveSelectedUsers}
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${User_btnRemoveSelectedUsers}

User_Click on Organisation
	#Wait Until Keyword Succeeds     1 min   1 sec   click link    ${User_menuOrgnaization}
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuOrgnaization}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuOrgnaization_secondElement}
	#Wait Until Keyword Succeeds     1 min   1 sec   click link    ${User_menuOrgnaizationMod}
	${try1Status1}    ${value1}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaizationMod}
    Run Keyword if      '${try1Status1}' == 'PASS'       click element       ${User_menuOrgnaizationMod}
    ${try2Status1}      ${value3} =     Run Keyword if      '${try1Status1}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaizationMod_secondElement}
    Run Keyword if      '${try2Status1}' == 'PASS'          click element       ${User_menuOrgnaizationMod_secondElement}


User_Click on Organisation button
	#Wait Until Keyword Succeeds     1 min   1 sec   click link    ${User_menuOrgnaization}
    ${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuOrgnaization}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuOrgnaization_secondElement}

User_Click on Organisation child item
	#Wait Until Keyword Succeeds     1 min   1 sec   click link    ${User_menuOrgnaizationMod}
	${try1Status1}    ${value1}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaizationMod}
    Run Keyword if      '${try1Status1}' == 'PASS'       click element       ${User_menuOrgnaizationMod}
    ${try2Status1}      ${value3} =     Run Keyword if      '${try1Status1}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaizationMod_secondElement}
    Run Keyword if      '${try2Status1}' == 'PASS'          click element       ${User_menuOrgnaizationMod_secondElement}


User_Validate manage organisation
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage organisations
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisations
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation properties
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation code
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation name
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation description
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Username format
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Session time-out
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Organisation tree
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     New organisational unit


User_Click on Organisation password policy
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuOrgnaization}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuOrgnaization_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuOrgnaization_secondElement}
	Wait Until Keyword Succeeds     1 min   1 sec   click link      ${User_menuOrgPasswordPolicy}

User_Validate password policy
    Wait Until Keyword Succeeds     1 min   1 sec   Title Should Be     IDM Password Policies
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Custom policy
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Password expiry
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Password length
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Expiry period (days)
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Must contain lowercase
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Account lock-up
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Must contain uppercase
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Maximum failed attempts
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Must contain numeric
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Require unique passwords
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Must contain special
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Password history depth




User_Click on Groups
	${try1Status}    ${value}=   Run keyword and ignore error    Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuGroups}
    Run Keyword if      '${try1Status}' == 'PASS'       click element       ${User_menuGroups}
    ${try2Status}      ${value2} =     Run Keyword if      '${try1Status}' == 'FAIL'       Run keyword and ignore error     Wait Until Keyword Succeeds     1 min   1 sec   wait until element is visible       ${User_menuGroups_secondElement}
    Run Keyword if      '${try2Status}' == 'PASS'          click element       ${User_menuGroups_secondElement}