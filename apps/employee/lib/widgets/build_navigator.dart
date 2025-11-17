import 'package:flutter/material.dart';

class BuildNavigator extends StatelessWidget {
  final int index;
  final Widget child;
  final List<GlobalKey<NavigatorState>> navigatorKeys;

  const BuildNavigator({
    super.key,
    required this.index,
    required this.child,
    required this.navigatorKeys,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
