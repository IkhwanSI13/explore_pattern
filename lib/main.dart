import 'package:explore_pattern/mainActivity.dart';
import 'package:explore_pattern/page_route.dart';
import 'package:explore_pattern/provider/ProviderActivity.dart';
import 'package:explore_pattern/provider/reusable/ReusableProviderActivity.dart';
import 'package:explore_pattern/provider/simple/SimpleProviderActivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DJP',
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    switch (settings.name) {
      case linkDefault:
        return CustomPageRoute(page: MainActivity());
      case linkProvider:
        return CustomPageRoute(page: ProviderActivity());
      case linkSimpleProvider:
        return CustomPageRoute(page: SimpleProviderActivity());
      case linkReusableProvider:
        return CustomPageRoute(page: ReusableProviderActivity());
    }
  }
}
