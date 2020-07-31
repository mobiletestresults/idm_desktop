*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          IDM-library_test.robot
Test Teardown     Config_Close all browsers
Suite Teardown    Config_Finalize the Executed Result

*** Test Cases ***

IDM-031
    [Documentation]     Validate cancel button functionality on create new user pop-up windo
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-031    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-031    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-031    Go to admin page
    User_Cancel Creation of New User
    Config_Save Screenshot    IDM-031    New user window displayed and close

IDM-032
    [Documentation]     Validate if inactive user can be updated to active status
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-032    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-032    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-032    Go to admin page
    User_Search user records using username value    FXAUTOUSER2
    Config_Save Screenshot    IDM-032      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-032    Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-032    Validate user details tab propaties availability
    User_Update user status to ACTIVE      
    Config_Save Screenshot    IDM-032    Update user status to ACTIVE
    User_Click Search button
    Config_Save Screenshot    IDM-032    Click Search button
    User_Verify Search results is displayed for specific user    FXAUTOUSER2
    Config_Save Screenshot    IDM-032      Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-032      Click user from the search list
    User_Verify successful update of user Status    ACTIVE
    Config_Save Screenshot    IDM-032    Verify successful update of user Status

IDM-033
    [Documentation]    Validate if active user can be updated to inactive status
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-033    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-033    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-033    Go to admin page
    User_Search user records using username value    FXAUTOUSER2
    Config_Save Screenshot    IDM-033      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-033    Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-033    Validate user details tab propaties availability
    User_Update user status to INACTIVE      
    Config_Save Screenshot    IDM-033    Update user status to INACTIVE
    User_Click Search button
    Config_Save Screenshot    IDM-033    Click Search button
    User_Verify Search results is displayed for specific user    FXAUTOUSER2
    Config_Save Screenshot    IDM-033      Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-033      Click user from the search list
    User_Verify successful update of user Status    INACTIVE
    Config_Save Screenshot    IDM-033    Verify successful update of user Status

IDM-034
    [Documentation]     Validate if user name can be updated
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-034    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-034    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-034    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-034      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-034      Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-034      Validate user details tab propaties availability
    ${random_firstname} =    Generate Random String  5  [UPPER]
    ${first_name} =    User_Update First Name details    ${random_firstname}
    Config_Save Screenshot    IDM-034      Update First Name detail
    ${random_surname} =    Generate Random String   5  [UPPER]
    ${surname} =     User_Update Surname details    ${random_surname}
    Config_Save Screenshot    IDM-034      Update Surname details
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-034      Click Update User Permissions
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-034      Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-034      Click user from the search list
    User_Validate updated first name details    ${first_name}
    Config_Save Screenshot    IDM-034      Validate updated user name details
    User_Validate updated surname details    ${surname}
    Config_Save Screenshot    IDM-034      Validate updated surname details

IDM-035
    [Documentation]     Validate if first name can be updated to null
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-035    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-035    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-035    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-035      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-035      Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-035      Validate user details tab propaties availability
    User_Update First Name details    ${EMPTY}
    Config_Save Screenshot    IDM-035      Update First Name detail
    User_Click Update User Details
    Config_Save Screenshot    IDM-035      Click Update on Edit User pop up
    User_Validate first name validation
    Config_Save Screenshot    IDM-035      Validate first name validation

IDM-036
    [Documentation]     Validate if surname can be updated to null
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-036    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-036    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-036    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-036      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-036      Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-036      Validate user details tab propaties availability
    User_Update Surname details  ${EMPTY}
    Config_Save Screenshot    IDM-036      Update Surname detail
    User_Click Update User Details
    Config_Save Screenshot    IDM-036      Click Update User Details
    User_Validate surname validation
    Config_Save Screenshot    IDM-036      Validate surname validation

IDM-037
    [Documentation]     Validate if the preferred language of user can be updated to Chinese (Simplified) - 中文(简体)
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-037    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-037    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-037    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-037      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-037       Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-037       Validate user details tab propaties availability
    User_Choose [Chinese (Simplified)] on User details tab with list value [zh]
    Config_Save Screenshot    IDM-037       Choose Chinese (Simplified) on User details tab
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-037       Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-037      Verify Search results is displayed for specific user
    User_Click user from the search list      
    Config_Save Screenshot    IDM-037       Click user from the search list
    User_Verify successful update of language to [Chinese (Simplified)] with list value [zh]
    Config_Save Screenshot    IDM-037      Verify successful update of language to Chinese (Simplified)
    User_Verify preferred language is successfully revert back to English
    Config_Save Screenshot    IDM-037       Verify preferred language is successfully revert back to English

IDM-038
    [Documentation]     Validate if the preferred language of user can be updated to Chinese (Traditional) - ‪中文(繁體)
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-038    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-038    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-038    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-038      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-038       Click user from the search list
    User_Validate user details tab propaties availability
    Config_Save Screenshot    IDM-038       Validate user details tab propaties availability
    User_Choose [Chinese (Traditional)] on User details tab with list value [zh-TW]
    Config_Save Screenshot    IDM-038       Choose Chinese (Traditional) on User details tab
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-038       Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-038      Verify Search results is displayed for specific user
    User_Click user from the search list      
    Config_Save Screenshot    IDM-038    Click user from the search list
    User_Verify successful update of language to [Chinese (Traditional)] with list value [zh-TW]
    Config_Save Screenshot    IDM-038      Verify successful update of language to Chinese (Traditional)
    User_Verify preferred language is successfully revert back to English
    Config_Save Screenshot    IDM-038       Verify preferred language is successfully revert back to English

IDM-039
    [Documentation]     Validate if contact info can be updated
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-039    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-039    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-039    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-039      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-039    Click user from the search list
    User_Validate contact info tab propaties availability
    Config_Save Screenshot    IDM-039      Validate contact info tab propaties availability
    ${random_phone} =  Generate Random String  10  [NUMBER]
    ${random_mobile} =  Generate Random String  10  [NUMBER]
    User_Update User Contact Info Details    ${random_phone}    ${random_mobile}
    Config_Save Screenshot    IDM-039      Click Update Contact Info
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-039      Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-039      Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-039      Click user from the search list
    User_Validate contact info tab propaties availability
    Config_Save Screenshot    IDM-039      Validate contact info tab propaties availability
    User_Validate updated contact info    ${random_phone}    ${random_mobile}
    Config_Save Screenshot    IDM-039      Validate updated contact info

IDM-040
    [Documentation]     Validate if a group can be added to a user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-040    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-040    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-040    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-040      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-040    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-040       Validate user permission tab propaties availability
    User_Select a group from the Groups dropdown list field    AutomationTestGroup
    Config_Save Screenshot    IDM-040       Select a group from the Groups dropdown list field
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-040    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-040      Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-040    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-040       Validate user permission tab propaties availability
    User_Verify if the selected group is displayed in the Groups field    AutomationTestGroup
    Config_Save Screenshot    IDM-040       Verify if the selected group is displayed in the Groups field

IDM-041
    [Documentation]     Validate if a group can be removed from the user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-041    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-041    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-041    Go to admin page
    User_Search user records using username value      FXAUTOUSER1
    Config_Save Screenshot    IDM-041    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-041    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-041    Validate user permission tab propaties availability
    User_Remove selected group    AutomationTestGroup
    Config_Save Screenshot    IDM-041    Remove selected group
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-041    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-041    Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-041    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-041    Validate user permission tab propaties availability
    User_Verify if the removed group is no longer displayed    AutomationTestGroup
    Config_Save Screenshot    IDM-041       Verify if the removed group is no longer displayed

IDM-042
    [Documentation]     Validate if a role can be added to a user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-042    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-042    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-042    Go to admin page
    User_Search user records using username value      FXAUTOUSER1
    Config_Save Screenshot    IDM-042    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-042    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-042    Validate user permission tab propaties availability
    User_Add user role    Dashboard    
    Config_Save Screenshot    IDM-042    Add user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-042    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-042    Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-042    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-042    Validate user permission tab propaties availability
    User_Validate New User Role Is Present  Dashboard
    Config_Save Screenshot    IDM-042    Validate New User Role Is Present

IDM-043
    [Documentation]     Validate if a role can be removed from a user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-043    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-043    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-043    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-043    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-043    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-043    Validate user permission tab propaties availability
    User_Delete user role  Dashboard    
    Config_Save Screenshot    IDM-043    Add user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-043    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-043    Verify Search results is displayed for specific user
    User_Click user from the search list
    Config_Save Screenshot    IDM-043    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-043      Validate user permission tab propaties availability
    User_Validate Deleted User Role Is Not Present  Dashboard
    Config_Save Screenshot    IDM-043      Validate Deleted User Role Is Not Present

IDM-044
    [Documentation]     Validate if viewdocs role can be added to a user
    [Tags]    ENVL_ENVB_ONLY    REGP2       REGTC
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-044    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-044    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-044    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-044    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-044    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-044    Validate user permission tab propaties availability
    User_Add user role  viewdocs    
    Config_Save Screenshot    IDM-044    Add user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-044    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-044    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-044    Sign out user
    #login user with viewdocs role
    Login_Sign in Specific User    FXAUTOUSER1
    Config_Save Screenshot    IDM-044    Sign in Specific User
    Dashboard_Validate menu present  archive
    Config_Save Screenshot    IDM-044    Validate menu present
    Dashboard_Go to [viewdocs] page
    Config_Save Screenshot    IDM-044    go to viewdocs page

IDM-045
    [Documentation]     Validate that if viewdocs role is removed, archive tab is not displayed
    [Tags]    ENVL_ENVB_ONLY    REGP2    REGTC
    Login_Access portal
    Config_Save Screenshot    IDM-045    Access portal
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-045    Sign in Specific User
    Dashboard_Validate menu present  archive
    Config_Save Screenshot    IDM-045    Validate menu present
    Dashboard_Go to [viewdocs] page
    Config_Save Screenshot    IDM-045    Go to viewdocs page
    Login_Sign out user
    Config_Save Screenshot    IDM-045    Sign out user
    Login_Sign in admin user
    Config_Save Screenshot    IDM-045    Sign in admin user
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-045    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-045    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-045    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-045    Validate user permission tab propaties availability
    User_Delete user role  viewdocs    
    Config_Save Screenshot    IDM-045    Delete user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-045    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-045    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-045    Sign out user
    #login user to check viewdocs menu
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-045    Sign in Specific User
    Dashboard_Validate menu not present  archive
    Config_Save Screenshot    IDM-045    Validate menu not present

IDM-046
    [Documentation]     Validate if esm-admin and collaboration roles can be added to a user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-046    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-046    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-046    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
   Config_Save Screenshot    IDM-046    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-046    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-046    Validate user permission tab propaties availability
    User_Add user role  collaboration    
    Config_Save Screenshot    IDM-046    Add user role collaboration
    User_Add user role  esm-admin    
    Config_Save Screenshot    IDM-046    Add user role esm-admin
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-046    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-046    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-046    Sign out user
    #login user with esm-admin and collaboration roles
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-046    Sign in Specific User
    Dashboard_Validate menu present  collaboration
    Config_Save Screenshot    IDM-046    Validate menu present
    Dashboard_Go to [collaboration] page
    Config_Save Screenshot    IDM-046    go to collaboration page

IDM-047
    [Documentation]     Validate that if esm-admin and collaboration roles are removed, collaboration tab is not displayed
    [Tags]    REGTC    REGP2    
    Login_Access portal
    Config_Save Screenshot    IDM-047    Access portal
    Login_Sign in Specific User    FXAUTOUSER1
    Config_Save Screenshot    IDM-047    Sign in Specific User
    Dashboard_Validate menu present  collaboration
    Config_Save Screenshot    IDM-047    Validate menu present
    Dashboard_Go to [collaboration] page
    Config_Save Screenshot    IDM-047    go to collaboration page
    Login_Sign out user
    Config_Save Screenshot    IDM-047    Sign out user
    Login_Sign in admin user
    Config_Save Screenshot    IDM-047    Sign in admin user
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-047    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-047      Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-047    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-047    Validate user permission tab propaties availability
    User_Delete user role  collaboration    
    Config_Save Screenshot    IDM-047    Delete user role collaboration
    User_Delete user role  esm-admin    
    Config_Save Screenshot    IDM-047    Delete user role esm-admin
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-047    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-047    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-047    Sign out user
    #login user to check collaboration menu
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-047      Sign in Specific User
    Dashboard_Validate menu not present  collaboration
    Config_Save Screenshot    IDM-047      Validate menu not present

IDM-048
    [Documentation]     Validate if mcp-readonly role can be added to a user
    [Tags]    REGTC    REGP2    
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-048    Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-048    Validate dashbord page
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-048    Go to admin page
    User_Search user records using username value    FXAUTOUSER1
    Config_Save Screenshot    IDM-048    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-048    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-048    Validate user permission tab propaties availability
    User_Add user role  mcp-readonly    
    Config_Save Screenshot    IDM-048    Add user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-048    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-048    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-047    Sign out user
    #login user with mcp-readonly role
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-048    Sign in Specific User
    Dashboard_Validate menu present  MCP
    Config_Save Screenshot    IDM-048    Validate menu present
    Dashboard_Go to [mcp] page
    Config_Save Screenshot    IDM-048    go to mcp page

IDM-049
    [Documentation]     Validate that if mcp-readonly role is removed, MCP tab is not displayed
    [Tags]    REGTC    REGP2    
    Login_Access portal
    Config_Save Screenshot    IDM-049    Access portal
    Login_Sign in Specific User     FXAUTOUSER1
    Config_Save Screenshot    IDM-049    Sign in Specific User
    Dashboard_Validate menu present  MCP
    Config_Save Screenshot    IDM-049    Validate menu present
    Dashboard_Go to [mcp] page
    Config_Save Screenshot    IDM-049    Go to mcp page
    Login_Sign out user
    Config_Save Screenshot    IDM-049    Sign out user
    Login_Sign in admin user
    Config_Save Screenshot    IDM-049    Sign in admin user
    Dashboard_Go to [idm] page
    Config_Save Screenshot    IDM-049    Go to admin page
    User_Search user records using username value      FXAUTOUSER1
    Config_Save Screenshot    IDM-049    Search user records using username value
    User_Click user from the search list
    Config_Save Screenshot    IDM-049    Click user from the search list
    User_Validate user permission tab propaties availability
    Config_Save Screenshot    IDM-049    Validate user permission tab propaties availability
    User_Delete user role  mcp-readonly    
    Config_Save Screenshot    IDM-049    Delete user role
    User_Click Update on Edit User pop up
    Config_Save Screenshot    IDM-049    Click Update on Edit User pop up
    User_Verify Search results is displayed for specific user    FXAUTOUSER1
    Config_Save Screenshot    IDM-049    Verify Search results is displayed for specific user
    Login_Sign out user
    Config_Save Screenshot    IDM-049    Sign out user
    #login user to check MCP menu
    Login_Sign in Specific User    FXAUTOUSER1
    Config_Save Screenshot    IDM-049    Sign in Specific User
    Dashboard_Validate menu not present  MCP
    Config_Save Screenshot    IDM-049    Validate menu not present

# new testcases end-------------

IDM-SMK 001
    [Documentation]     Verify successful log-in to portal [Email address as username]
    [Tags]      SMOKE       REGTC
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 001      Access portal
	Login_Click on the sign button
	Config_Save Screenshot    IDM-SMK 001      Click on the sign button
	Login_Input Username        fujitest007+Emailformat@gmail.com
	Config_Save Screenshot    IDM-SMK 001       Input Username
	Login_Input Password        Pa$$w0rd
	Config_Save Screenshot    IDM-SMK 001       Input Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM-SMK 001       Click on Sign-In button
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 001      Validate dashbord page

IDM-SMK 002
    [Documentation]     Verify successful log-in to portal [Plaintext as username]
    [Tags]      SMOKE  002        REGTC
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 002      Access portal
	Login_Click on the sign button
	Config_Save Screenshot    IDM-SMK 002      Click on the sign button
	Login_Input Username        USERPLAINTEXT
	Config_Save Screenshot    IDM-SMK 002       Input Username
	Login_Input Password        Pa$$w0rd
	Config_Save Screenshot    IDM-SMK 002       Input Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM-SMK 002       Click on Sign-In button
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 002      Validate dashbord page

IDM-SMK 003
    [Documentation]     Verify successful log-out to portal
    [Tags]      SMOKE         REGTC     smk003
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 003      Access portal
	Login_Click on the sign button
	Config_Save Screenshot    IDM-SMK 003      Click on the sign button
	Login_Input Username        fujitest007+Emailformat@gmail.com
	Config_Save Screenshot    IDM-SMK 003       Input Username
	Login_Input Password        Pa$$w0rd
	Config_Save Screenshot    IDM-SMK 003       Input Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM-SMK 003       Click on Sign-In button
    Dashbord_menu signout
	Config_Save Screenshot    IDM-SMK 003      menu signout
    Dashbord_Confirm signout
    Config_Save Screenshot    IDM-SMK 003      Confirm signout

IDM-SMK 004
    [Documentation]     Verify language selection - Chinese (Simplified) - 中文(简体)
    [Tags]      SMOKE       SMK_004      REGTC
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 004      Access portal
	Login_Click the -en- at the upper left corner of the page
	Config_Save Screenshot    IDM-SMK 004     Click the -en- at the upper left corner of the page
	Login_Lang change popup validation
	Config_Save Screenshot    IDM-SMK 004     Lang change popup validation
	Login_Select Chinese (Simplified) - 中文(简体)
	Config_Save Screenshot    IDM-SMK 004     Select Chinese (Simplified) - 中文(简体)
	Login_Click change button
	Config_Save Screenshot    IDM-SMK 004     Click change button
	Login_language should be change
	Config_Save Screenshot    IDM-SMK 004     language should be change


IDM-SMK 005
    [Documentation]     Verify language selection (Chinese (Traditional) - ‪中文(繁體) )
    [Tags]      SMOKE      REGTC    005
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 005      Access portal
	Login_Click the -en- at the upper left corner of the page
	Config_Save Screenshot    IDM-SMK 005     Click the -en- at the upper left corner of the page
	Login_Lang change popup validation
	Config_Save Screenshot    IDM-SMK 005     Lang change popup validation
	Login_Select Chinese (Traditional) - ‪中文(繁體)
	Config_Save Screenshot    IDM-SMK 005     Select Chinese (Traditional) - ‪中文(繁體)
	Login_Click change button
	Config_Save Screenshot    IDM-SMK 005     Click change button
	Login_language should be change to Chinese (Traditional)
	Config_Save Screenshot    IDM-SMK 005     language should be change to Chinese (Traditional)


IDM-SMK 006
    [Documentation]     Verify language selection (English)
    [Tags]      SMOKE      REGTC
    Login_Access portal
	Config_Save Screenshot    IDM-SMK 006      Access portal
	Login_Click the -en- at the upper left corner of the page
	Config_Save Screenshot    IDM-SMK 006     Click the -en- at the upper left corner of the page
	Login_Lang change popup validation
	Config_Save Screenshot    IDM-SMK 006     Lang change popup validation
	Login_Select English
	Config_Save Screenshot    IDM-SMK 006     Select English
	Login_Click change button
	Config_Save Screenshot    IDM-SMK 006     Click change button

IDM-SMK 007
    [Documentation]     Verify successful navigation to groups tab
    [Tags]      SMOKE   SMK_007      REGTC
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-SMK 007       Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 007      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-SMK 007      go to admin page
    User_Click on Groups
    Config_Save Screenshot    IDM-SMK 007      Click on Groups
    GroupManage_select org    FXAUTO
    Config_Save Screenshot    IDM-SMK 007      select org FXAUTO
    User_Validate Groups page propaties
    Config_Save Screenshot    IDM-SMK 007      Validate Groups page propaties
    User_The details of the first group listed on textbox are displayed on the group properties     AutomationTestGroup     #edited
    Config_Save Screenshot    IDM-SMK 007      The details of the first group listed on textbox are displayed on the group properties



IDM-SMK 008
    [Documentation]     Verify successful navigation to organisation tab (modify organisation)
    [Tags]      SMOKE       SMK_008      REGTC
    Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 008      Access to portal successfully
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 008      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 008      go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-SMK 008      Click on Organisation
	User_Validate manage organisation
	Config_Save Screenshot    IDM-SMK 008      Validate manage organisation
	User_Select organisation on organisation text box		FXAUTO
	Config_Save Screenshot    IDM-SMK 008      organisation on organisation text box
	User_Org details should be displayed on orgnaization propaties
	Config_Save Screenshot    IDM-SMK 008      Org details should be displayed on orgnaization propaties

IDM-SMK 009
    [Documentation]     Verify successful navigation to organisation tab (Password policies)
    [Tags]      SMOKE       SMK_009      REGTC
    Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 009       Access to portal successfully
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 009      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 009      go to admin page
    User_Click on Organisation password policy
    Config_Save Screenshot    IDM-SMK 009      Click on Organisation password policy
    User_Validate password policy
    Config_Save Screenshot    IDM-SMK 009      Validate password policy
    User_Select organisation on organisation text box in password policy		FXAUTO
    Config_Save Screenshot    IDM-SMK 009      Select organisation on organisation text box in password policy FXAUTO
	User_Password Policy setting details should be displayed on Policy settings section
	Config_Save Screenshot    IDM-SMK 009      Password Policy setting details should be displayed on Policy settings section

IDM-SMK 010
    [Documentation]     Verify successful navigation to Roles tab
    [Tags]      SMOKE       SMK_010      REGTC
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-SMK 010       Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 010      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-SMK 010      go to admin page
    User_Click on roles
    Config_Save Screenshot    IDM-SMK 010     Click on roles
    User_Validate roles
    Config_Save Screenshot    IDM-SMK 010     Validate roles
    Role_select role organization       FXAUTO
    Config_Save Screenshot    IDM-SMK 010       select role organization FXAUTO
    Role_validate role propaties
    Config_Save Screenshot    IDM-SMK 010     validate role propaties
    Role_validate role propaties text boxes values      FXDMS Read Only    #edited
    Config_Save Screenshot    IDM-SMK 010     validate role propaties text boxes values


IDM-SMK 011
    [Documentation]     Verify successful navigation to applications tab
    [Tags]      SMOKE   SMK_011       REGTC
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-SMK 011       Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 011      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-SMK 011      go to admin page
    User_Click on application
    Config_Save Screenshot    IDM-SMK 011      Click on application
    User_Validate application
    Config_Save Screenshot    IDM-SMK 011     Validate application
    AppManage_select org        FXAUTO
    Config_Save Screenshot    IDM-SMK 011     Select Organisation FXAUTO
    AppManage_validate application propaties
    Config_Save Screenshot    IDM-SMK 011     validate application propaties
    AppManage_Application details for the first app listed on the textbox should reflect on Application Properties section      app     #edited 
    Config_Save Screenshot    IDM-SMK 011     Application details for the first app listed on the textbox should reflect on Application Properties section 



IDM-SMK 012
    [Documentation]     Verify successful creation of user
    [Tags]      SMOKE       SMK_012      REGTC
    Login_Access to portal successfully
    Config_Save Screenshot    IDM-SMK 012      Access to portal successfully
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SMK 012      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-SMK 012      go to admin page
    User_goto user page
    Config_Save Screenshot    IDM-SMK 012      goto user page
    User_new user Select organisation       FXAUTO
    Config_Save Screenshot    IDM-SMK 012      new user Select organisation FXAUTO
    ${user_name} =    User_new user Fill out Email firstname and lastname fields    
    Config_Save Screenshot    IDM-SMK 012      new user Fill out Email firstname and lastname fields
    User_new user Press create button
    Config_Save Screenshot    IDM-SMK 012      new user Press create button
    User_new user Enter the username of the new USER in the user names text field   ${user_name}
    Config_Save Screenshot    IDM-SMK 012      new user Enter the username of the new USER in the user names text field
    User_Verify user search transaction     
    Config_Save Screenshot    IDM-SMK 012      Verify user search transaction
    User_Verify newly created user existence    ${user_name}
    Config_Save Screenshot    IDM-SMK 012     Verify newly created user existence    #changes


# IDM-SMK 012
#     [Documentation]     Verify successful creation of user
#     [Tags]      SMOKE       SMK_012      REGTC
#     Login_Access to portal successfully
# 	Config_Save Screenshot    IDM-SMK 012      Access to portal successfully
# 	Dashbord_Validate dashbord page
#     Config_Save Screenshot    IDM-SMK 012      Validate dashbord page
#     Dashbord_go to admin page
# 	Config_Save Screenshot    IDM-SMK 012      go to admin page
# 	User_goto user page
# 	Config_Save Screenshot    IDM-SMK 012      goto user page
# 	User_new user Select organisation		FXAUTO
# 	Config_Save Screenshot    IDM-SMK 012      new user Select organisation FXAUTO
# 	${user_name} =    User_new user Fill out Email firstname and lastname fields
# 	Config_Save Screenshot    IDM-SMK 012      new user Fill out Email firstname and lastname fields
# 	User_new user Press create button
# 	Config_Save Screenshot    IDM-SMK 012      new user Press create button
# 	User_new user Enter the username of the new USER in the user names text field   ${user_name}
# 	Config_Save Screenshot    IDM-SMK 012      new user Enter the username of the new USER in the user names text field
# 	User_Verify user search transaction
# 	Config_Save Screenshot    IDM-SMK 012      Verify user search transaction
# 	User_Verify newly created user existence    ${user_name}
# 	Config_Save Screenshot    IDM-SMK 012     Verify newly created user existence


IDM-SMK 013
	[Documentation]    Verify successful creation of group
    [Tags]      SMOKE   SMK_013      REGTC		
	Login_System Login
	Config_Save Screenshot    IDM-SMK 013  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 013  go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-SMK 013  Click on Groups
	GroupManage_Click on Create new group
	Config_Save Screenshot    IDM-SMK 013  Click on Create new group
	GroupManage_select org      FXAUTO
	Config_Save Screenshot    IDM-SMK 013   select org FXAUTO
	${Random_Group_Name} =      GroupManage_Fill-out Group name and Group description fields
	Config_Save Screenshot    IDM-SMK 013   Fill-out Group name and Group description fields
	GroupManage_Select Role FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 013   Select Role FXDMS Read Only
	GroupManage_Click create new group button
	Config_Save Screenshot    IDM-SMK 013   Click create new group button
	GroupManage_Select desired group        ${Random_Group_Name}
	Config_Save Screenshot    IDM-SMK 013   Select desired group ${Random_Group_Name}

IDM-SMK 014
	[Documentation]     Verify successful creation of organisation
    [Tags]      ENVD_SMOKE_ONLY
	Login_System Login
	Config_Save Screenshot    IDM-SMK 014     System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 014     go to admin page
	User_Click on Organisation button
	Config_Save Screenshot    IDM-SMK 014     Click on Organisation button
	User_Click on Organisation child item
	Config_Save Screenshot    IDM-SMK 014     Click on Organisation child item
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-SMK 014     Click on Create new Organisation
	${Random_Org_Name} =      Organization_Enter Organisation details
	Config_Save Screenshot    IDM-SMK 014     FORM Enter Organisation details
	Organization_Click on Create
	Config_Save Screenshot    IDM-SMK 014    Click on Create
	Organization_Select organization    ${Random_Org_Name}
	Config_Save Screenshot    IDM-SMK 014    Select organization ${Random_Org_Name}
	Organization_Created Organisation verify      ${Random_Org_Name}
	Config_Save Screenshot    IDM-SMK 014     Created Organisation verify ${Random_Org_Name}



IDM-SMK 015
	[Documentation]     Verify successful creation of role
    [Tags]      SMOKE       SMK_015      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 015       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 015         go to admin page
	Role_Click on roles
	Config_Save Screenshot    IDM-SMK 015         Click_on roles
	AppManage_select org    FXAUTO
	Config_Save Screenshot    IDM-SMK 015         Select Organisation FXAUTO
	Role_Click on Create new Role
	Config_Save Screenshot    IDM-SMK 015         Click on Create new Role
    Role_select org     FXAUTO
    Config_Save Screenshot    IDM-SMK 015        select org FXAUTO
    ${Random_Role_Name} =   Role_Fill-out text fields
    Config_Save Screenshot    IDM-SMK 015         Fill-out text fields
    Role_Click create buton     ${Random_Role_Name}
    Config_Save Screenshot    IDM-SMK 015         Click create buton
    Role_On roles list Select role      ${Random_Role_Name}
    Config_Save Screenshot    IDM-SMK 015      On roles list Select role ${Random_Role_Name}


IDM-SMK 016
	[Documentation]     Verify successful creation of app
    [Tags]      SMOKE       SMK_016      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 016       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 016       go to admin page
	AppManage_Click on Applications
	Config_Save Screenshot    IDM-SMK 016       Click on Applications
	AppManage_select org    FXAUTO
	Config_Save Screenshot    IDM-SMK 016       select org FXAUTO
	AppManage_Click on Create new application
	Config_Save Screenshot    IDM-SMK 016       Click on Create new application
    ${Random_App_Name} =    AppManage_Fill out text fields
    Config_Save Screenshot    IDM-SMK 016       Fill out text fields
    AppManage_Click on create button        ${Random_App_Name}
    Config_Save Screenshot    IDM-SMK 016       Click on create button
    AppManage_select organization from main list        ${Random_App_Name}
    Config_Save Screenshot    IDM-SMK 016       select organization from main list ${Random_App_Name}


# same as testcase No : IDM-SMK 011
IDM-SGN 017
    [Documentation]     Verify successful user activation
    [Tags]      SMOKE      REGTC	SMK_017
    Login_Access to portal successfully
	Config_Save Screenshot    IDM-SGN 017       Access to portal successfully
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-SGN 017      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-SGN 017      go to admin page
	User_Click on application
	Config_Save Screenshot    IDM-SGN 017      Click on application
	User_Validate application
	Config_Save Screenshot    IDM-SGN 017     Validate application
	AppManage_select org    FXAUTO
	Config_Save Screenshot    IDM-SGN 017     Select Organisation FXAUTO
	AppManage_validate application propaties
	Config_Save Screenshot    IDM-SGN 017      AppManage_validate application propaties

IDM-SMK 019
	[Documentation]     Verify successful addition of user to a group
    [Tags]      SMOKE       SMK_019      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 019       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 019     DASHBOARD-go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-SMK 019     Click on Groups
	GroupManage_select org      FXAUTO
	Config_Save Screenshot    IDM-SMK 019     select organization FXAUTO
	GroupManage_Click on Add Participants
	Config_Save Screenshot    IDM-SMK 019     Click on Add Participants
	GroupManage_Select desired group        AutomationTestGroup
	Config_Save Screenshot    IDM-SMK 019     Select desired group AutomationTestGroup
	GroupManage_Search for usename      FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 019       Search for usename FXAUTOUSER1
	GroupManage_Click on Search
	Config_Save Screenshot    IDM-SMK 019     Click on Search
	GroupManage_click user to be added
	Config_Save Screenshot    IDM-SMK 019     click user to be added
	GroupManage_click add user button
	Config_Save Screenshot    IDM-SMK 019     click add user button
	GroupManage_Click on Participating users
	Config_Save Screenshot    IDM-SMK 019     Click on Participating users
	GroupManage_Select desired group        AutomationTestGroup
	Config_Save Screenshot    IDM-SMK 019     Select desired group2 AutomationTestGroup
	GroupManage_user should be listed      FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 019     user should be listed FXAUTOUSER1


IDM-SMK 020
	[Documentation]     Verify successful removal of user from a group
    [Tags]      SMOKE   SMK_020      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 020       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 020     DASHBOARD-go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-SMK 020     Click on Groups
	GroupManage_select org      FXAUTO
	Config_Save Screenshot    IDM-SMK 020     select organization FXAUTO
	GroupManage_Click on Participating users
	Config_Save Screenshot    IDM-SMK 020     Click on Participating users
	GroupManage_Select desired group        AutomationTestGroup
	Config_Save Screenshot    IDM-SMK 020     Select desired group2 AutomationTestGroup
	GroupManage_user should be listed      FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 020     user should be listed FXAUTOUSER1
	GroupManage_Tick on the check box of the user
	Config_Save Screenshot    IDM-SMK 020     Tick on the check box of the user
	GroupManage_Click on the Remove selected users button
	Config_Save Screenshot    IDM-SMK 020     Click on the Remove selected users button
	GroupManage_Click on the confrim button
	Config_Save Screenshot    IDM-SMK 020    Click on the confrim button
	GroupManage_Select desired group        AutomationTestGroup
	Config_Save Screenshot    IDM-SMK 020     Select desired group3 AutomationTestGroup
	GroupManage_user should not be listed anymore       FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 020     user should not be listed anymore FXAUTOUSER1


IDM-SMK 021
	[Documentation]     Verify successful addition of user to roles
    [Tags]      SMOKE       SMK_021      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 021       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 021     DASHBOARD-go to admin page
	Role_Click on roles
	Config_Save Screenshot    IDM-SMK 021         Click_on roles
	Role_select org     FXAUTO
	Config_Save Screenshot    IDM-SMK 021         Select Organisation FXAUTO
	Role_On roles list Select role     FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 021       On roles list Select role
	Role_Click on Add role Participants
	Config_Save Screenshot    IDM-SMK 021         Click on Add role Participants
    Role_Search for usename     FXAUTOUSER1
    Config_Save Screenshot    IDM-SMK 021       Search for usename FXAUTOUSER1
    Role_Click on users Search
	Config_Save Screenshot    IDM-SMK 021         Click on users Search
    Role_Tick on the check box of the user
    Config_Save Screenshot    IDM-SMK 021      Tick on the check box of the user
	Role_Click on Add selected users
	Config_Save Screenshot    IDM-SMK 021        Click on Add selected users
	Role_Click on Participating Users
	Config_Save Screenshot    IDM-SMK 021         Click on Participating Users
	Role_On roles list Select role     FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 021         On roles list Select role2
	Role_user should be listed      FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 021         user should be listed FXAUTOUSER1

IDM-SMK 022
	[Documentation]     Verify successful removal of user to roles
    [Tags]      SMOKE       SMK_022      REGTC
	Login_Access to portal successfully
	Config_Save Screenshot    IDM-SMK 022       Access to portal successfully
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-SMK 022     DASHBOARD-go to admin page
	Role_Click on roles
	Config_Save Screenshot    IDM-SMK 022         Click_on roles
	Role_select org     FXAUTO
	Config_Save Screenshot    IDM-SMK 022         Select Organisation FXAUTO
	Role_On roles list Select role     FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 022       On roles list Select role
	Role_Click on Participating Users
	Config_Save Screenshot    IDM-SMK 022         Click on Participating Users
	Role_On roles list Select role     FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 022         On roles list Select role2
	Role_user should be listed      FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 022         user should be listed FXAUTOUSER1
	Role_Filter usename     FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 022       Filter usename FXAUTOUSER1
	Role_Tick on the check box of the user in participating tab
	Config_Save Screenshot    IDM-SMK 022       Tick on the check box of the user in participating tab
	Role_Press Remove selected users
	Config_Save Screenshot    IDM-SMK 022       Press Remove selected users
	Role_Press Remove selected users confirm
	Config_Save Screenshot    IDM-SMK 022       Press Remove selected users confirm
	Role_On roles list Select role     FXDMS Read Only
	Config_Save Screenshot    IDM-SMK 022       On roles list Select role2 FXDMS Read Only
	Role_Filter usename     FXAUTOUSER1
	Config_Save Screenshot    IDM-SMK 022       second time Filter usename FXAUTOUSER1
	Role_user should not be in the list
	Config_Save Screenshot    IDM-SMK 022      user should not be in the list


IDM-SMK 023
	[Documentation]     Verify unsuccessful log-in
    [Tags]      SMOKE      REGTC
	Login_Access portal
	Config_Save Screenshot    IDM-SMK 023      Access portal
	Login_Click on the sign button
	Config_Save Screenshot    IDM-SMK 023      Click on the sign button
	Login_Input Username        fujxxx@gmail.com
	Config_Save Screenshot    IDM-SMK 023       Input Username
	Login_Input Password        Pa$$w0rdwer
	Config_Save Screenshot    IDM-SMK 023       Input Password
	Login_Click on Sign-In button only
	Config_Save Screenshot    IDM-SMK 023       Click on Sign-In button only
    Login_Transaction should be unsuccessful
    Config_Save Screenshot    IDM-SMK 023      Transaction should be unsuccessful

IDM 024
	[Documentation]     Verify successful log-in and out to Telportal portal
    [Tags]      ENVB_SMOKE_ONLY
	Login_Open browser URL and access portal		UAT
	Config_Save Screenshot    IDM 024     Open browser URL and access portal UAT
	Login_Click on the Sign button 
	Config_Save Screenshot    IDM 024     Click on the Sign button 
	Login_Enter Username and Password		fujitest007+Emailformat@gmail.com		Pa$$w0rd
	Config_Save Screenshot    IDM 024     Enter Username and Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM 024     Click on Sign-In button
	Login_User must be signed in successfully
	Config_Save Screenshot    IDM 024     User must be signed in successfully
	Login_Click Sign out button on the upper right corner of the page
	Config_Save Screenshot    IDM 024     Click Sign out button on the upper right corner of the page
	Login_Confirmation pop up window should show
	Config_Save Screenshot    IDM 024     Confirmation pop up window should show
	Login_Click sign out button 
	Config_Save Screenshot    IDM 024     Click sign out button
	Login_User session should end		UAT
	Config_Save Screenshot    IDM 024     User session should end UAT	

IDM 025
	[Documentation]     Verify successful log-in and out to QBE portal
    [Tags]      ENVB_SMOKE_ONLY
	Login_Open browser URL and access portal		QBE
	Config_Save Screenshot    IDM 025     Open browser URL and access portal QBE
	Login_Click on the Sign button 
	Config_Save Screenshot    IDM 025     Click on the Sign button 
	Login_Enter Username and Password		fujitest007+Emailformat@gmail.com		Pa$$w0rd
	Config_Save Screenshot    IDM 025     Enter Username and Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM 025     Click on Sign-In button
	Login_User must be signed in successfully
	Config_Save Screenshot    IDM 025     User must be signed in successfully
	Login_Click Sign out button on the upper right corner of the page
	Config_Save Screenshot    IDM 025     Click Sign out button on the upper right corner of the page
	Login_Confirmation pop up window should show
	Config_Save Screenshot    IDM 025     Confirmation pop up window should show
	Login_Click sign out button 
	Config_Save Screenshot    IDM 025     Click sign out button
	Login_User session should end		QBE
	Config_Save Screenshot    IDM 025     User session should end QBE


IDM 026
	[Documentation]     Verify successful log-in and out to HK portal
    [Tags]      ENVB_SMOKE_ONLY
	Login_Open browser URL and access portal		HK
	Config_Save Screenshot    IDM 026     Open browser URL and access portal HK
	Login_Click on the Sign button 
	Config_Save Screenshot    IDM 026     Click on the Sign button 
	Login_Enter Username and Password		fujitest007+Emailformat@gmail.com		Pa$$w0rd
	Config_Save Screenshot    IDM 026     Enter Username and Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM 026     Click on Sign-In button
	Login_User must be signed in successfully
	Config_Save Screenshot    IDM 026     User must be signed in successfully
	Login_Click Sign out button on the upper right corner of the page
	Config_Save Screenshot    IDM 026     Click Sign out button on the upper right corner of the page
	Login_Confirmation pop up window should show
	Config_Save Screenshot    IDM 026     Confirmation pop up window should show
	Login_Click sign out button 
	Config_Save Screenshot    IDM 026     Click sign out button
	Login_User session should end		HK
	Config_Save Screenshot    IDM 026     User session should end HK


IDM 027
	[Documentation]     Verify successful log-in and out to SG portal
    [Tags]      ENVB_SMOKE_ONLY
	Login_Open browser URL and access portal		SG
	Config_Save Screenshot    IDM 027     Open browser URL and access portal SG
	Login_Click on the Sign button 
	Config_Save Screenshot    IDM 027     Click on the Sign button 
	Login_Enter Username and Password		fujitest007+Emailformat@gmail.com		Pa$$w0rd
	Config_Save Screenshot    IDM 027     Enter Username and Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM 027     Click on Sign-In button
	Login_User must be signed in successfully
	Config_Save Screenshot    IDM 027     User must be signed in successfully
	Login_Click Sign out button on the upper right corner of the page
	Config_Save Screenshot    IDM 027     Click Sign out button on the upper right corner of the page
	Login_Confirmation pop up window should show
	Config_Save Screenshot    IDM 027     Confirmation pop up window should show
	Login_Click sign out button 
	Config_Save Screenshot    IDM 027     Click sign out button
	Login_User session should end		SG
	Config_Save Screenshot    IDM 027     User session should end SG

IDM 028
	[Documentation]     Verify successful log-in and out to TW portal
    [Tags]      ENVB_SMOKE_ONLY
	Login_Open browser URL and access portal		TW
	Config_Save Screenshot    IDM 028     Open browser URL and access portal TW
	Login_Click on the Sign button 
	Config_Save Screenshot    IDM 028     Click on the Sign button 
	Login_Enter Username and Password		fujitest007+Emailformat@gmail.com		Pa$$w0rd
	Config_Save Screenshot    IDM 028     Enter Username and Password
	Login_Click on Sign-In button
	Config_Save Screenshot    IDM 028     Click on Sign-In button
	Login_User must be signed in successfully
	Config_Save Screenshot    IDM 028     User must be signed in successfully
	Login_Click Sign out button on the upper right corner of the page
	Config_Save Screenshot    IDM 028     Click Sign out button on the upper right corner of the page
	Login_Confirmation pop up window should show
	Config_Save Screenshot    IDM 028     Confirmation pop up window should show
	Login_Click sign out button 
	Config_Save Screenshot    IDM 028     Click sign out button
	Login_User session should end		TW
	Config_Save Screenshot    IDM 028     User session should end TW



#-------------------------- demo test start ----------------------------------------

IDM-Demo-001
    [Documentation]     Verify successful log in to IDM portal
    [Tags]          DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-001      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-001      Validate dashbord page

IDM-Demo-002
    [Documentation]     Verify successful user search transaction
    [Tags]          DEMO    002reg
    Login_System Login
	Config_Save Screenshot    IDM-Demo-002      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-002      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-002      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-Demo-002      Verify user search transaction

IDM-RGN-24
    [Documentation]     Successful User search using "User name" field
    [Tags]      REGTC    RGN24
    Login_System Login
	Config_Save Screenshot    IDM-RGN-24     System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-24      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-RGN-24      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-24      Verify user search transaction
	User_Enter the username for filter      Julian
	Config_Save Screenshot    IDM-RGN-24      Enter the username for filter
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-24     Verify user search transaction - all user with (Julian) text on username should appear on search result


IDM-RGN-25
    [Documentation]     Successful User search using "First name" text field
    [Tags]      REGTC    RGN25
    Login_System Login
	Config_Save Screenshot    IDM-RGN-25     System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-25      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-RGN-25      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-25      Verify user search transaction
	User_Enter first name for filter      Julian
	Config_Save Screenshot    IDM-RGN-25      Enter first name for filter
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-25     Verify user search transaction - all user with (Julian) text on First name should appear on search result

IDM-RGN-26
    [Documentation]     Successful User search using "Last name" text field
    [Tags]      REGTC    RGN26
    Login_System Login
	Config_Save Screenshot    IDM-RGN-26     System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-26      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-RGN-26      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-26      Verify user search transaction
	User_Enter last name for filter      Alnas
	Config_Save Screenshot    IDM-RGN-26      Enter last name for filter
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-26     Verify user search transaction - all user with (Alnas) text on last name should appear on search result

IDM-RGN-27
    [Documentation]     Validate filter functionality on search result
    [Tags]      REGTC    RGN27
    Login_System Login
	Config_Save Screenshot    IDM-RGN-27     System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-27      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-RGN-27      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-27      Verify user search transaction
#	User_Verify user search transaction
#	Config_Save Screenshot    IDM-RGN-27     Verify user search transaction
    User_Enter filter text      FXDMS
    Config_Save Screenshot    IDM-RGN-27    Enter filter text
    User_validate entered filter text
    Config_Save Screenshot    IDM-RGN-27    validate entered filter text


IDM-RGN-28
    [Documentation]     Validate filter functionality on search result
    [Tags]      REGTC    RGN28
    Login_System Login
	Config_Save Screenshot    IDM-RGN-28     System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-28      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-RGN-28      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-RGN-28      Verify user search transaction
#	User_Verify user search transaction
#	Config_Save Screenshot    IDM-RGN-28     Verify user search transaction
    User_Enter the username for filter      Julian
	Config_Save Screenshot    IDM-RGN-28      Enter the username for filter
    User_Enter first name for filter      Julian
	Config_Save Screenshot    IDM-RGN-28      Enter first name for filter
	User_Enter last name for filter      Alnas
	Config_Save Screenshot    IDM-RGN-28      Enter last name for filter
    User_Click Cancel button
    Config_Save Screenshot    IDM-RGN-28     Click Cancel button
    User_User name/First name/Last textfield will be cleared
    Config_Save Screenshot    IDM-RGN-28        User name/First name/Last textfield will be cleared

IDM-RGN-29
    [Documentation]     Validate filter functionality on search result
    [Tags]      REGTC    RGN29
    Login_System Login
    Config_Save Screenshot    IDM-RGN-29     System Login
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-29      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-RGN-29      go to admin page
    User_Verify user search transaction
    Config_Save Screenshot    IDM-RGN-29      Verify user search transaction
    User_Maximum 25 records will be listed on results
    Config_Save Screenshot    IDM-RGN-29     Maximum 25 records will be listed on results
    User_validate records per page dropdown list
    Config_Save Screenshot    IDM-RGN-29     validate records per page dropdown list
    User_Filter records listed on results       25
    Config_Save Screenshot    IDM-RGN-29        Filter records listed on results 25
    User_Filter records listed on results       50
    Config_Save Screenshot    IDM-RGN-29        Filter records listed on results 50
    User_Filter records listed on results       100
    Config_Save Screenshot    IDM-RGN-29        Filter records listed on results 100

IDM-RGN-30
    [Documentation]     Validate filter functionality on search result
    [Tags]      REGTC    RGN30
    Login_System Login
    Config_Save Screenshot    IDM-RGN-30     System Login
    Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-RGN-30      Validate dashbord page
    Dashbord_go to admin page
    Config_Save Screenshot    IDM-RGN-30      go to admin page
    User_Verify user search transaction
    Config_Save Screenshot    IDM-RGN-30      Verify user search transaction
    User_Maximum 25 records will be listed on results
    Config_Save Screenshot    IDM-RGN-29     Maximum 25 records will be listed on results
    User_Click page 2
    Config_Save Screenshot    IDM-RGN-29     Click page 2
    User_Maximum 25 records will be listed on results
    Config_Save Screenshot    IDM-RGN-29     Maximum 25 records will be listed on results page 2
    User_Click next button
    Config_Save Screenshot    IDM-RGN-29     Click next button
    User_Maximum 25 records will be listed on results
    Config_Save Screenshot    IDM-RGN-29     Maximum 25 records will be listed on results next page
    User_Click Previous button
    Config_Save Screenshot    IDM-RGN-29     Click Previous button
    User_Maximum 25 records will be listed on results
    Config_Save Screenshot    IDM-RGN-29     Maximum 25 records will be listed on results previous page

IDM-Demo-003
    [Documentation]     Verify successful view user of User details
    [Tags]          DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-003      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-003      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-003      go to admin page
	User_Verify user search transaction
	Config_Save Screenshot    IDM-Demo-003      Verify user search transaction
	User_Click user from the search list
	Config_Save Screenshot    IDM-Demo-003      Click user from the search list
	User_Validate popup tabs availability
	Config_Save Screenshot    IDM-Demo-003      Validate popup tabs availability
	User_Validate user permission tab propaties availability
	Config_Save Screenshot    IDM-Demo-003     Validate user permission tab propaties availability
	User_Validate contact info tab propaties availability
	Config_Save Screenshot    IDM-Demo-003     Validate contact info tab propaties availability
	User_Validate user details tab propaties availability
	Config_Save Screenshot    IDM-Demo-003     Validate user details tab propaties availability

IDM-Demo-004
    [Documentation]     Verify successful navigation to Group menu
    [Tags]      DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-004      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-004      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-004      go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-Demo-004      Click on Groups
	User_Validate Groups page propaties
	Config_Save Screenshot    IDM-Demo-004      Validate Groups page propaties
	User_Validate participating users tab propaties
	Config_Save Screenshot    IDM-Demo-004     Validate participating users tab propaties
	User_Validate add participats propaties
	Config_Save Screenshot    IDM-Demo-004     Validate add participats propaties
	User_Validate group propaties tab
	Config_Save Screenshot    IDM-Demo-004     Validate group propaties tab


IDM-Demo-005
    [Documentation]     Verify successful navigation to Modify Organisation menu
    [Tags]      DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-005      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-005      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-005      go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-Demo-005      Click on Organisation
	User_Validate manage organisation
	Config_Save Screenshot    IDM-Demo-005      Validate manage organisation


IDM-Demo-006
    [Documentation]     Verify successful navigation to Password Policy menu
    [Tags]      DEMO	demo_006
    Login_System Login
	Config_Save Screenshot    IDM-Demo-006      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-006      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-006      go to admin page
    User_Click on Organisation password policy
    Config_Save Screenshot    IDM-Demo-006      Click on Organisation password policy
    User_Validate password policy
    Config_Save Screenshot    IDM-Demo-006      Validate password policy


IDM-Demo-007
    [Documentation]     Verify successful navigation to Role menu
    [Tags]      DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-007      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-007      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-007      go to admin page
	User_Click on roles
	Config_Save Screenshot    IDM-Demo-007     Click on roles
	User_Validate roles
	Config_Save Screenshot    IDM-Demo-007     Validate roles
	User_Validate role participating users tab propaties
	Config_Save Screenshot    IDM-Demo-007    Validate role participating users tab propaties
	User_Validate role add participats propaties
	Config_Save Screenshot    IDM-Demo-007    Validate role add participats propaties
	User_Validate role group propaties tab
	Config_Save Screenshot    IDM-Demo-007    Validate role group propaties tab


IDM-Demo-008
    [Documentation]     Verify successful navigation to Application menu
    [Tags]      DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-008      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-008      Validate dashbord page
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-Demo-008      go to admin page
	User_Click on application
	Config_Save Screenshot    IDM-Demo-008      Click on application
	User_Validate application
	Config_Save Screenshot    IDM-Demo-008     Validate application


IDM-Demo-009
    [Documentation]     Verify successful sign out transaction
    [Tags]      DEMO
    Login_System Login
	Config_Save Screenshot    IDM-Demo-009      System Login
	Dashbord_Validate dashbord page
    Config_Save Screenshot    IDM-Demo-009      Validate dashbord page
    Dashbord_menu signout
	Config_Save Screenshot    IDM-Demo-009      menu signout
    Dashbord_Confirm signout
    Config_Save Screenshot    IDM-Demo-009      Confirm signout

#-------------------------- demo test end ----------------------------------------


IDM-ORG 010
	[Documentation]     Verify that session time-out text fields accept correct format
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-010   System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-010   go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-010   Click on Organisation
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-ORG-010   Click on Create new Organisation
	Organization_Input timeout       -
    Organization_error message validation for timout     Must be a number
    Organization_Input timeout       asdsf
    Organization_error message validation for timout     Must be a number
    Organization_Input timeout       0
    Organization_error message validation for timout     Must be a positive number
    Organization_Input timeout       301
    Organization_error message validation for timout     Must be less than 300

IDM-ORG 009
	[Documentation]     Verify unsuccessful creation of organisation (all text fields are empty)
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-009   System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-009   go_to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-009   Click on Organisation
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-ORG-009   Click on Create new Organisation
	Organization_Click Create Button without filling values
	Config_Save Screenshot    IDM-ORG-009   Click Create Button without filling values
	Organization_Validate error messages for all empy fields
	Config_Save Screenshot    IDM-ORG-009   Validate error messages for all empy fields

IDM-ORG 008
	[Documentation]     Verify unsuccessful creation of organisation (organisation already exists)
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-008   System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-008   go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-008   Click on Organisation
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-ORG-008   Click on Create new Organisation
	Organization_Enter Organisation details with name alrady exist
	Config_Save Screenshot    IDM-ORG-008   FORM Enter Organisation details with name alrady exist
    Organization_Click on Create
    Config_Save Screenshot    IDM-ORG-008   Click on Create
    Organization_validate organization name exits
    Config_Save Screenshot    IDM-ORG-008   validate organization name exits




IDM-ORG 006
	[Documentation]     Verify successful creation/addition of organisational unit
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-006  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-006  go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-006  Click on Organisation
	Organization_Select organization    USL
    Config_Save Screenshot    IDM-ORG-006  Select organization
    Organization_Input name in New organisational unit text field
    Config_Save Screenshot    IDM-ORG-006  Input name in New organisational unit text field



IDM-ORG 005
	[Documentation]     Verify successful update of organisation properties
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-005  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-005  go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-005  Click on Organisation
	Organization_Select organization    USL
    Config_Save Screenshot    IDM-ORG-005  Select organization
    Organization_Edit Organisation details
    Config_Save Screenshot    IDM-ORG-005  FORM_Edit Organisation details
    Organization_Successful update
    Config_Save Screenshot    IDM-ORG-005  Successful update


IDM-ORG-004
	[Documentation]     Verify functionality of the cancel button on Create new organisation pop-up window
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-ORG-004  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-004  go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-004  Click on Organisation
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-ORG-004  Click on Create new Organisation
	Organization_Enter Organisation details
	Config_Save Screenshot    IDM-ORG-004  FORM_Enter Organisation details
	Organization_Cancel popup
	Config_Save Screenshot    IDM-ORG-004  Cancel popup
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-ORG-004  Click on Create new Organisation
	Organization_Verify empty form
	Config_Save Screenshot    IDM-ORG-004  Verify empty form

IDM-APP-001
	[Documentation]     Verify successful navigation to Application's Tab
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-APP-001   Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-APP-001   go to admin page
	AppManage_Click on Applications
	Config_Save Screenshot    IDM-APP-001   Click on Applications


IDM-ORG-001
	[Documentation]     Verify successful navigation to Modify Organisation's Tab
    [Tags]      
    Login_System Login
	Config_Save Screenshot    IDM-ORG-001  Verify Sign In
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-ORG-001  go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-ORG-001  Click on Organisation


IDM-001
	[Documentation]     Verify Sign In
    [Tags]      
    Login_System Login
	Config_Save Screenshot    IDM-001-Verify Sign In  Verify Sign In

IDM-002
	[Documentation]     Verify Sign Out
    [Tags]      
    Login_System Login
	Config_Save Screenshot    IDM-002  Verify Sign In
    Dashbord_go to admin page
	Config_Save Screenshot    IDM-002  go to admin page
	Dashbord_menu signout
	Config_Save Screenshot    IDM-002  menu signout
    Dashbord_Confirm signout
    Config_Save Screenshot    IDM-002  Confirm signout

Verify Language
	[Documentation]     Verify Language
    [Tags]      
    Login_Login Page Open Browser
	Config_Save Screenshot    Verify Language  Login Page-Open Browser
	Login_change language
	Config_Save Screenshot    Verify Language  change language
	Login_Enter user login details
	Config_Save Screenshot    Verify Language  Enter user login details for chinease page
	Dashbord_go to admin page
    Config_Save Screenshot    Verify Language  go to admin page



 #--------------------soke

IDM-Create User
	[Documentation]     Create User
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-Create User  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Create User  go to admin page
	User_goto user page
	Config_Save Screenshot    IDM-Create User  goto user page
	User_new user fill new user details
	Config_Save Screenshot    IDM-Create User  new user fill new user details

IDM-Create Organisation
	[Documentation]     Create Organisation
    [Tags]      
	Login_System Login
	Config_Save Screenshot    IDM-Create Organisation  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Create Organisation  go to admin page
	User_Click on Organisation
	Config_Save Screenshot    IDM-Create Organisation  Click on Organisation
	Organization_Click on Create new Organisation
	Config_Save Screenshot    IDM-Create Organisation  Click on Create new Organisation
	${Random_Org_Name} =      Organization_Enter Organisation details
	Config_Save Screenshot    IDM-Create Organisation      FORM Enter Organisation details
	Organization_Click on Create
	Config_Save Screenshot    IDM-Create Organisation     Click on Create
	Organization_Created Organisation verify      ${Random_Org_Name}
	Config_Save Screenshot    IDM-Create Organisation     Created Organisation verify

IDM-Create Group
	[Documentation]     Create Group
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Create Group  System-Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Create Group  go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-Create Group  Click on Groups
	GroupManage_Click on Create new group
	Config_Save Screenshot    IDM-Create Group  Click on Create new group
	GroupManage_Enter group name description
	Config_Save Screenshot    IDM-Create Group  Enter group name description

IDM-Add User to Group
	[Documentation]     Add User to Group
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Add User to Group  Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Add User to Group  DASHBOARD-go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-Add User to Group  Click on Groups
	GroupManage_select organization
	Config_Save Screenshot    IDM-Add User to Group  select organization
	GroupManage_Click on Add Participants
	Config_Save Screenshot    IDM-Add User to Group  Click on Add Participants
	GroupManage_Click on Search
	Config_Save Screenshot    IDM-Add User to Group  Click on Search
	GroupManage_Search for the use previously added User
	Config_Save Screenshot    IDM-Add User to Group  Search for the use previously added User

IDM-Remove User from Group
	[Documentation]     Remove User from Group
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Remove User from Group  Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Remove User from Group  go to admin page
	User_Click on Groups
	Config_Save Screenshot    IDM-Remove User from Group  Click on Groups
	GroupManage_select organization
	Config_Save Screenshot    IDM-Remove User from Group  select organization
	GroupManage_Click on Participanting users
	Config_Save Screenshot    IDM-Remove User from Group  Click_on Participanting users
	GroupManage_Select users you want to remove
	Config_Save Screenshot    IDM-Remove User from Group  Select users you want to remove
	GroupManage_Click on Remove selected users
	Config_Save Screenshot    IDM-Remove User from Group  Click on Remove selected users
	GroupManage_Click on Participanting users
	Config_Save Screenshot    IDM-Remove User from Group  Click on Participanting users
	#GroupManage_Search for the use previously removed
	#Config_Save Screenshot    IDM-Remove User from Group  Search for the use previously removed

IDM-Create Roles
	[Documentation]     Create Roles
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Create Roles  Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Create Roles  go to admin page
	Role_Click on roles
	Config_Save Screenshot    IDM-Create Roles  Click_on roles
	Role_select role organization		FXDMS
	Config_Save Screenshot    IDM-Create Roles  select FXDMS organization
	Role_Click on Create new Role
	Config_Save Screenshot    IDM-Create Roles  Click on Create new Role
	Role_Enter group name description for roles
	Config_Save Screenshot    IDM-Create Roles  Enter group name description for roles

IDM-Add User to Roles
	[Documentation]     Add User to Roles
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Add User to Roles  Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Add User to Roles  go to admin page
	Role_Click on roles
	Config_Save Screenshot    IDM-Add User to Roles  Click on roles
	GroupManage_select organization
	Config_Save Screenshot    IDM-Add User to Roles  select organization
	Role_Click on Add role Participants
	Config_Save Screenshot    IDM-Add User to Roles  Click on Add role Participants
	Role_Click on users Search
	Config_Save Screenshot    IDM-Add User to Roles  Click on users Search
	Role_Select users you want to add
	Config_Save Screenshot    IDM-Add User to Roles  Select users you want to add
	Role_Click on Add selected users
	Config_Save Screenshot    IDM-Add User to Roles  Click on Add selected users
	Role_Click on Participating Users
	Config_Save Screenshot    IDM-Add User to Roles  Click on Participating Users
	Role_verify participated user
	Config_Save Screenshot    IDM-Add User to Roles  verify participated user


IDM-Create Application
	[Documentation]     Create Application	
    [Tags]            
	Login_System Login
	Config_Save Screenshot    IDM-Create Application  Login System Login
	Dashbord_go to admin page
	Config_Save Screenshot    IDM-Create Application  go to admin page
	AppManage_Click on Applications
	Config_Save Screenshot    IDM-Create Application  Click on Applications
	AppManage_Click on Create new application
	Config_Save Screenshot    IDM-Create Application  Click on Create new application
	AppManage_Select Organisation
	Config_Save Screenshot    IDM-Create Application  Select Organisation
	AppManage_Enter application name and description
	Config_Save Screenshot    IDM-Create Application  Enter application name and description


