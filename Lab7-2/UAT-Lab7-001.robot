*** Settings ***
Resource    resource.robot

*** Variables ***
${firstname}    Somsong
${lastname}    Sandee
${destination}    Europe
${contactperson}    Sodsai Sandee
${relationship}    Mother
${email}    Somsong@
${phone}    080-123-4567

*** Test Cases ***
Test Successful Form Submissiom
    Open Browser To Form Page
    Fill Form    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}       
    Submit Form
    Complete Page Should Be Open
    Close browser