*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${Base URL}       http://localhost:3000/
${Endpoint}       comments/1  # Complete address for the PUT request

*** Test Cases ***
Send PUT Request to Update Comment
    [Documentation]    Test to verify the PUT operation for updating a comment
    [Tags]             API
    Create Session    Reqres    ${Base URL}

     # Create a dictionary to represent the request body
        ${request_body}    Create Dictionary    id=1    body=put via robot    postId=1

    # Log the request body for debugging purposes
    Log               ${request_body}

    # Define headers if needed, e.g., Content-Type: application/json
    ${headers}        Create Dictionary    Content-Type=application/json

    # Send the PUT request with the defined request body and headers
    ${response}       Put Request    Reqres    /${Endpoint}    data=${request_body}    headers=${headers}

    # Verify that the response status code is 200 (OK) or adjust as needed
    Should Be Equal As Strings    ${response.status_code}    200

    # Log the response for debugging purposes
    Log To Console               ${response}

    # Add more assertions as needed
