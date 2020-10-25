import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_update/service/update.dart';
import 'package:flutter_update/service/setting.dart';

class UpdaterPage extends StatefulWidget {
  final Widget child;

  const UpdaterPage(this.child);

  @override
  UpdatePagerState createState() => UpdatePagerState();
}

class UpdatePagerState extends State<UpdaterPage> {
  var _serviceVersionCode, _serviceVersionApp;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //每次打开APP获取当前时间戳
      var timeEnd = DateTime.now().millisecondsSinceEpoch;
      //获取"Later"保存的时间戳
      // var timeStart = SpUtil.getInt(Constants.timeStart);
      var timeStart = UpdateControl.getUpgradeRemindLaterTime();

      if (timeStart == 0) {
        //第一次打开APP时执行"版本更新"的网络请求
        _getNewVersionAPP();
      } else if (timeStart != 0 && timeEnd - timeStart >= 24 * 60 * 60 * 1000) {
        //如果新旧时间戳的差大于或等于一天，执行网络请求
        _getNewVersionAPP();
      }
    });
  }

  //执行版本更新的网络请求
  _getNewVersionAPP() async {
    String url = SERVER_Update_URL; //接口的URL，替换你的URL
    try {
      // Response response = await Dio().get(url);
      // if (response != null) {
      if (true) {
        setState(() {
          // var data = json.decode(response.data);
          Map data = {
            "app": ["luci_temp", "luci_supervisor"],
            "versionCode": {
              "luci_temp": ["1.0.3", "1.0.1"],
              "luci_supervisor": ["1.0.1", "1.0.1"]
            },
            "versionName": "version name",
            "versionDes": "version des"
          };
          _serviceVersionCode = data["versionCode"]; //版本号.toString()

          if (Platform.isIOS) {
            //ios相关代码
            _serviceVersionCode = _serviceVersionCode["luci_temp"][0];
            _serviceVersionApp = SERVER_Appstore_URL;
          } else if (Platform.isAndroid) {
            //android相关代码
            _serviceVersionCode = _serviceVersionCode["luci_temp"][1];
            _serviceVersionApp = SERVER_Googleplay_URL; //下载的URL
          }
          _checkVersionCode();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  //检查版本更新的版本号
  _checkVersionCode() async {
    String _currentVersionCode = installedVersion;
    final serviceVersionCode = Version.parse(_serviceVersionCode);
    final currentVersionCode = Version.parse(_currentVersionCode);
    if (serviceVersionCode > currentVersionCode) {
      // _showNewVersionAppDialog(); //弹出对话框
      _showDialog();
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("New version available"),
          content: Text(
              "There is newer version of #xx App# available, click OK to upgrade now?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Remind Later"),
              onPressed: () {
                Navigator.of(context).pop();
                var timeStart = DateTime.now().millisecondsSinceEpoch;
                UpdateControl.saveUpgradeRemindLaterTime(timeStart);
              },
            ),
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                launch(_serviceVersionApp);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
