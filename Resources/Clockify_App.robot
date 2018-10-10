*** Settings ***

Resource  PO/LandingPage.robot
Resource  PO/TimeTrackerPage.robot



*** keywords ***


Login
    LandingPage.Login

Logout
    LandingPage.Login
    TimeTrackerPage.Logout

Create Client
    LandingPage.Login
    TimeTrackerPage.Create Client

Delete Client
    LandingPage.Login
    #Creating a client just to make sure there is atleast a client to delete
    TimeTrackerPage.Create Client
    TimeTrackerPage.Delete Client

Create Project
    LandingPage.Login
    TimeTrackerPage.Create Project

Delete Project
    LandingPage.Login
    #Creating a project just to make sure there is atleast a project to delete
    TimeTrackerPage.Create Project
    TimeTrackerPage.Delete Project

Add Time Manually In Future
    LandingPage.Login
    TimeTrackerPage.Add Time Manually In Future


Add Time Manually In Past
    LandingPage.Login
    TimeTrackerPage.Add Time Manually In Past

Add Time Using Timer
    LandingPage.Login
    TimeTrackerPage.Add Time Using Timer


Delete Time Entry
    LandingPage.Login
    # Adding some time to the system just to make sure there is atleast one record to delete
    TimeTrackerPage.Add Time Manually In Future
    # Deletes always the first found record in the system from the top
    TimeTrackerPage.Delete Time Entry

Create Work Space
    LandingPage.Login
    TimeTrackerPage.Create Work Space

Delete Work Space
    LandingPage.Login
    # Creating a workspace just to make sure that there is atleast one workspace to delete
    TimeTrackerPage.Create Work Space
    # Deletes always the first found workspace in the system from the top
    TimeTrackerPage.Delete Work Space

Create Tags
    LandingPage.Login
    TimeTrackerPage.Create Tags

Delete Tags
    LandingPage.Login
    # Creating a Tag just to make sure that there is atleast one Tag to delete
    TimeTrackerPage.Create Tags
    # Deletes always the first found Tag in the system from the top
    TimeTrackerPage.Delete Tags

Add Team Member
    LandingPage.Login
    TimeTrackerPage.Add Team Member

Report Checking
    LandingPage.Login
    TimeTrackerPage.Report Checking