import 'package:core/utils/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

  Future<bool> checkLocationServicesEnabled(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastHelper.error(context, 'خدمة الموقع غير مفعلة');
      return false;
    }
    return true;
  }


  Future<bool> checkAndRequestPermissions(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ToastHelper.error(context, 'الصلاحيات مرفوضة');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ToastHelper.error(
          context,
          'الصلاحيات مرفوضة بشكل دائم. فعلها من الإعدادات'
      );

      await Geolocator.openLocationSettings();
      return false;
    }

    return true;
  }


  Future<Position?> getCurrentPosition(BuildContext context) async {

    bool serviceEnabled = await checkLocationServicesEnabled(context);
    if (!serviceEnabled) return null;


    bool hasPermission = await checkAndRequestPermissions(context);
    if (!hasPermission) return null;

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      ToastHelper.success(context, 'تم جلب الموقع');
      return position;
    } catch (e) {
      ToastHelper.error(context, 'حدث خطأ في الحصول على الموقع');
      print('Location error: $e');
      return null;
    }
  }


  Future<Map<String, double>?> getLatLng(BuildContext context) async {
    Position? position = await getCurrentPosition(context);
    if (position != null) {
      return {
        'latitude': position.latitude,
        'longitude': position.longitude,
      };
    }
    return null;
  }
}
