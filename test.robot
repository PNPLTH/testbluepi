*** Settings ***

Library    String
Library    SeleniumLibrary
Resource    keyword.robot


*** Variables ***
${url}    https://abhigyank.github.io/To-Do-List/


*** Test Cases ***
1
    [Documentation]    input 1 item
    Open side     ${url} 
    ${text}    input and add    text=test01
    Clear Text On Input Field   xpath=${input}
    ${text}    input and add    text=test01
    Click Element    ${button_add}
    verify to do tab    ${text}   1
    verify to completed   ${text}   1
    delete     1
    [Teardown]    Close Browser
2
    [Documentation]    more then 1 item
    Open side     ${url} 
    ${text1}    input and add    text=test01
    Click Element    ${button_add}
    ${text2}    input and add    text=test02
    Click Element    ${button_add}
    ${text3}    input and add    text=test03
    Click Element    ${button_add}
    verify to do tab    ${text1}
    verify to do tab    ${text2}   
    verify to do tab    ${text3}   
    delete     2
    add to completed  1
    add to completed  1
    verify to completed    ${text1}
    verify to completed    ${text3}
    delete     1
   [Teardown]    Close Browser
