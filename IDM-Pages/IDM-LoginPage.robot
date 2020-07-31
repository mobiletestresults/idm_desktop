*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           ReusableModule
Library           Selenium2Library
Library			  Collections
Library           String
Library			  uuid
Library			  Dialogs


*** Variables ***
# page https://envl.portal.fxdms.net
${Login_btnSignIn} 	    				xpath=//html/body/div[2]/div[6]/div[3]/div/p[2]/a/span
${Login_btnSignOut} 	    				xpath=//*[@id="sc-header"]/div/div/div/div/ul/li[2]/a
${Login_btnSignOut_confirm} 	    				xpath=//*[@id="sign-out-link"]
${Login_btnLogin}   			                            //button[@type='submit']
${Login_btnSearch}   			                            id=submit-form
${Login_btnLang}   			                            id=lang-code
${Login_rbChinese}   			                        id=zh-CN
${Login_rbChinese_Traditional}           xpath=//*[@id="l18n-modal"]/div[2]/form/fieldset/div/div/label[3]/input
${Login_rbEnglish}           xpath=//*[@id="en"]
${Login_btnChangeChinese}   			css=#changeLang > span
#${Login_UserName}         AutomationTestUser
#${Login_Password}         Pa$$w0rd

${UAT_Portal_URL}               https://uat-telportal.fxdms.net/sc/
${QBE_Portal_URL}               https://qbe.uatportal.fxdms.net/sc/
${HK_Portal_URL}                https://hk-envb-portal.fxdms.net/sc/
${SG_Portal_URL}                https://sg-envb-portal.fxdms.net/sc/
${TW_Portal_URL}                https://tw-envb-portal.fxdms.net/sc/



*** Keywords ***
# page https://envl.portal.fxdms.net

Login_Sign in Specific User
    [Arguments]    ${username}
    Login_Click on the sign button
    ${password} =    Config_get XML element value    password
    Login_Enter Username and Password    ${username}    ${password}
    Login_Click on Sign-In button

Login_Sign in admin user
    Login_Click on the sign button
    Login_Enter user login details

Login_Sign out user
    Login_Click Sign out button on the upper right corner of the page
    Login_Confirmation pop up window should show
    Login_Click sign out button

Login_User session should end
    [Arguments]         ${portal}
    Run Keyword if      '${portal}' == 'UAT'       Wait Until Keyword Succeeds     1 min   1 sec   Location Should Be    ${UAT_Portal_URL}    
    Run Keyword if      '${portal}' == 'QBE'       Wait Until Keyword Succeeds     1 min   1 sec   Location Should Be    ${QBE_Portal_URL}    
    Run Keyword if      '${portal}' == 'HK'       Wait Until Keyword Succeeds     1 min   1 sec     Location Should Be    ${HK_Portal_URL}    
    Run Keyword if      '${portal}' == 'SG'       Wait Until Keyword Succeeds     1 min   1 sec   Location Should Be    ${SG_Portal_URL}   
    Run Keyword if      '${portal}' == 'TW'       Wait Until Keyword Succeeds     1 min   1 sec   Location Should Be    ${TW_Portal_URL}    

Login_Click sign out button 
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Login_btnSignOut_confirm}

Login_Confirmation pop up window should show 
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Do you wish to sign out?
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain element        ${Login_btnSignOut_confirm}

Login_Click Sign out button on the upper right corner of the page
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Login_btnSignOut}

Login_User must be signed in successfully
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Welcome
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Admin
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Manage users

# Login_Click on Sign-In button    
# 	Wait Until Keyword Succeeds     1 min   1 sec   Click Button     ${Login_btnLogin}

Login_Enter Username and Password
    [Arguments]     ${user_name}      ${password}  
    Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Username    ${user_name}
    Set Log Level   NONE
    Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Password    ${password}
    Set Log Level   INFO

Login_Click on the Sign button 
    Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Login_btnSignIn}
	#Wait Until Keyword Succeeds     1 min   1 sec   Maximize Browser Window
    Wait Until Keyword Succeeds     1 min   1 sec   Set Selenium Speed    ${delay}

Login_Open browser URL and access portal
    [Arguments]         ${portal}
    Run Keyword if      '${portal}' == 'UAT'       Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${UAT_Portal_URL}    ${browser}
    Run Keyword if      '${portal}' == 'QBE'       Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${QBE_Portal_URL}    ${browser}
    Run Keyword if      '${portal}' == 'HK'       Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${HK_Portal_URL}    ${browser}
    Run Keyword if      '${portal}' == 'SG'       Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${SG_Portal_URL}    ${browser}
    Run Keyword if      '${portal}' == 'TW'       Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${TW_Portal_URL}    ${browser}
    Wait Until Keyword Succeeds     1 min   1 sec   Maximize Browser Window
    

Login_Lang change popup validation
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     English
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Chinese (Simplified) - 中文(简体)
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     Chinese (Traditional) - ‪中文(繁體)

Login_Click change button
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_btnChangeChinese}
    sleep       5s


Login_language should be change to Chinese (Traditional)
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     登入


Login_language should be change
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     登录

Login_Select English
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_rbEnglish}

Login_Select Chinese (Traditional) - ‪中文(繁體)
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_rbChinese_Traditional}

Login_Select Chinese (Simplified) - 中文(简体)
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_rbChinese}

Login_Click the -en- at the upper left corner of the page
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_btnLang}

Login_change language
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_btnLang}
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_rbChinese}
    Wait Until Keyword Succeeds     1 min   1 sec   click element     ${Login_btnChangeChinese}

Login_Enter user login details
    ${user_name} =       Config_get XML element value    username
    Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Username    ${user_name}
    Set Log Level   NONE
    ${password} =       Config_get XML element value    password
    Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Password    ${password}
    Set Log Level   INFO
	Wait Until Keyword Succeeds     1 min   1 sec   Click Button     ${Login_btnLogin}

Login_System Login
	Login_Login Page Open Browser
	${user_name} =       Config_get XML element value    username
	Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Username    ${user_name}
	Set Log Level   NONE
	${password} =       Config_get XML element value    password
    Wait Until Keyword Succeeds     1 min   1 sec   Login_Input Password    ${password}
    Set Log Level   INFO
	Wait Until Keyword Succeeds     1 min   1 sec   Click Button     ${Login_btnLogin}


Login_Login Page Open Browser
	#Open Browser    ${ACCOUNT_ACTIVATION_LINK}   chrome    remote_url=${remoteUrl}    desired_capabilities=${desiredCapabilities}
	#Open Browser    ${server}   firefox    remote_url=${remoteUrl}    desired_capabilities=${desiredCapabilities}
	${server_url} =       Config_get XML element value    server-url
    Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${server_url}    ${browser}
    #Wait Until Keyword Succeeds     1 min   1 sec   certificate continue
	Wait Until Keyword Succeeds     1 min   1 sec   click element    ${Login_btnSignIn}
	Wait Until Keyword Succeeds     1 min   1 sec   Maximize Browser Window
    Wait Until Keyword Succeeds     1 min   1 sec   Set Selenium Speed    ${delay}

Login_Access portal
	#Open Browser    ${ACCOUNT_ACTIVATION_LINK}   chrome    remote_url=${remoteUrl}    desired_capabilities=${desiredCapabilities}
	#Open Browser    ${server}   firefox    remote_url=${remoteUrl}    desired_capabilities=${desiredCapabilities}
	${server_url} =       Config_get XML element value    server-url
    Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${server_url}    ${browser}
    Wait Until Keyword Succeeds     1 min   1 sec   Maximize Browser Window
    #Wait Until Keyword Succeeds     1 min   1 sec   certificate continue

Login_Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Login_Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Login_Click on Sign-In button
	Wait Until Keyword Succeeds     1 min   1 sec   Click Button     ${Login_btnLogin}
	Wait Until Keyword Succeeds     1 min   1 sec   page should not contain     The credentials you provided cannot be determined to be authentic.

Login_Click on Sign-In button only
	Wait Until Keyword Succeeds     1 min   1 sec   Click Button     ${Login_btnLogin}

Login_Transaction should be unsuccessful
    Wait Until Keyword Succeeds     1 min   1 sec   page should contain     The credentials you provided cannot be determined to be authentic.

Login_Access to portal successfully
    Login_Access portal
	Login_Click on the sign button
	${user_name} =       Config_get XML element value    username
	Login_Input Username        ${user_name}
	Set Log Level   NONE
	${password} =       Config_get XML element value    password
	Login_Input Password        ${password}
	Set Log Level   INFO
	Login_Click on Sign-In button
