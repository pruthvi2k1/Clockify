*** Settings ***
library  Selenium2Library

*** Variables ***
${UserName}=  xpath=//*[@id="email"]
${PassWord}=  xpath=//*[@id="password"]
${LoginButton}=  xpath=//*[@type="button"]

*** keywords ***

Check Many Invalid Login Scenarios
    [Arguments]  ${Invalid Login Scenarios}

    :FOR  ${Invalid Login Scenario}  IN  @{Invalid Login Scenarios}
    \  Log  ${Invalid Login Scenario}
    \  Go To  ${URL}
    \  wait until page contains element  ${UserName}
    \  wait until page contains element  ${PassWord}
    \  wait until page contains element  ${LoginButton}
    \  input text  ${UserName}  @{Invalid Login Scenario}[0]
    \
    \  input text  ${PassWord}  @{Invalid Login Scenario}[1]
    \
    \  click button  ${LoginButton}
    \
    \  Wait Until Page contains  @{Invalid Login Scenario}[2]
    \  Page Should contain  @{Invalid Login Scenario}[2]




Login
      Go To  ${URL}
      wait until page contains element  ${UserName}
      wait until page contains element  ${PassWord}
      wait until page contains element  ${LoginButton}
      input text  ${UserName}  pruthvi2k1@yahoo.com
      input text  ${PassWord}  pruthviraj
      click button  ${LoginButton}
      Wait Until Page Does Not Contain  Log in
      Page Should Not Contain  'Log in'



