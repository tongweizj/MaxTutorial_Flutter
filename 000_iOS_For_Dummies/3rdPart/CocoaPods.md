# CocoaPods使用说明


## 介绍

网站： https://cocoapods.org/

## 安装


## 使用第三方插件

* Inside Terminal, Change Directory to the folder containing the BitcoinTicker project
* Initialise a new Podfile
  ``` 
  pod init
  ```
* Open the Podfile in Xcode
Add the two libraries (SwiftyJSON and Alamofire)
Make sure you uncomment the use_frameworks and target platform :ios, '9.0'
* Run pod install in Terminal
```
pod install
```
* Open the .xcworkspace file