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

Test case 3 Create Client
      Clockify_App.Create Client

Test case 4 Delete Client
      Clockify_App.Delete Client

Test case 5 Create Project
      Clockify_App.Create Project

Test case 6 Delete Project
      Clockify_App.Delete Project

Test case 7 Add Time Manually In Future
      Clockify_App.Add Time Manually In Future

Test case 8 Add Time Manually In Past
      Clockify_App.Add Time Manually In Past

Test case 9 Add Time Using Timer
      Clockify_App.Add Time Using Timer

Test case 10 Delete Time Entry
      Clockify_App.Delete Time Entry

Test case 11 Create Work Space
      Clockify_App.Create Work Space

Test case 12 Delete Work Space
      Clockify_App.Delete Work Space

Test case 13 Create Tags
      Clockify_App.Create Tags

Test case 14 Delete Tags
      Clockify_App.Delete Tags

Test case 15 Add Team Member
      Clockify_App.Add Team Member

Test case 16 Report Checking
      Clockify_App.Report Checking

Test case 17 Dashboard Checking
      [Tags]  current
      Clockify_App.Dashboard Checking