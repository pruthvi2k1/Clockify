*** Settings ***

Resource  ../Resources/Clockify_App.robot
Resource  ../Resources/Common.robot

Test Setup  Begin web test
Test Teardown  End web test

*** Variables ***
${BROWSER} =  firefox
${URL} =  https://clockify.me/login

*** Test Cases ***

Test case 1 Login to Clockify
      Clockify_App.Login

Test case 2 Log out of Clockify
      Clockify_App.Logout


Test case 3 Create Project
      Clockify_App.Create Project

Test case 4 Delete Project
      [Tags]  current
      Clockify_App.Delete Project

Test case 5 Add Time Manually In Future
      Clockify_App.Add Time Manually In Future

Test case 6 Add Time Manually In Past
      Clockify_App.Add Time Manually In Past

Test case 7 Add Time Using Timer

      Clockify_App.Add Time Using Timer

Test case 8 Delete Time Entry
      Clockify_App.Delete Time Entry

