# README

## 纯dart项目cil

```bash
# Create a small app
dart create -t console-full cli

# Run the app
cd cli
dart run
# Hello world: 42!

# test
dart test/cil_test.dart
#00:00 +0: calculate
#00:00 +1: All tests passed!
```

### 生成 junit 格式的测试报告(xml)

使用[dart-junitreport](https://github.com/TOPdesk/dart-junitreport)

```bash
pub run test simple_test.dart --reporter json > example.jsonl

pub global run junitreport:tojunit --input example.jsonl --output TEST-report.xml

```

### 测试报告 xml转 html

https://github.com/inorton/junit2html

```bash
npm run junit2html TEST-report.xml --outreport.html
```

## 创建 flutter 项目my_app

```bash
# Create a small app
flutter create my_app

# Run the app
cd my_app
flutter run

# test
flutter test test/widget_test.dart
#00:06 +1: All tests passed!
```