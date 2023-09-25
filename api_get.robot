*** Settings ***
Library           RequestsLibrary
Library           Collections

#This section defines the libraries used in the test case.
#The RequestsLibrary is used for making HTTP requests
#The Collections library is used for variable handling

*** Variables ***
${Base URL}       https://reqres.in/api
${User ID}        2
#This section defines variables that are used in the test case.
#${Base URL} contains the base URL of the Reqres API
#${User ID} is the ID of the user you want to retrieve

*** Test Cases ***
#This is the main test case section.
#It defines the test case named "Retrieve User Information."
Retrieve User Information
    [Documentation]    Test to verify the GET operation for user information
    [Tags]             API
    #This is the main test case section. It defines the test case named "Retrieve User Information."
    #[Documentation] and [Tags] provide a description and tags for the test case.
    Create Session    Reqres    ${Base URL}
    #Create Session sets up an HTTP session with the Reqres API using the base URL.
    ${response}       Get Request    Reqres    /users/${User ID}
    #${response} stores the response from the GET request to the /users/${User ID} endpoint.
    Should Be Equal As Strings    ${response.status_code}    200
    #Should Be Equal As Strings asserts that the status code of the response is 200, indicating a successful request.
    ${user_data}      Set Variable    ${response.json()["data"]}
    #${user_data} extracts the JSON data from the response and stores it for further inspection.
    Log               ${user_data}
    #Log is used to log the extracted user data for debugging purposes.
    Should Be Equal As Strings    ${user_data["id"]}    ${User ID}
    #Several Should Be Equal As Strings assertions are used to compare specific fields (user ID, first name, and last name) in the JSON data with expected values.
    #Replace the expected last name with the actual expected value in your test case.
    Should Be Equal As Strings    ${user_data["first_name"]}    Janet   # Updated to match the actual first name
    Should Be Equal As Strings    ${user_data["last_name"]}     Weaver   # Replace with the expected last name
    # Add more assertions as needed
