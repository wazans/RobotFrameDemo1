*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${Base URL}       http://localhost:3000/
${Endpoint}       friends  # Endpoint for the POST request


*** Test Cases ***
Send POST Request to Create User
    [Documentation]    Test to verify the POST operation for creating a user
    [Tags]             API
    Create Session    Reqres    ${Base URL}

    # Create a dictionary to represent the request body
    ${request_body}    Create Dictionary    firstname=iam    lastname=github    id=30   age=44


    # Log the request body for debugging purposes
    Log               ${request_body}

    # Define headers if needed, e.g., Content-Type: application/json
    ${headers}        Create Dictionary    Content-Type=application/json

    # Send the POST request with the defined request body and headers
    ${response}       Post Request    Reqres    /${Endpoint}    data=${request_body}    headers=${headers}

    # Verify that the response status code is 201 (Created) or adjust as needed
    Should Be Equal As Strings    ${response.status_code}    201

    # Log the response for debugging purposes
    Log To Console               ${response}

    # Add more assertions as needed
