# Http 相关错误



## Bad state: Insecure HTTP is not allowed by platform: http://thermal.luci.ai:15080/app-version

### For Android:

This behavior may be omitted following migration guide: https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android.

or... Just add in **`android/app/src/main/AndroidManifest.xml:`**

`android:usesCleartextTraffic="true"` to `<application />` also dont forget to take **INTERNET** PERMISSION:

```
<uses-permission android:name="android.permission.INTERNET" /> <!-- This Line -->

<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="receipt"
        android:usesCleartextTraffic="true" <!-- This Line -->
        android:icon="@mipmap/ic_launcher">
```

### For iOS:

Allow insecure/HTTP requests globally across your application on iOS, you can add this to your **ios/Runner/info.plist** under the main dictionary definition:

```
<key>NSAppTransportSecurity</key>
<dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
</dict>
```

Be warned that you will need to have an explanation for Apple's review team when enabling this, otherwise your app will get rejected on submission.

Thank you.