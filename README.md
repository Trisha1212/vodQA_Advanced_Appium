# vodQA_Advanced_Appium_Robotframework

# Appium Windows Setup For Android
## Prerequisites:
1. Python 2.7 - https://www.python.org/downloads/
   * Set environment variable PYTHONPATH under 'System variables'
   * Install PIP -  http://stackoverflow.com/questions/4750806/how-do-i-install-pip-on-windows
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/5.PNG)

1. JAVA JDK - http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
   * Set environment variable JAVA_HOME under 'System variables'
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/1.PNG)

2. ANDROID SDK - https://developer.android.com/studio/index.html
   * Set environment variable ANDROID_HOME under 'System variables'
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/2.PNG)
3. Node.js - https://nodejs.org/en/download/. Download and install.
4. Appium.exe (zip file) (for Appium Inspector) - https://bitbucket.org/appium/appium.app/downloads/
5. Append the following string to the Path variable under 'System variables'
   * %JAVA_HOME%\bin;%ANDROID_HOME%\build-tools;%ANDROID_HOME%\platforms;%ANDROID_HOME%\platform-tools;%ANDROID_HOME%\tools;C:\Program Files\nodejs;%PYTHONPATH%;%PYTHONPATH%\Scripts;
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/3.PNG)
6. Run the following commands to install appium server
   * npm install -g appium
   * npm install wd 
7. ANDROID SDK MANAGER - Open the command prompt and run the command "android"
   * Download the required android API you needed to work with - https://source.android.com/source/build-numbers.html
   * Please note that Appium need a minimum api level of 17
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/4.PNG)
8.  Robot Framework and Appium Library for robot framework - https://github.com/robotframework/robotframework  ,       http://jollychang.github.io/robotframework-appiumlibrary/doc/AppiumLibrary.html
   
Run the following commands  
   * pip install robotframework==2.8.7
   * pip install robotframework-appiumlibrary==1.3.5
       Note: Run 'pip list' to see the installed python packages
9. Eclipse - https://eclipse.org/downloads/
10. Nokia RED plugin for eclipse - https://github.com/nokia/RED/releases/tag/0.7.0

## Running appium scripts in a real android device
1. Connect your android phone to PC using usb cable in debugging mode - https://www.kingoapp.com/root-tutorials/how-to-enable-usb-debugging-mode-on-android.htm
2. Import the repository to eclipse
   * File -> Import -> Git -> Import From Git
![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/git.gif)
3. Edit the MFTS.robot file (My First Test Suite) and edit the following fields
   * ${platform_version}    - Check your android version
   * ${apk_path}    - absolute path of apk file. The apk file is included in the project[app.apk]
   * ${udid}    - run adb devices to get the udid of your phone
   * ${phone_name}  - Your Phone's name. Preferrably without contain any spaces and special characters
   ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/6.PNG)
4.  Run the testsuite  by any of the following methods
   * Pybot Command
      ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/7.PNG)
   * RED plugin play button [Be in Robot perspective in eclipse]
      ![screenshots](https://raw.githubusercontent.com/syamsasi99/vodQA_Appium_RobotFramework/master/screenshots/8.PNG)


# Python Library for OCR

    https://github.com/jflesch/pyocr

# Python Library for Image Recognition
    
    https://pypi.python.org/pypi/pytesseract



#Note: The sample app's source code can be found in this link https://github.com/awslabs/aws-device-farm-sample-app-for-android
# The html report will be generated once the test executed



