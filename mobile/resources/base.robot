*** Settings ***

Documentation    Código base para abrir uma sessão com o Appium Server

Library    AppiumLibrary

**** Keywords ***

Open Session
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=Pixel 2 API 28
    ...                 app=${EXECDIR}/app/ninjachef.apk
    ...                 udid=emulator-5554
    ...                 adbExecTimeout=120000

Close Session
    Capture Page Screenshot
    Close Application
