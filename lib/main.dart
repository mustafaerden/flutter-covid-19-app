import 'package:covid_19/helpers/constants.dart';
import 'package:covid_19/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Tracker',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        primaryColor: kPrimaryBackgroundColor,
        scaffoldBackgroundColor: kPrimaryBackgroundColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: kTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
