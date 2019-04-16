*** Settings ***
Suite Teardown    Delete All Sessions
Library           Collections
Library           String
Library           ../../../../Libs/RequestsLibrary/RequestsKeywords.py
Library           ../../../../Libs/TestLink/SubmitTestLinkForShowCase.py

*** Variable ***
${result}         f
${note}           ${EMPTY}

*** Test Cases ***
Get Request Wearher
    Create Session  QueryWeather     ${weather_url}
    ${resp} =   Get Request  QueryWeather  /
    Should Be Equal As Strings   ${resp.status_code}   200
    ${content}    Convert To String    ${resp.content}
    set Suite variable    ${result}    p
    set Suite variable    ${note}    ${resp.content}

SubmitTestLink
    SubmitResultToTestLink    testcaseid=${internalid}    testplanid=${tplan_id}    user=${user}    buildname=${buildname}
    ...    result=${result}    note=${note}    testlinkAPI=${testlinkAPI}

