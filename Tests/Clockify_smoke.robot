*** Settings ***

Resource  ../Resources/Clockify_App.robot
Resource  ../Resources/Common.robot

#Test Setup  Begin web test
#Test Teardown  End web test
Suite Setup    Begin web test
Suite Teardown  End web test


*** Variables ***
${BROWSER} =  firefox
${URL} =  https://clockify.me/login

${NEW_CLIENT_NAME} =  some client
${NEW_PROJECT_NAME} =  some project
${NEW_WORKSPACE_NAME} =  some workspace
${NEW_TAG_NAME} =  some tag
${NEW_TEAM_MEMBER_NAME} =  some@some.com
${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE} =  Final Testing on oct 16th 2022
${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST} =  Final Testing on oct 16th 2016
${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER} =  Final Testing Using Timer
*** Test Cases ***

Test case 1 Login to Clockify
      Clockify_App.Login

Test case 2 Log out of Clockify
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Logout

Test case 3 Create Client
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Create Client  ${NEW_CLIENT_NAME}
      [Teardown]  Clockify_App.Delete Client and Logout  ${NEW_CLIENT_NAME}


Test case 4 Delete Client
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Delete Client  ${NEW_CLIENT_NAME}
      [Teardown]  Clockify_App.Logout

Test case 5 Create Project
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Create Project  ${NEW_PROJECT_NAME}
      [Teardown]  Clockify_App.Delete Project and Logout  ${NEW_PROJECT_NAME}

Test case 6 Delete Project
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Delete Project  ${NEW_PROJECT_NAME}
      [Teardown]  Clockify_App.Logout

Test case 7 Create Work Space
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Create Work Space  ${NEW_WORKSPACE_NAME}
      [Teardown]  Clockify_App.Delete Work Space and Logout  ${NEW_WORKSPACE_NAME}

Test case 8 Delete Work Space
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Delete Work Space  ${NEW_WORKSPACE_NAME}
      [Teardown]  Clockify_App.Logout

Test case 9 Create Tags
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Create Tags  ${NEW_TAG_NAME}
      [Teardown]  Clockify_App.Delete Tags and Logout  ${NEW_TAG_NAME}

Test case 10 Delete Tags
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Delete Tags  ${NEW_TAG_NAME}
      [Teardown]  Clockify_App.Logout

Test case 11 Add Team Member
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Team Member  ${NEW_TEAM_MEMBER_NAME}
      [Teardown]  Clockify_App.Logout

Test case 12 Report Checking
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Report Checking
      [Teardown]  Clockify_App.Logout

Test case 13 Dashboard Checking
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Dashboard Checking
      [Teardown]  Clockify_App.Logout

Test case 14 Add Time Manually In Future
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Manually In Future  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}

Test case 15 Add Time Manually In Past
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Manually In Past  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}

Test case 16 Add Time Using Timer
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Using Timer  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}

Test case 17 Delete Time Entry
      [Setup]  Clockify_App.Login
      [Tags]  current
      Clockify_App.Delete Time Entry  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
      [Teardown]  Clockify_App.Logout
