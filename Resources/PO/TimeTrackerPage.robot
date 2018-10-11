*** Settings ***
library  Selenium2Library

*** variables ***

${Manual Mode Button}=  xpath=//button[@title="Manual Mode"]
${Description Box}=  xpath=//*[@name="desc"]
${Starting Time Box}=  xpath=//single-date-picker/div/div[1]/input
${Ending Time Box}=  xpath=//single-date-picker/div/div[2]/input
${Calendar Icon}=  xpath=//span[@class="icon--calendar"]
${Month And Year column}=  xpath=//th[@class="month"]
${Date 16th}=  xpath=//tbody/tr/td[contains(text(), "16")]
${Next Month Button}=  xpath=//th[@class="next available"]
${ADD Button}=  xpath=//button[@type="button"]
${Description Element1}=  xpath=//input[@title="Final Testing on oct 16th 2022"]
${Description Element2}=  xpath=//input[@title="Final Testing on oct 16th 2016"]
${Dots Icon}=  xpath=//button[@class="icon--dots"]


${Timer Mode Button}=  xpath=//button[@title="Timer Mode"]
${Stop Watchh START Button}=  xpath=//button[@class="stopwatch--button"]
${Stop Watchh END Button}=  xpath=//button[@class="stopwatch--button stopwatch--button--started"]
${Description Element3}=  xpath=//input[@title="Final Testing Using Timer"]


${User Name Element}=  xpath=//sidebar/div/section/a/div[1]/span
${Log Out Link}=  Log out


${Previous Month Button}=  xpath=//th[@class="prev available"]

${PROJECTS Element}=  xpath=//li/a/span[contains(text(),'projects')]
${CREATE NEW PROJECT BUTTON}=  xpath=//button[@class="button-create-new"]
${project name text box}=  xpath=//input[@placeholder="Project name..."]
${Dots Icon In Projects Page}=  xpath=//table/tbody/tr[1]/td[1]/section/i[@class="icon--dots"]

${CLIENTS Element}=  xpath=//a/span[contains(text(),'clients')]
${client name text box}=  xpath=//input[@placeholder="New Client name..."]
${Client ADD Button}=  xpath=//span[contains(text(),'Add')]

${Delete Client Button}=  xpath=//a[@class="buttons-workspaces--cross"]


${WORKSPACES Element}=  xpath=//li/a/span[contains(text(),'workspaces')]
${CREATE NEW WORKSPACE BUTTON}=  xpath=//a[@class="workspace__button-create-new"]
${WORKSPACE NAME text box}=  xpath=//create-new-workspace/div/div/div[2]/div/input

${DELETE WORKSPACE BUTTON}=  xpath=//span[@class="item--leave-workspace"]
${Check Box}=  xpath=//input[@id="checkbox"]

${TAGS Element}=  xpath=//a/span[contains(text(),'tags')]
${Tag name text box}=  xpath=//input[@placeholder="New tag name..."]
${Tag ADD Button}=  xpath=//span[contains(text(),'Add')]

${Delete Tag Button}=  xpath=//a[@class="buttons-workspaces--cross"]

${TEAM Element}=  xpath=//a/span[contains(text(),'team')]
${TEAM Member name text box}=  xpath=//input[@placeholder="Add new members by email address..."]
${TEAM Member ADD Button}=  xpath=//button[@type="button"]


${REPORTS Element}=  xpath=//a/span[contains(text(),'reports')]
*** keywords ***

Create Client
    [Arguments]  ${NEW_CLIENT_NAME}
    wait until page contains element  ${CLIENTS Element}
    click element  ${CLIENTS Element}
    wait until page contains element  ${client name text box}
    input text  ${client name text box}  ${NEW_CLIENT_NAME}
    click element  ${Client ADD Button}
    page should contain  ${NEW_CLIENT_NAME}

Delete Client
    [Arguments]  ${NEW_CLIENT_NAME}
    wait until page contains element  ${CLIENTS Element}
    click element  ${CLIENTS Element}
    wait until page contains element  ${Delete Client Button}
    click element  ${Delete Client Button}
    click button  YES
    wait until page contains  Client deleted
    page should contain  Client deleted


Create Project
    [Arguments]  ${NEW_PROJECT_NAME}
    wait until page contains element  ${PROJECTS Element}
    click element  ${PROJECTS Element}
    click button  ${CREATE NEW PROJECT BUTTON}
    input text  ${project name text box}  ${NEW_PROJECT_NAME}
    click button  CREATE
    page should contain  ${NEW_PROJECT_NAME}

Delete Project
    [Arguments]  ${NEW_PROJECT_NAME}
    Reload Page
    wait until page contains element  ${PROJECTS Element}
    click element  ${PROJECTS Element}
    click element  ${Dots Icon In Projects Page}
    wait until page contains  Delete
    click link  Delete
    click button  YES
    wait until page contains  Project deleted
    page should contain  Project deleted
    Reload Page
    wait until page contains element  ${PROJECTS Element}


Add Time Manually In Future
      [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
      Wait Until Page Contains Element  ${Manual Mode Button}
      click button  ${Manual Mode Button}
      input text  ${Description Box}  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
      input text  ${Starting Time Box}  1:20PM
      input text  ${Ending Time Box}  1:40PM

      click element  ${Calendar Icon}
      click element  ${Calendar Icon}
      ${monthyear}=  Get Text  ${Month And Year column}
      log  ${monthyear}

      #Entering time on 16th october 2022
      :FOR  ${INDEX}  IN RANGE  100
      \  ${monthyear}=  Get Text  ${Month And Year column}
      \  log  ${monthyear}
      \  Run keyword If  "${monthyear}"=="Oct 2022"  click element  ${Date 16th}
      \  Run keyword If  "${monthyear}"=="Oct 2022"  Exit For Loop
      \  click element  ${Next Month Button}

      log  ${monthyear}

      Click Button  ${ADD Button}

      #Assertion
      Reload Page
      wait until page contains  Sun, 16th Oct
      Page should contain  Sun, 16th Oct
      Page should contain element  ${Description Element1}



Add Time Manually In Past
      [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}
      Wait Until Page Contains Element  ${Manual Mode Button}
      click button  ${Manual Mode Button}
      input text  ${Description Box}  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_IN_PAST}
      input text  ${Starting Time Box}  1:20PM
      input text  ${Ending Time Box}  1:40PM

      click element  ${Calendar Icon}
      click element  ${Calendar Icon}
      ${monthyear}=  Get Text  ${Month And Year column}
      log  ${monthyear}

      #Entering time on 16th october 2016
      :FOR  ${INDEX}  IN RANGE  100
      \  ${monthyear}=  Get Text  ${Month And Year column}
      \  log  ${monthyear}
      \  Run keyword If  "${monthyear}"=="Oct 2016"  click element  ${Date 16th}
      \  Run keyword If  "${monthyear}"=="Oct 2016"  Exit For Loop
      \  click element  ${Previous Month Button}

      log  ${monthyear}

      Click Button  ${ADD Button}

      #Assertion
      Reload Page
      wait until page contains  Sun, 16th Oct
      Page should contain  Sun, 16th Oct
      Page should contain element  ${Description Element2}


Add Time Using Timer
      [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}
      Wait Until Page Contains Element  ${Timer Mode Button}
      click button  ${Timer Mode Button}
      input text  ${Description Box}  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING_USING_TIMER}
      click button  ${Stop Watchh START Button}
      #Below sleep statement is needed to to enter the time in to the system
      sleep  5s
      click button  ${Stop Watchh END Button}
      Page should contain element  ${Description Element3}

Delete Time Entry
    #Deletes the first time entry
    [Arguments]  ${TASK_DESCRIPTION_FOR_HOUR_REPORTING}
    Reload Page
    wait until page contains element  ${Dots Icon}
    click element  ${Dots Icon}
    click link  Delete
    click button  YES
    page should contain  Time entry deleted

Create Work Space
    [Arguments]  ${NEW_WORKSPACE_NAME}

    wait until page contains element  ${WORKSPACES Element}
    click element  ${WORKSPACES Element}
    wait until page contains element  ${CREATE NEW WORKSPACE BUTTON}
    click element  ${CREATE NEW WORKSPACE BUTTON}
    wait until page contains element  ${WORKSPACE NAME text box}
    input text  ${WORKSPACE NAME text box}  ${NEW_WORKSPACE_NAME}
    click button  Continue
    wait until page contains  Create
    click button  Create
    wait until page contains  ${NEW_WORKSPACE_NAME}
    page should contain  ${NEW_WORKSPACE_NAME}


Delete Work Space
    [Arguments]  ${NEW_WORKSPACE_NAME}
    wait until page contains element  ${WORKSPACES Element}
    click element  ${WORKSPACES Element}
    wait until page contains element  ${DELETE WORKSPACE BUTTON}
    Wait Until Element Is Visible  ${DELETE WORKSPACE BUTTON}
    click element  ${DELETE WORKSPACE BUTTON}
    Select Checkbox  ${Check Box}
    wait until page contains  LEAVE
    click button  LEAVE
    Wait Until Page Does Not Contain  ${NEW_WORKSPACE_NAME}
    page should not contain  ${NEW_WORKSPACE_NAME}

Create Tags
    [Arguments]  ${NEW_TAG_NAME}
    wait until page contains element  ${TAGS Element}
    click element  ${TAGS Element}
    wait until page contains element   ${Tag name text box}
    input text  ${Tag name text box}  ${NEW_TAG_NAME}
    click element  ${Tag ADD Button}
    page should contain  ${NEW_TAG_NAME}


Delete Tags
    [Arguments]  ${NEW_TAG_NAME}
    wait until page contains element  ${TAGS Element}
    click element  ${TAGS Element}
    wait until page contains element  ${Delete Tag Button}
    click element  ${Delete Tag Button}
    click button  YES
    wait until page contains  Tag deleted
    page should contain  Tag deleted

Add Team Member
    [Arguments]  ${NEW_TEAM_MEMBER_NAME}
    wait until page contains element  ${TEAM Element}
    click element  ${TEAM Element}
    wait until page contains element  ${TEAM Member name text box}
    input text  ${TEAM Member name text box}  ${NEW_TEAM_MEMBER_NAME}
    click element  ${TEAM Member ADD Button}
    wait until page contains  Users invited
    page should contain  Users invited



Report Checking
    wait until page contains element  ${REPORTS Element}
    click element  ${REPORTS Element}
    wait until page contains  Summary report
    page should contain  Summary report

Dashboard Checking
    wait until page contains element  xpath=//a/span[contains(text(),'dashboard')]
    click element  xpath=//a/span[contains(text(),'dashboard')]
    wait until page contains  Dashboard
    page should contain  Dashboard

Logout
    wait until page contains element  ${User Name Element}
    mouse over  ${User Name Element}
    click link  ${Log Out Link}
    wait until page contains  Log in
    page should contain  Log in


