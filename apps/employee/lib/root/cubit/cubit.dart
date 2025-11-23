import 'package:core/constants/api_constants.dart';
import 'package:core/utils/cache_helper.dart';
import 'package:employee/root/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/utils/dialog_helper.dart';
import '../../app/app_strings.dart';

class RootCubit extends Cubit<RootStates> {
  RootCubit()
    : super(
        RootStates(
          navigatorKeys: [
            GlobalKey<NavigatorState>(),
            GlobalKey<NavigatorState>(),
            GlobalKey<NavigatorState>(),
            GlobalKey<NavigatorState>(),
            GlobalKey<NavigatorState>(),
            GlobalKey<NavigatorState>(),
          ],
        ),
      );

  get navigatorKeys => state.navigatorKeys;
  void handleBackPressed() {
    final navigator = navigatorKeys[state.ccurrentIndex].currentState;

    if (navigator != null && navigator.canPop()) {
      navigator.pop();
    } else if (state.ccurrentIndex != 0) {
      emit(
        state.copyWith(
          rootStatus: RootStatus.reseatHomeIndex,
          ccurrentIndex: 0,
        ),
      );
    }
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return AppStrings.home;
      case 1:
        return AppStrings.audience;
      case 2:
        return AppStrings.holidays;
      case 3:
        return AppStrings.salary;
      case 4:
        return AppStrings.chats;
      case 5:
        return AppStrings.profile;
      default:
        return '';
    }
  }

  Widget? getActionWidget() {
    switch (state.ccurrentIndex) {
      case 0:
        return IconButton(icon: Icon(Icons.notifications), onPressed: () {});

      case 2:
        return IconButton(icon: Icon(Icons.add), onPressed: () {});
      case 5:
        return IconButton(icon: Icon(Icons.edit), onPressed: () {});
      default:
        return null;
    }
  }

  bool shouldShowAction() {
    return state.ccurrentIndex == 0 ||
        state.ccurrentIndex == 2 ||
        state.ccurrentIndex == 5;
  }

  void selectedIndex(int index) {
    emit(
      state.copyWith(
        rootStatus: RootStatus.selectNavBarIndex,
        ccurrentIndex: index,
      ),
    );
  }

  Future<void>logout()async{
    await CacheHelper.removeData(ApiConstants.tokenKey);
    emit(state.copyWith(rootStatus: RootStatus.userLoggedOut,));
  }
}
