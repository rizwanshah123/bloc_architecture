import 'package:bloc_example/presentation/routes/routes_name.dart';
import 'package:bloc_example/presentation/screens/home_screen.dart';
import 'package:bloc_example/presentation/screens/second_screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeSreen:
        return MaterialPageRoute(
            builder: (_) =>
                const HomePage(title: 'HOme Screen', color: Colors.blueAccent));
      case RouteNames.secondScreen:
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: 'Second Screen', color: Colors.redAccent));

      case RouteNames.thirdScreen:
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: 'ThirdScreen Screen', color: Colors.blueAccent));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
          body: Center(child: Text('No Route Found')),
        ));
    }
  }
}
