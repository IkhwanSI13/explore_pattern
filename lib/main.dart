import 'package:explore_pattern/bloc/RootBlocActivity.dart';
import 'package:explore_pattern/bloc/simple/BlocActivity.dart';
import 'package:explore_pattern/bloc/withLibrary/Bloc2Activity.dart';
import 'package:explore_pattern/mainActivity.dart';
import 'package:explore_pattern/page_route.dart';
import 'package:explore_pattern/provider/RootProviderActivity.dart';
import 'package:explore_pattern/provider/consumer_selector/ConsumerActivity.dart';
import 'package:explore_pattern/provider/multi/MultiProviderActivity.dart';
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
        return CustomPageRoute(page: RootProviderActivity());
      case linkSimpleProvider:
        return CustomPageRoute(page: SimpleProviderActivity());
      case linkReusableProvider:
        return CustomPageRoute(page: ReusableProviderActivity());
      case linkMultiProvider:
        return CustomPageRoute(page: MultiProviderActivity());
      case linkConsumer:
        return CustomPageRoute(page: ConsumerActivity());
      case linkBlocRoot:
        return CustomPageRoute(page: RootBlocActivity());
      case linkBloc:
        return CustomPageRoute(page: BlocActivity());
      case linkBloc2:
        return CustomPageRoute(page: Bloc2Activity());
    }
  }
}
