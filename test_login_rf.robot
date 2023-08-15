*** Settings ***
Documentation       Suite description
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://dareit.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${LOGIN FORM}  xpath=//*[@id='__next']/form
${SIGNOUTBUTTON}  xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span
${ADDPLAYERBUTTON}  xpath=//main/div[3]/div[2]/div[1]/div[1]/a/button
${E-MAILFIELD}    xpath=//input[@name = 'email']
${NAMEFIELD}   xpath=//input[@name = 'name']
${SURNAMEFIELD}   xpath=//input[@name = 'surname']
${AGEFIELD}    xpath=//input[@name = 'age']
${MAINPOSITIONFIELD}   xpath=//input[@name = 'mainPosition']
${ADDPLAYER}    xpath=//button[@type='submit']
${ADDEDAPLAYER}   xpath=//*[@id='sj7bgkps3j']/div[1]



*** Test Cases ***

Login to the system
    Open Login Page
    Type in email
    Type in password
    Wait Until Element Is Visible    ${SIGNINBUTTON}
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

Logout of the system
    Open Login Page
    Type In Email
    Type In Password
    Wait Until Element Is Visible    ${SIGNINBUTTON}
    Click On The Submit Button
    Wait Until Element Is Visible    ${SIGNOUTBUTTON}
    Click On The Signout Button
    Assert Login Page
    [Teardown]    Close Browser

Filling add player form
    Open Login Page
    Type In Email
    Type In Password
    Wait Until Element Is Visible    ${SIGNINBUTTON}
    Click On The Submit Button
    Wait Until Element Is Visible    ${ADDPLAYERBUTTON}
    Click On The Add Player Button
    Wait Until Element Is Visible    ${E-MAILFIELD}
    Type In E-mail
    Type In Name
    Type In Surname
    Type In Age
    Type In Main Position
    Wait Until Element Is Visible    ${ADDPLAYER}
    Click On The Add a Player Button
    Assert AddPlayer
    [Teardown]    Close Browser


*** Keywords ***
Open login page
       Open Browser    ${LOGIN URL}     ${BROWSER}
       Title Should Be     Scouts panel - sign in
Type in email
        Input Text   ${EMAILINPUT}   user07@getnada.com
Type in password
        Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Submit button
        Click Element    xpath=//*[(text()='Sign in')]
Click on the Signout button
        Click Element    xpath=//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span
Click on the Add Player Button
        Click Element    xpath=//main/div[3]/div[2]/div[1]/div[1]/a/button
Type in E-mail
        Input Text    ${E-MAILFIELD}  jacek@gmail.com
Type in Name
        Input Text    ${NAMEFIELD}   Jacek
Type in Surname
        Input Text    ${SURNAMEFIELD}  Kopacz
Type in Age
        Input Text    ${AGEFIELD}  10/10/1993
Type in Main Position
        Input Text    ${MAINPOSITIONFIELD}  Striker
Click on the Add a Player button
        Click Element    xpath=//button[@type='submit']
Assert AddPlayer
        Wait Until Element Is Visible    ${ADDEDAPLAYER}
Assert dashboard
        Wait Until Element Is Visible    ${PAGELOGO}
        Title Should Be    Scouts panel
        Capture Page Screenshot    alert.png
Assert login page
        Wait Until Element Is Visible    ${LOGIN FORM}
        Title Should Be     Scouts panel - sign in