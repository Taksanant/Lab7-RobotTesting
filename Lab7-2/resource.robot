*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${SERVER}    localhost:7272
${Form URL}   http://${SERVER}/Form.html
${Complete URL}   http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    C:/Uni/3rd_year/term2/Software Engineer/RobotTesting/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/Uni/3rd_year/term2/Software Engineer/RobotTesting/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe

*** Keywords ***
Open Browser To Form Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${Form URL}
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Fill Form
    [Arguments]    ${firstname}    ${lastname}    ${destination}    ${contactperson}    ${relationship}    ${email}    ${phone}
    Input Text    id=firstname    ${firstname}
    Input Text    id=lastname    ${lastname}
    Input Text    id=destination    ${destination}
    Input Text    id=contactperson    ${contactperson}
    Input Text    id=relationship   ${relationship}
    Input Text    id=email    ${email}
    Input Text    id=phone    ${phone}

Submit Form
    Click Button    id=submitButton

Error Message Should Be Shown
    [Arguments]    ${message}
    Wait Until Page Contains     ${message}

Complete Page Should Be Open
    Title Should Be    Complete
    Location Should Be    ${Complete URL}
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.
