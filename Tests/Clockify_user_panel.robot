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

${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE} =  Final Testing on oct 16th 2022
${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST} =  Final Testing on oct 16th 2016
${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER} =  Final Testing Using Timer

*** Test Cases ***

Test case 1 Add Time Manually In Future
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Manually In Future  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}

Test case 2 Add Time Manually In Past
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Manually In Past  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}

Test case 3 Add Time Using Timer
      [Setup]  Clockify_App.Login
      [Tags]
      Clockify_App.Add Time Using Timer  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}
      [Teardown]  Clockify_App.Delete Time Entry and Logout  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}

Test case 4 Delete Time Entry
      [Setup]  Clockify_App.Login
      [Tags]  current
      Clockify_App.Delete Time Entry  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
      [Teardown]  Clockify_App.Logout
