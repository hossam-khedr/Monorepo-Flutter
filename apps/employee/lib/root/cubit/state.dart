



import 'package:flutter/material.dart';
enum RootStatus{init,reseatHomeIndex,selectNavBarIndex}
class RootStates{
  final int ccurrentIndex;
  final List<GlobalKey<NavigatorState>>navigatorKeys;
  final RootStatus rootStatus;


  RootStates({
    this.ccurrentIndex = 0,
    this.navigatorKeys =const [],
    this.rootStatus = RootStatus.init
});

  RootStates copyWith({
    final int? ccurrentIndex,
    final List<GlobalKey<NavigatorState>>? navigatorKeys,
    final RootStatus? rootStatus
}){
    return RootStates(
      ccurrentIndex: ccurrentIndex ?? this.ccurrentIndex,
      navigatorKeys: navigatorKeys ?? this.navigatorKeys,
      rootStatus: rootStatus ?? this.rootStatus
    );
  }


}