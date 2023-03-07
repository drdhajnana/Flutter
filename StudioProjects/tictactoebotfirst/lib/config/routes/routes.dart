import 'package:flutter/material.dart';
import 'package:tictactoebotfirst/config/routes/routes_models.dart';
import 'package:tictactoebotfirst/modules/launch_pad/view/launch_pad.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    RouteModels routeModels = RouteModels();

    switch (settings.name) {

      case '/':
          return MaterialPageRoute(
            builder: (_) => LaunchPad(
              title: routeModels.landingViewTitle,
            ),
          );

      default:
        return errorRoute();

    }

  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}











