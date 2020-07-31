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

#page https://envl.portal.fxdms.net/sc/activate.html?t=da9d103e-7fde-4f73-a083-15b922241962&id=da757f7d-99fd-4a04-b56c-ea67ff59dfca
# email activation link
${Email_accountActivationLink}                        https://envl.portal.fxdms.net:443/sc/activate.html?t=da9d103e-7fde-4f73-a083-15b922241962&id=da757f7d-99fd-4a04-b56c-ea67ff59dfca
${Email_txtPassword}     		                    id=password
${Email_txtConPassword}     	                    id=confirm-password
${Email_captcha}			                        jquery=input[id='captcha']:visible
${Email_btnActivate}                               jquery=span[data-i18n='button.activate']:visible





*** Keywords ***
Email_open browser
    #Open Browser    ${ACCOUNT_ACTIVATION_LINK}   chrome    remote_url=${remoteUrl}    desired_capabilities=${DESIRED_CAPABILITIES}
	#Open Browser    ${IDM-ACCOUNT_ACTIVATION_LINK}   firefox    remote_url=${remoteUrl}    desired_capabilities=${DESIRED_CAPABILITIES}
	Wait Until Keyword Succeeds     1 min   1 sec   Open Browser    ${Email_accountActivationLink}    ${browser}

#page https://envl.portal.fxdms.net/sc/activate.html?t=da9d103e-7fde-4f73-a083-15b922241962&id=da757f7d-99fd-4a04-b56c-ea67ff59dfca
Email_Enter Password
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Email_txtPassword}    Supun@123
	Wait Until Keyword Succeeds     1 min   1 sec   input text    ${Email_txtConPassword}    Supun@123
	${IDM-EMAIL_ACTV-Captcha-Input}=	Get Value From User	    Input user name		default
	Wait Until Keyword Succeeds     1 min   1 sec   input text 		${Email_captcha}			${IDM-EMAIL_ACTV-Captcha-Input}
	Wait Until Keyword Succeeds     1 min   1 sec   click element   ${Email_btnActivate}
