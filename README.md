# Unit-Converter
Unit Converter is a KDE application using Qt/QML that provide functionality to convert user entered values into various distance units and currency values.The conversion on currency values happens in real-time based on the inputs received from the market. 

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
* To download QtCreator in your laptop, there are certain terminal commands to be executed. They are:
   *  ```bash
         sudo apt-get install qtcreator 
      ```
    * ```bash 
         sudo apt-get install build-essential libgl1-mesa-dev 
         ```
     * http://download.qt.io/official_releases/online_installers/
       *[Install according to the architecture of your system.]*
      
* Installing the QtCreator
    * ``` bash
         cd ~/Downloads
       ```
    * ```bash
        chmod +x qt-unified-linux-x64-2.0.3-1-online.run <br/> 
        ```
    *It's just an example. Replace the file name with the one you installed. After this command you are ready to run the installer. Go to the library where the executable file is present.*
    * ```bash
        sudo ./qt-unified-linux-x64-2.0.3-1-online.run
      ```
    
 For more reference about QtCreator, you can go through the below mentioned link. <br/>
 https://www.ics.com/blog/getting-started-qt-and-qt-creator-linux
    
 ## Installing
 * Fork the repository. <br/>
 * Clone the repo using the terminal command, <br/>
    * ```bash
         git clone https://github.com/username/Unit-Converter.git 
      ```
    *Replace the username with yours.*
 * To run the code, <br/>
 *Type the following commands in terminal.*
    * ```bash
            cd Unit-Converter. [Get into the repo where you cloned it.]    
      ```
    * ```bash
            qmlscene main.qml
      ```
 
 ## Screenshot of the GUI
 
 ![picture alt](https://github.com/krishremya/Unit-Converter/blob/master/Unit-Converter.png "Title is optional")

## Built With
 * Framework used: Qt Framework
 * OS: Kubuntu 18.O4
 * Qt version: 5.9.5
 * KDE Framework Version: 5.47.0
 
## License
This project is licensed under the MIT License.
    
