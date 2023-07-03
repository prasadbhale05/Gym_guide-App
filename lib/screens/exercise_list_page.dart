import 'package:flutter/material.dart';
import 'package:gym_guide_app/app_state.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/widgets/exercise_card_widget.dart';

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
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: listOfExercise.isEmpty
              ? Center(
                  child: Text(
                    'No exercise with difficulty level: ${AppState.difficultyLevel} and Equipment type: ${AppState.selectedEquipment.name}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ExerciseCardWidget(
                        exerciseModel: listOfExercise[index]);
                  },
                  itemCount: listOfExercise.length,
                )),
    );
  }
}
