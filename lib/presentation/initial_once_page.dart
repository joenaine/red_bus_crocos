import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:red_bus_crocos_project/presentation/bottom_navigation/bottom_navigation.dart';
import 'package:red_bus_crocos_project/presentation/choose_language/choose_language_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class InitialOncePage extends StatelessWidget {
  const InitialOncePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hasShownPage(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData && snapshot.data == true) {
          return const BottomNavigationPage(); // Page to show if the special page has already been shown
        } else {
          return const ChooseLanguagePage(); // Page to show only once
        }
      },
    );
  }
}

Future<bool> hasShownPage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('hasShownPage') ?? false;
}

Future<void> setShownPage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('hasShownPage', true);
}
