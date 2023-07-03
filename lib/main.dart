import 'package:flutter/material.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/screens/bmi_calculator_page.dart';
import 'package:gym_guide_app/screens/exercise_detail_page.dart';
import 'package:gym_guide_app/screens/exercise_list_page.dart';
import 'package:gym_guide_app/screens/filter_page.dart';
import 'package:gym_guide_app/screens/homepage.dart';

import 'data/exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _toggleIsFavourite(ExerciseModel exerciseModel) {
    ExerciseModel model = exerciseList
        .firstWhere((element) => element.name == exerciseModel.name);
    setState(() {
      model.isFavourite = !model.isFavourite;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        sliderTheme: const SliderThemeData(
          activeTrackColor: Color(0xFF322751),
          activeTickMarkColor: Color(0xFF322751),
          thumbColor: Color(0xFF322751),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF322751),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF322751),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF322751),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF322751),
        ),
      ),
      title: "Gym Guide",
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailPage.routeName: (context) =>
            ExerciseDetailPage(toggleFavourite: _toggleIsFavourite),
        BMICalculatorPage.routeName: (context) => const BMICalculatorPage(),
        FilterPage.routeName: (context) => const FilterPage(),
      },
    );
  }
}
