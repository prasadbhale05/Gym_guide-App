import 'package:flutter/material.dart';
import 'package:gym_guide_app/model/exercise_model.dart';
import 'package:gym_guide_app/screens/exercise_detail_page.dart';

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exerciseModel;
  const ExerciseCardWidget({super.key, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ExerciseDetailPage.routeName, arguments: exerciseModel);
      },
      child: Container(
        height: 262,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              spreadRadius: 4.0,
              color: Colors.grey.withOpacity(0.1),
            ),
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5.0),
                topLeft: Radius.circular(5.0),
              ),
              child: Image.network(
                exerciseModel.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exerciseModel.name,
                    style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index + 1 <= exerciseModel.difficulty
                            ? Icons.star
                            : Icons.star_border_outlined,
                        size: 15.0,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: exerciseModel.equipment.isEmpty
                  ? const Text(
                      "No Equipment",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    )
                  : Text(
                      "Equipment: ${exerciseModel.equipment.join(",")}",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
