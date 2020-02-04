import 'package:flutter/material.dart';

const linkDefault = "/";
const linkBloc = "/Bloc";
const linkProvider = "/Provider";
const linkSimpleProvider = "/SimpleProvider";
const linkReusableProvider = "/ReusableProvider";

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({this.page})
      : super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    transitionDuration: Duration(milliseconds: 250),
  );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({this.page})
      : super(
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
    transitionDuration: Duration(milliseconds: 250),
  );
}