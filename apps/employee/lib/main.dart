import 'dart:async';

import 'package:core/network/dio_clint.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:employee/app/app_initializer.dart';
import 'package:employee/app/di.dart';
import 'package:employee/app/entry_point/employee_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {

  await runZonedGuarded(()async{
   await AppInitializer.init();
   runApp(const EmployeeApp());
  }, (error,stack){
    debugPrint("APP ERROR $error");
  });


}
