import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_notes_flutter/app_constants.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case PageConstants.addNotePage:
        {
          return materialPageRoute(widget: ErrorPage());
          break;
        }
      default:
        return materialPageRoute(widget: ErrorPage());
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(child: Text('Error')),
    );
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
