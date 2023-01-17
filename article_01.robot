*** Settings ***
Documentation    Applying for a loan at ParaBank
Library          SeleniumLibrary

*** Test Cases ***
Applying for a loan with a too low down payment sees the application denied
    Open Browser    http://localhost:8080/parabank  Chrome
    Maximize Browser Window
    Input Text  name:username  john
    Input Text  name:password  demo
    Click Button  xpath://input[@value='Log In']
    Click Link  Request Loan
    Input Text  id:amount  10000
    Input Text  id:downPayment  100
    Select From List By Value  id:fromAccountId  12345
    Click Button  xpath://input[@value='Apply Now']
    Sleep  3 seconds
    ${loan_application_result}=  Get Text  id:loanStatus
    Should Be Equal As Strings  ${loan_application_result}  Denied
    Close Browser