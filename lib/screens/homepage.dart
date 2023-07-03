import 'package:flutter/material.dart';
import 'package:gym_guide_app/data/category_list.dart';
import 'package:gym_guide_app/data/exercise.dart';
import 'package:gym_guide_app/screens/bmi_calculator_page.dart';
import 'package:gym_guide_app/screens/filter_page.dart';
import 'package:gym_guide_app/widgets/category_widgets.dart';
import 'package:gym_guide_app/widgets/exercise_card_widget.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/homePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/user.jpg"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Text(
              _index == 0 ? "Workout Categories" : "Favourite Exercises",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic),
            ),
            const Divider(
              color: Colors.black,
            ),
            // Spread operator is used to pass list of widgets in another widget such as children.
            // ...workoutCategoryList
            //     .map((e) => WorkoutCategoryWidgets(workoutCategoryModel: e))
            //     .toList(),
            _index == 0
                ? Expanded(
                    /* Expanded is used so that only available area is used by list for scrolling depending on various devices */
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => WorkoutCategoryWidgets(
                        workoutCategoryModel: workoutCategoryList[index],
                      ),
                      itemCount: workoutCategoryList.length,
                    ),
                  )
                : exerciseList
                        .where((element) => element.isFavourite)
                        .toList()
                        .isEmpty
                    ? const SizedBox(
                        height: 500,
                        child: Center(
                          child: Text(
                            'No exercise marked as Favourite',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => ExerciseCardWidget(
                            exerciseModel: exerciseList
                                .where((element) => element.isFavourite)
                                .toList()[index],
                          ),
                          itemCount: exerciseList
                              .where((element) => element.isFavourite)
                              .toList()
                              .length,
                        ),
                      ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              color: const Color(0xFF322751),
              child: const Padding(
                padding: EdgeInsets.only(top: 50.0, left: 20),
                child: Text(
                  'GYMGUIDE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            ListTile(
              title: const Text('BMI Calculator'),
              onTap: () {
                Navigator.of(context).pushNamed(BMICalculatorPage.routeName);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Filter'),
              onTap: () {
                Navigator.of(context).pushNamed(FilterPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
