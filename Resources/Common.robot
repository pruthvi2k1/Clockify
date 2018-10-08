*** settings ***

Library  Selenium2Library


*** keywords ***

Begin web test
    open browser  about:blank  ${BROWSER}
    Maximize Browser Window

End web test
    close browser