# Unit-Converter

Unit Converter is a KDE application using Qt/QML that provide functionality to convert user entered values into various distance units and currency values.The conversion on currency values happens in real-time based on the inputs received from the market. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- To download QtCreator in your laptop, there are certain terminal commands to be executed. They are:
```bash
sudo apt-get install qtcreator 
sudo apt-get install build-essential libgl1-mesa-dev 
```

Download the executable file from http://download.qt.io/official_releases/online_installers/ according to your system requirements. 
*(I use Linux 64 bit)*

- Installing the QtCreator
```bash
cd ~/Downloads
chmod +x qt-unified-linux-x64-2.0.3-1-online.run
```

***Example:** Replace the file name with the one you installed. After this command you are ready to run the installer. Go to the library where the executable file is present.*

```bash
sudo ./qt-unified-linux-x64-2.0.3-1-online.run
```
    
 For more reference about QtCreator, you can go through the below mentioned [link](https://www.ics.com/blog/getting-started-qt-and-qt-creator-linux)
    

## Installing
 
- Fork the repository. 
- Clone the repo using the terminal command. Make sure you replace `username` with your GitHub username.
```bash
git clone https://github.com/username/Unit-Converter.git 
```
- To run the code, type the following commands in terminal.
```bash
cd Unit-Converter/  
qmlscene main.qml
```
 
 ## Screenshot of the GUI
 
 ![picture alt](https://github.com/krishremya/Unit-Converter/blob/master/Unit-Converter.png "Title is optional")

## Built With
- Framework used: Qt Framework (version: 5.9.5)
- OS: Kubuntu 18.O4 (KDE version: 5.47.0)
 
## License
This project is licensed under the MIT License, see the [LICENSE.md](https://github.com/krishremya/Unit-Converter/blob/master/LICENSE.md) for more details.
    
