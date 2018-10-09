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
${project name element}=  xpath=//td[@title="sample project32"]
${Dots Icon In Projects Page}=  xpath=//table/tbody/tr[1]/td[1]/section/i[@class="icon--dots"]

${CLIENTS Element}=  xpath=//a/span[contains(text(),'clients')]
${client name text box}=  xpath=//input[@placeholder="New Client name..."]
${Client ADD Button}=  xpath=//span[contains(text(),'Add')]

${Delete Client Button}  xpath=//a[@class="buttons-workspaces--cross"]


${WORKSPACES Element}=  xpath=//li/a/span[contains(text(),'workspaces')]
${CREATE NEW WORKSPACE BUTTON}=  xpath=//a[@class="workspace__button-create-new"]
${WORKSPACE NAME text box}=  xpath=//create-new-workspace/div/div/div[2]/div/input

${DELETE WORKSPACE BUTTON}=  xpath=//span[@class="item--leave-workspace"]
${Check Box}=  xpath=//input[@id="checkbox"]

*** keywords ***

Create Client
    wait until page contains element  ${CLIENTS Element}
    click element  ${CLIENTS Element}
    wait until page contains element  ${client name text box}
    input text  ${client name text box}  client55
    click element  ${Client ADD Button}
    page should contain  client55

Delete Client
    wait until page contains element  ${CLIENTS Element}
    click element  ${CLIENTS Element}
    wait until page contains element  ${Delete Client Button}
    click element  ${Delete Client Button}
    click button  YES
    wait until page contains  Client deleted
    page should contain  Client deleted


Create Project
    wait until page contains element  ${PROJECTS Element}
    click element  ${PROJECTS Element}
    click button  ${CREATE NEW PROJECT BUTTON}
    input text  ${project name text box}  sample project32
    click button  CREATE
    page should contain element  ${project name element}

Delete Project

    Reload Page
    wait until page contains element  ${PROJECTS Element}
    click element  ${PROJECTS Element}
    click element  ${Dots Icon In Projects Page}
    wait until page contains  Delete
    click link  Delete
    click button  YES
    Reload Page
    wait until page contains element  ${PROJECTS Element}
    page should not contain  sample project32

Add Time Manually In Future

      Wait Until Page Contains Element  ${Manual Mode Button}
      click button  ${Manual Mode Button}
      input text  ${Description Box}  Final Testing on oct 16th 2022
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
      Wait Until Page Contains Element  ${Manual Mode Button}
      click button  ${Manual Mode Button}
      input text  ${Description Box}  Final Testing on oct 16th 2016
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

      Wait Until Page Contains Element  ${Timer Mode Button}
      click button  ${Timer Mode Button}
      input text  ${Description Box}  Final Testing Using Timer
      click button  ${Stop Watchh START Button}
      #Below sleep statement is needed to to enter the time in to the system
      sleep  5s
      click button  ${Stop Watchh END Button}
      Page should contain element  ${Description Element3}

Delete Time Entry

    wait until page contains element  ${Dots Icon}
    click element  ${Dots Icon}
    click link  Delete
    click button  YES
    page should contain  Time entry deleted

Create Work Space

    wait until page contains element  ${WORKSPACES Element}
    click element  ${WORKSPACES Element}
    wait until page contains element  ${CREATE NEW WORKSPACE BUTTON}
    click element  ${CREATE NEW WORKSPACE BUTTON}
    wait until page contains element  ${WORKSPACE NAME text box}
    input text  ${WORKSPACE NAME text box}  workspace55
    click button  Continue
    wait until page contains  Create
    click button  Create
    page should contain  workspace55

Delete Work Space
    wait until page contains element  ${WORKSPACES Element}
    click element  ${WORKSPACES Element}
    wait until page contains element  ${DELETE WORKSPACE BUTTON}
    Wait Until Element Is Visible  ${DELETE WORKSPACE BUTTON}
    click element  ${DELETE WORKSPACE BUTTON}
    Select Checkbox  ${Check Box}
    wait until page contains  LEAVE
    click button  LEAVE
    Wait Until Page Does Not Contain  workspace55
    page should not contain  workspace55

Logout
    wait until page contains element  ${User Name Element}
    mouse over  ${User Name Element}
    click link  ${Log Out Link}


