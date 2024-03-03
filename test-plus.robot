*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation Num
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    http://192.168.143.242:8000/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp}


*** Test Cases ***
Test Calculate Numbers 4 and 2 (ฺBefore Using Keywords)

    ${resp}=    GET    http://192.168.143.242:8000/plus/4/2

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as text
    ${resp_text}=    Evaluate    "${resp.content.decode('utf-8')}"

    # Convert the response content to an integer
    ${resp_value}=    Convert To Integer    ${resp_text}

    # Verify the response of plus operation
    Should Be Equal As Numbers    ${resp_value}    ${6}

Test Calculate Numbers 8.4 and 4

    ${n_resp}=    Get Calculation Num    ${8.4}    ${4}

    # Get the response content as text
    ${resp_text}=    Evaluate    "${n_resp.content.decode('utf-8')}"

    # Convert the response content to an integer
    ${resp_value}=    Evaluate    float("${resp_text}")

    # Verify the response of plus operation
    Should Be Equal As Numbers    ${resp_value}    ${12.4}


Test isPrime Numbers 17

    ${resp}=    GET    http://192.168.143.242:8000/is_prime/17

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as text
    ${resp_text}=    Evaluate    "${resp.content.decode('utf-8')}"

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp_text}    true


Test isPrime Numbers 36

    ${resp}=    GET    http://192.168.143.242:8000/is_prime/36

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp.text}    false

Test isPrime Numbers 13219

    ${resp}=    GET    http://192.168.143.242:8000/is_prime/13219

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp.text}    true

Test isPrime Numbers 7

    ${resp}=    GET    http://192.168.143.242:8000/is_prime/7

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp.text}    true

Test isPalindrome Numbers 121

    ${resp}=    GET    http://192.168.143.242:8000/palindrome/121

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings  ${resp.text}    true

Test isPalindrome Numbers 1221

    ${resp}=    GET    http://192.168.143.242:8000/palindrome/1221

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp.text}    true

Test isPalindrome Numbers 1231

    ${resp}=    GET    http://192.168.143.242:8000/palindrome/1231

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings    ${resp.text}    false


Test isMul Number 9

    ${resp}=    GET    http://192.168.143.242:8000/mul/4.5/2

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Verify the response of plus operation
    Should Be Equal As Strings  ${resp.text}    9.0