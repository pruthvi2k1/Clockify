*** Settings ***
library  Selenium2Library


*** Variables ***
${UserName}=  xpath=//*[@id="email"]
${PassWord}=  xpath=//*[@id="password"]
${LoginButton}=  xpath=//*[@type="button"]


*** keywords ***


Login

      Go To  ${URL}
      wait until page contains element  ${UserName}
      input text  ${UserName}  pruthvi2k1@yahoo.com
      input text  ${PassWord}  pruthviraj
      click button  ${LoginButton}
      Page Should Not Contain  'Log in'


