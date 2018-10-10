*** settings ***
#Docuentation  Use this layer to get data from external files

library  ../Custom_Libs/Csv.py


*** keywords ***

Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read csv file(FilePath)
    [Return]  ${Data}
