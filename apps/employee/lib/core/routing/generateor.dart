import 'package:employee/core/routing/app_route.dart';
import 'package:flutter/material.dart';

import '../../root_screen.dart';

class GenerateRoute{
  static Route? onGenerateRoute(RouteSettings settings){
    final _args = settings.arguments;
    switch(settings.name){
      case AppRoute.root:
        return MaterialPageRoute(builder: (_)=>const RootScreen());
    }
    return null;
  }

}