import 'package:core/network/dio_clint.dart';
import 'package:employee/app/entry_point/employee_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
  DioHelper.init();
  runApp(const EmployeeApp());
}


