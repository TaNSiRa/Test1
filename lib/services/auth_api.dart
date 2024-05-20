import 'dart:convert';

import 'package:hello_flutter/utils/constant.dart';
import 'package:http/http.dart' as http;

class AuthAPI {

  //สร้าง header เพื่อกำหนด format ของข้อมูลที่จะส่งไปยัง API
  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  //สร้างฟังก์ชั่นเพื่อ Login
  loginAPI(data)  async {
    return await http.post(
      Uri.parse('${baseURLAPI}login.php'),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }


}