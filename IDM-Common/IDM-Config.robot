*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           OperatingSystem
Library           DateTime
Library           XML


*** Variables ***
${server}          			                                https://uat-portal.fxdms.net/sc/
${browser}        			                                chrome
${delay}          			                                .5 second   #Set Selenium Speed
${loginUrl}      			                                ${server}/scsrv/starthere
${welcomeUrl}    			                                ${server}/up/admin/users-manage.html
${desiredCapabilities}                                      browserName:firefox,version:34.0
${remoteUrl}                                                http://10.101.65.75:4444/wd/hub
${ProjectFolderName}                                              IDM_Demo_Smoke_Win8_Chrome
${BuildNumber}                                              1

${XmlFile}                          /Users/fxdmspmotestteam/Documents/config/config.xml
${envirement}                       envb
${project}                          idm

*** Keywords ***
Config_Close all browsers
    Wait Until Keyword Succeeds     1 min   1 sec   close all browsers

Config_Save Screenshot
    [Arguments]    ${testnumber}    ${name}
    Wait Until Keyword Succeeds     1 min   1 sec   Capture Page Screenshot  ${browser}-${testnumber}-${name}.png

Config_Create Screenshots Folder
    ${folderName}=    Set Variable   screenshots
    Set Global Variable      ${folderName}
    Wait Until Keyword Succeeds     1 min   1 sec   Create Directory    ${folderName}

Config_Finalize the Executed Result
    ${myDate} =     Get Current Date    result_format=%Y%m%d%H%M%S
    Wait Until Keyword Succeeds     1 min   1 sec   move files      ${EXECDIR}/*.png      /Users/fxdmspmotestteam/Documents/JenkinsScreenshots/${ProjectFolderName}/screenshots/BuildNO-${BuildNumber}-${myDate}-${browser}
    Wait Until Keyword Succeeds     1 min   1 sec   Close All Browsers

Config_get XML element value
    [Arguments]     ${param}
    ${root}=    Parse XML    ${XmlFile}
    Should Be Equal    ${root.tag}    credentials
    ${xml_node_value}    Set Variable
    ${xml_node_value}=      Get Element Text    ${root}    user-login[@environment='${envirement}'][@project='${project}'].${param}
    [Return]    ${xml_node_value}