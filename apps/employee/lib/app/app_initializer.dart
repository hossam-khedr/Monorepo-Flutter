import 'package:core/network/dio_clint.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:employee/app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInitializer {
  static Future<void>init()async{
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    DioHelper.init();
    await Future.wait([
      CacheHelper.initCacheHelper(),
      initProfileDependence(),
      initAttendanceDependence(),
      initLeavesDependence(),
    ]);
  }
}