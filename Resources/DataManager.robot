*** settings ***
Documentation  Use this layer to get data from external files

library  ../Custom_Libs/Csv.py


*** keywords ***

Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  Csv.read csv file  ${FilePath}
    [Return]  ${Data}
