import 'package:flutter/material.dart';
import 'package:hello_flutter/models/plc_machine_model.dart';
import 'package:hello_flutter/services/machine_api.dart';
import 'package:hello_flutter/utils/constant.dart';

//สร้าง key สำหรับ RefreshIndicator
var refreshKey = GlobalKey<RefreshIndicatorState>();


class Machine extends StatefulWidget {
  const Machine({super.key});

  @override
  State<Machine> createState() => _MachineState();
}

class _MachineState extends State<Machine> {

  //ทดสอบเรียก API จาก MachineAPI
  //สร้างตัวแปร List เพื่อเก็บข้อมูลที่ได้จาก API
  List<PlcMachineModel> machineData = [];

  //สร้างเมธอดสำหรับเรียกข้อมูลจาก API
  void _getMachineData() async {
    var data = await MachineAPI().getallMachine();
    setState(() {
      machineData = data;
    });
    // var jsonData = jsonEncode(data);
    // print(jsonData);
  }

  void initState() {
    super.initState();
    _getMachineData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          _getMachineData(); //อ่านข้อมูลใหม่จาก API
        },
        child: ListView.builder(
            itemCount: machineData.length,
            itemBuilder: (context, index) {
              final machine = machineData[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    Uri.parse(baseURLAPI + machine.imageUrl!).toString(),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(machine.name!),
                subtitle: Text(machine.location!),
                trailing: Text(
                  machine.status!,
                  style: TextStyle(
                      color: machine.status == 'ทำงานปกติ'
                          ? Colors.green
                          : Colors.red),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/machine_detail',
                      arguments: machine.toJson());
                },
              );
            }),
      ),
    );
  }
}