*** Settings ***

Resource  PO/LandingPage.robot
Resource  PO/TimeTrackerPage.robot



*** keywords ***


Login
    LandingPage.Login

Logout
    LandingPage.Login
    TimeTrackerPage.Logout


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

