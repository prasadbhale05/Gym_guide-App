import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/widgets/exercise_card_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExerciseListPage extends StatelessWidget {
  static String routeName = "/exerciseList";
  const ExerciseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final ExerciseModel ExerciseModel = ExerciseList[0];
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    /* This fetches the argument used in pushNamed property in Navigator */
    final String title = args["title"];
    final List<ExerciseModel> listOfExercise = args["listOfExercise"];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Adaptive.h(2)),
        child: listOfExercise.isEmpty
            ? Center(
                child: Text(
                  'No exercise with difficulty level: ${AppState.difficultyLevel} and Equipment type: ${AppState.selectedEquipment.name}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExerciseCardWidget(
                        exerciseModel: listOfExercise[index],
                      ),
                      SizedBox(
                        height: Adaptive.h(1),
                      ),
                    ],
                  );
                },
                itemCount: listOfExercise.length,
              ),
      ),
    );
  }
}
