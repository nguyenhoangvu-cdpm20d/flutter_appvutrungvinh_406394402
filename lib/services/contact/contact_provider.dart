import 'dart:convert';

import 'package:flutter/services.dart';

import 'contact_object.dart';

class ContactProvider {
  //Lấy danh sách dữ liệu từ json
  static Future<List<dynamic>> readJsonData() async {
    //Dùng rootBundle để đọc file từ resource ứng dụng
    var jsonText = await rootBundle.loadString('data/contacts.json');
    //lấy dữ liệu từ json (theo cấu trúc chứa danh sách)
    var data = json.decode(jsonText);
    return data['contacts'];
  }

//Lấy danh sách liên hệ
  static Future<List<ContactObject>> getAllContacts() async {
    List<ContactObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => ContactObject.fromJson(e)).toList();
    return lsResult;
  }

//Tìm kiếm theo tên hoặc SĐT
  static Future<List<ContactObject>> searchContact(String strSearch) async {
    List<ContactObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    data.forEach((element) {
      ContactObject con = ContactObject.fromJson(element);
      if (con.name.toUpperCase().contains(strSearch.toUpperCase()) ||
          con.phone.contains(strSearch)) {
        lsResult.add(con);
      }
    });
    return lsResult;
  }
}
