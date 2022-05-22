*** Settings ***

*** Variables ***

${additem}    //html/body/div/div/div[1]/a[1]
${todo}    //html/body/div/div/div[1]/a[2]
${completed}    //html/body/div/div/div[1]/a[3]
${input}    //*[@id="new-task"]
${button_add}   //*[@id="add-item"]/button
${button_income}   //*[@id="incomplete-tasks"]/li/label/span[4]
${delete}   //*[@id="1"]
${massage} //*[@id="completed-tasks"]/li/span/text()
*** Keywords ***
Open side 
    [Arguments]   ${url} 
    Open Browser    about:blank    chrome
    Go To           ${url} 
input and add
    [Arguments]    ${text}
    Input Text    xpath=${input}     ${text}  
    
    [Return]    ${text}
Clear Text On Input Field
    [Arguments]    ${input_field}
    ${filled_value}    Get Value    ${input_field}
    ${length_data}    Get Length    ${filled_value}
    FOR    ${idx}    IN RANGE    0    ${length_data}
        Click Element    ${input_field}
        Press Keys    ${input_field}      BACKSPACE
    END
verify to do tab
    [Arguments]    ${text}    
    Click Element  ${todo}
    Should Be Equal As Strings  ${text}    ${text}  
verify to completed
    [Arguments]    ${text}
    Click Element  ${completed}
    Should Be Equal As Strings  ${text}    ${text}  
add to completed    
    [Arguments]    ${num}
    Click Element    xpath=//*[@id="text-${num}"]

delete  
    [Arguments]    ${num}
    Click Element    xpath=//*[@id="${num}"]/span

    
      