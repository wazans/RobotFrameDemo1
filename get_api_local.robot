*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${Base URL}       http://localhost:3000/
${User ID}        ten10
${ExpectedFirstName}    Sachin
${ExpectedLastName}     sachin
${ExpectedAge}          16

*** Test Cases ***
Retrieve User Information
    [Documentation]    Test to verify the GET operation for user information
    [Tags]             API
    Create Session    Reqres    ${Base URL}
    ${response}       Get Request    Reqres    /friends/${User ID}
    Should Be Equal As Strings    ${response.status_code}    200
    ${user_data}      Set Variable    ${response.json()}
    Log               ${user_data}  # Log the entire JSON response for debugging
    Should Be Equal As Strings    ${user_data["id"]}        ${User ID}
    Should Be Equal As Strings    ${user_data["firstname"]}  ${ExpectedFirstName}
    Should Be Equal As Strings    ${user_data["lastname"]}   ${ExpectedLastName}
    Should Be Equal As Strings    ${user_data["age"]}        ${ExpectedAge}
    # Log the response for debugging purposes
    Log To Console               ${response}
    # Add more assertions as needed

