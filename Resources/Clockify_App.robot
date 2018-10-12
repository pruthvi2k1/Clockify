*** Settings ***

Resource  PO/LandingPage.robot
Resource  PO/TimeTrackerPage.robot

*** keywords ***

Login
    LandingPage.Login

Logout
    TimeTrackerPage.Logout

Create Client
    [Arguments]  ${NEW_CLIENT_NAME}
    TimeTrackerPage.Create Client  ${NEW_CLIENT_NAME}

Delete Client
    [Arguments]  ${NEW_CLIENT_NAME}
    #Creating a client just to make sure there is atleast a client to delete
    TimeTrackerPage.Create Client  ${NEW_CLIENT_NAME}
    # Below function deletes first client it sees
    TimeTrackerPage.Delete Client  ${NEW_CLIENT_NAME}

Create Project
    [Arguments]  ${NEW_PROJECT_NAME}
    TimeTrackerPage.Create Project  ${NEW_PROJECT_NAME}

Delete Project
    [Arguments]  ${NEW_PROJECT_NAME}
    #Creating a project just to make sure there is atleast a project to delete
    TimeTrackerPage.Create Project  ${NEW_PROJECT_NAME}
    # Below function deletes first project it sees
    TimeTrackerPage.Delete Project  ${NEW_PROJECT_NAME}

Add Time Manually In Future
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
    TimeTrackerPage.Add Time Manually In Future  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}

Add Time Manually In Past
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}
    TimeTrackerPage.Add Time Manually In Past  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}

Add Time Using Timer
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}
    TimeTrackerPage.Add Time Using Timer  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}

Delete Time Entry
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
    # Adding some time to the system just to make sure there is atleast one record to delete
    TimeTrackerPage.Add Time Manually In Future  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}
    # Deletes always the first found record in the system from the top
    TimeTrackerPage.Delete Time Entry  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_FUTURE}

Create Work Space
    [Arguments]  ${NEW_WORKSPACE_NAME}
    TimeTrackerPage.Create Work Space  ${NEW_WORKSPACE_NAME}

Delete Work Space
    [Arguments]  ${NEW_WORKSPACE_NAME}
    # Creating a workspace just to make sure that there is atleast one workspace to delete
    TimeTrackerPage.Create Work Space  ${NEW_WORKSPACE_NAME}
    # Deletes always the first found workspace in the system from the top
    TimeTrackerPage.Delete Work Space  ${NEW_WORKSPACE_NAME}

Create Tags
    [Arguments]  ${NEW_TAG_NAME}
    TimeTrackerPage.Create Tags  ${NEW_TAG_NAME}

Delete Tags
    [Arguments]  ${NEW_TAG_NAME}
    # Creating a Tag just to make sure that there is atleast one Tag to delete
    TimeTrackerPage.Create Tags  ${NEW_TAG_NAME}

    # Deletes always the first found Tag in the system from the top
    TimeTrackerPage.Delete Tags  ${NEW_TAG_NAME}

Add Team Member
    [Arguments]  ${NEW_TEAM_MEMBER_NAME}
    TimeTrackerPage.Add Team Member  ${NEW_TEAM_MEMBER_NAME}

Report Checking
    TimeTrackerPage.Report Checking

Dashboard Checking
    TimeTrackerPage.Dashboard Checking

################################################# State Management Keywords#################################################

Delete Client and Logout
    [Arguments]  ${NEW_CLIENT_NAME}
    TimeTrackerPage.Delete Client  ${NEW_CLIENT_NAME}
    TimeTrackerPage.Logout

Delete Project and Logout
    [Arguments]  ${NEW_PROJECT_NAME}
    TimeTrackerPage.Delete Project  ${NEW_PROJECT_NAME}
    TimeTrackerPage.Logout

Delete Work Space and Logout
    [Arguments]  ${NEW_WORKSPACE_NAME}
    TimeTrackerPage.Delete Work Space  ${NEW_WORKSPACE_NAME}
    TimeTrackerPage.Logout

Delete Tags and Logout
    [Arguments]  ${NEW_TAG_NAME}
    TimeTrackerPage.Delete Tags  ${NEW_TAG_NAME}
    TimeTrackerPage.Logout

Delete Time Entry and Logout
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
    TimeTrackerPage.Delete Time Entry  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
    TimeTrackerPage.Logout