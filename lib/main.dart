import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/about.dart';
import 'package:hello_flutter/screens/dashboard.dart';
import 'package:hello_flutter/screens/home.dart';
import 'package:hello_flutter/screens/login.dart';
import 'package:hello_flutter/screens/machine_detail.dart';
import 'package:hello_flutter/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

// สร้างตัวแปรเก็บ initialRoute
dynamic initialRoute;

void main() async {
  //ต้องเรียกใช้ widgetsflutterbinding.ensureInitialized(); ก่อนเรียกใช้ sharedpreferences
  WidgetsFlutterBinding.ensureInitialized();

  //อ่านข้อมูลจาก SharedPreference
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // ตรวจสอบว่ามีการ login หรือไม่
  if (prefs.getBool('loginStatus') == true) {
    //ถ้ามีการ login ให้ส่งไปหน้า dashboard
    initialRoute = '/dashboard';
  } else {
    //ถ้าไม่มีข้อมูล login ให้ส่งไปหน้า welcome
    initialRoute = '/welcome';
  }

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      initialRoute: initialRoute,
      routes: {
        '/home' :(context) => Home(),
        '/about' :(context) => About(),
        '/welcome' :(context) => welcome(),
        '/login' :(context) => Login(),
        '/dashboard' :(context) => Dashboard(),
        '/machine_detail' :(context) => MachineDetail(),
      },
    );
  }
}