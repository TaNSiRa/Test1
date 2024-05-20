import 'dart:convert';

import 'package:hello_flutter/models/plc_machine_model.dart';
import 'package:hello_flutter/utils/constant.dart';
import 'package:http/http.dart' as http;

class MachineAPI {
  //สร้าง header เพื่อกำหนด format ของข้อมูลที่จะส่งไปยัง API
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  //สร้าง เมธอดสำหรับเรียกข้อมูลจาก API
  Future<List<PlcMachineModel>> getallMachine() async {
    final response = await http.get(
      Uri.parse('${baseURLAPI}machine.php'),
      headers: _setHeaders(),
    );
    // เช็คว่ามีข้อมูลที่ส่งกลับมาหรือไม่
    if (response.body.isNotEmpty) {
      return plcMachineModelFromJson(response.body);
    } else {
      return [];
    }
  }

  //สร้าง เมธอดสำหรับปรับ status ของ machine
  updateMachineStatus(data) async {
    return await http.put(
      Uri.parse('${baseURLAPI}machine.php'),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
}
