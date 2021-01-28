import 'dart:convert';

main(List<String> args) {
  //更简单的方法
  String list = '''[
    {
      "site": "198a87d26758fea",
      "name": "Ioticiti HQ",
      "siteGroup": ["TORONTO"],
      "address": "100 Allstate Pkwy, Markham, ON L3R 6H3",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": [
        {
          "uuid": "303f284e-bca3-4988-9ae1-852185c67057",
          "site": "198a87d26758fea",
          "sn": "6C04DDAPAKF81B2",
          "firmware": {
            "version": "CBH4030",
            "build": "20200313",
            "os": "2.631.0000000.16.T"
          },
          "ip": "192.168.0.8",
          "mac": "08:ed:ed:7c:90:c0",
          "realm": "Login to d06d7e2dc08122b2df2e611acc011d51",
          "creation": 1593021521884,
          "location": "Office",
          "label": "REAL",
          "maker": "DaHua",
          "model": "DH-TPC-BF5421-T",
          "admin": {"username": "admin", "password": "admin123"},
          "alert": {
            "threshold": 373,
            "sound": true,
            "email": true,
            "emails": [
              "alert:david@luci.ai",
              "alert:k2wong@yahoo.com",
              "alert:jinhui@luci.ai",
              "alert:eve@luci.ai",
              "escalate:david@luci.ai",
              "escalate:k2wong@yahoo.com",
              "escalate:jinhui@luci.ai",
              "escalate:eve@luci.ai"
            ]
          }
        },
        {
          "uuid": "6ff80b61-7cce-489e-bf5d-d664696d9b95",
          "site": "198a87d26758fea",
          "sn": "test123",
          "firmware": {
            "version": "{\"version\":\"3223\",\"build\":\"3423\"}",
            "build": " ",
            "os": " "
          },
          "ip": "0.0.0.0",
          "mac": "wqtqwtg23",
          "realm": "1.1.1.1",
          "creation": 1591209550689,
          "location": "Parking Lot",
          "label": "test",
          "maker": "DaHua",
          "model": "DH-TPC-BF5421-T",
          "admin": {"username": "admin", "password": "admin123"},
          "alert": {
            "threshold": 373,
            "sound": false,
            "email": false,
            "emails": ["alert:eve@luci.ai", "escalate:eve@luci.ai"]
          }
        }
      ]
    },
    {
      "site": "2ecd8569-589a-41a8-96ad-781a26e5fec3",
      "name": "newSite",
      "siteGroup": [],
      "address": "1800 Cherry St, Toronto, ON",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "37a4115b-6e4d-4fe7-afda-f7856576f9e1",
      "name": "Bestview",
      "siteGroup": ["TORONTO"],
      "address": "1 Bestview Hiking Trails, North York, ON",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "6c533d1d-9cc1-48fa-8be0-2ede7d1ffd8a",
      "name": "Betty Sutherland Trail Park",
      "siteGroup": ["TORONTO"],
      "address": "250 Duncan Mill Rd, Toronto, ON",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "83b5e78a-7b44-44b4-8a4c-a8b4ba0474aa",
      "name": "testAny",
      "siteGroup": [],
      "address": "1 Cherry St, Toronto, ON",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "87cd1a1d-cdbb-4ab1-a694-51a5b3b7a8ad",
      "name": "testAny2",
      "siteGroup": [],
      "address": "1800 Cherry St, Toronto, ON",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "8e16aedc-cb81-443c-acd0-a6f0cb181a9c",
      "name": "Congee Queen",
      "siteGroup": ["david"],
      "address": "L3T 7X1",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "aae15230-4ca8-49fe-848c-f44aded84d77",
      "name": "testAny3",
      "siteGroup": [],
      "address": "8251 McCowan Rd, Markham, ON L3P 3J3",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": []
    },
    {
      "site": "b6db61db-6e5a-4672-8972-d618169a1841",
      "name": "Luci Office",
      "siteGroup": ["david", "TORONTO"],
      "address": "2005 Sheppard Ave E North York, ON M2J 5B4",
      "hours": {
        "Monday": "8 AM to 8 PM",
        "Tuesday": "8 AM to 8 PM",
        "Wednesday": "8 AM to 8 PM",
        "Thursday": "8 AM to 8 PM",
        "Friday": "8 AM to 8 PM"
      },
      "cameras": [
        {
          "uuid": "7f18d1ca-a17b-44a4-8ed5-5313089824ef",
          "site": "b6db61db-6e5a-4672-8972-d618169a1841",
          "sn": "6C057DAPAK4457D",
          "firmware": {
            "version": "CBH4030",
            "build": "20200313",
            "os": "2.631.0000000.16.T"
          },
          "ip": "192.168.1.108",
          "mac": "08:ed:ed:7c:90:be",
          "realm": "Login to 77633f2e34e92a0e0f74fb432e29be91",
          "creation": 1592632130350,
          "location": "Lobby-Dr.Z",
          "label": "REAL",
          "maker": "DaHua",
          "model": "DH-TPC-BF5421-T",
          "admin": {"username": "admin", "password": "admin123"},
          "alert": {
            "threshold": 373,
            "sound": false,
            "email": false,
            "emails": ["alert:eve@luci.ai", "escalate:eve@luci.ai"]
          }
        },
        {
          "uuid": "eb96c026-aefa-477e-8bc5-473c5fe91c24",
          "site": "b6db61db-6e5a-4672-8972-d618169a1841",
          "sn": "123",
          "firmware": {"version": " ", "build": " ", "os": " "},
          "ip": "0.0.0.0",
          "creation": 1596989479219,
          "location": "eve test",
          "maker": "DaHua",
          "model": "DH-TPC-BF5421-T",
          "admin": {"username": "eve", "password": "eve"},
          "alert": {"threshold": 400, "sound": false, "email": false}
        }
      ]
    },
    {
      "site": "f80ebdfd-b89c-480d-9f09-ebc8d8db99a7",
      "name": "CF Fairview Mall",
      "siteGroup": ["TORONTO"],
      "address": "1800 Sheppard Ave E, Toronto, ON M2J 5A7",
      "hours": [
        "Monday: 8 AM to 8 PM",
        "Tuesday: 8 AM to 8 PM",
        "Wednesday: 8 AM to 8 PM",
        "Thursday: 8 AM to 8 PM",
        "Friday: 8 AM to 8 PM"
      ],
      "cameras": []
    }
  ]''';
  var ab = json.decode(list);
  var newList = ab.map((value) {
    // print(value);
    return value.toString() + '1';
  });

  print(newList.toList());
  print("----分割线----");
  newList.toList().remove(' 1');

  print(newList);
}
// void main() {
//   List l = [1, '2', 3, 4, 5, 6, 7, 8, 9];
//   print('The value of list before removing the list element ${l}');
//   bool res = l.remove('2');
//   print('The value of list after removing the list element ${l}');
// }
