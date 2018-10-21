*** Settings ***

Resource  ../Resources/Clockify_App.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/DataManager.robot

#Test Setup  Begin web test
#Test Teardown  End web test
Suite Setup    Begin web test
Suite Teardown  End web test

*** Variables ***

${BROWSER} =  firefox
${URL} =  https://clockify.me/login

${INVALID_CREDENTIALS_PATH_CSV} =  C:\\Users\\Owner\\PycharmProjects\\Clockify\\Data\\Users.csv

*** Test Cases ***

Test case 0 Check Many Invalid Login Scenarios
      [Tags]  current
      ${Invalid Login Scenarios} =  DataManager.Get CSV Data  ${INVALID_CREDENTIALS_PATH_CSV}
      Clockify_App.Check Many Invalid Login Scenarios  ${Invalid Login Scenarios}

Test case 1 Login to Clockify
      Clockify_App.Login
      [Teardown]  Clockify_App.Logout

Test case 2 Log out of Clockify
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Logout

