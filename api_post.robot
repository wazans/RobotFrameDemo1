*** Settings ***
Library           RequestsLibrary
Library           Collections

#This section defines the libraries used in the test case.
#The RequestsLibrary is used for making HTTP requests
#The Collections library is used for variable handling

*** Variables ***
${Base URL}       https://reqres.in/api

*** Test Cases ***
# This test case is for sending a POST request to create a new user.
Create New User
    [Documentation]    Test to verify the POST operation for creating a new user
    [Tags]             API

    # Create a dictionary to represent the request body
    ${request_body}    Create Dictionary    name=morpheus    job=leader

    # Log the request body for debugging purposes
    Log To Console               ${request_body}

    # Create a session with the Reqres API using the base URL
    Create Session    Reqres    ${Base URL}

    # Send a POST request to the /users endpoint with the request body
    ${response}       Post Request    Reqres    /users    data=${request_body}

    # Log the response for debugging purposes
    Log To Console               ${response}

    # Assert that the response status code is 201 (indicating successful creation)
    Should Be Equal As Strings    ${response.status_code}    201

    # Extract the JSON data from the response and store it for further inspection
    ${created_user_data}      Set Variable    ${response.json()}

    # Log the created user data for debugging purposes
    Log To Console               ${created_user_data}

    # Add more assertions as needed to verify the created user data
    #Should Be Equal As Strings    ${created_user_data["name"]}    morpheus
    #Should Be Equal As Strings    ${created_user_data["job"]}     leader

    # Note: You should update these assertions based on the actual JSON structure returned by the API
