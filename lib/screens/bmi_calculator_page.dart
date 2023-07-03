import 'package:flutter/material.dart';

enum Gender { male, female }

class BMICalculatorPage extends StatefulWidget {
  static String routeName = '/bmiCalculatorPage';
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  double _weight = 50;
  TextEditingController heightController = TextEditingController();
  Gender gender = Gender.male;
  double bmiValue = 0;
  String message = '';
  calculateBMI() {
    double height = double.parse(heightController.text);
    if (gender == Gender.male) {
      bmiValue = _weight / (height * height) * 10000;
    } else {
      bmiValue = _weight / (height * height) * 10000 * 0.9;
    }
    if (bmiValue <= 18.5) {
      message = 'You are underweight';
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      message = 'You have a normal weight';
    } else if (bmiValue >= 25 && bmiValue < 50) {
      message = 'You are overweight';
    } else {
      message = 'You are obese';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Calculate your BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.grey[100],
              child: Column(
                children: [
                  const Text('Weight(kg)'),
                  Text(
                    "${_weight.toStringAsFixed(2)} kg",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  Slider(
                    value: _weight,
                    onChanged: (value) {
                      _weight = value;
                      setState(() {});
                    },
                    min: 1,
                    max: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: "Height (cm)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    gender = Gender.male;
                    setState(() {});
                  },
                  child: Card(
                    color: gender == Gender.male
                        ? Colors.blue[100]
                        : Colors.grey[50],
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Male',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 30,
                            color: gender == Gender.male
                                ? Colors.green
                                : Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    gender = Gender.female;
                    setState(() {});
                  },
                  child: Card(
                    color: gender == Gender.female
                        ? Colors.pink[100]
                        : Colors.grey[50],
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Female',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 30,
                            color: gender == Gender.female
                                ? Colors.green
                                : Colors.grey[300],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: double.infinity,
              onPressed: () {
                calculateBMI();
              },
              height: 60,
              color: const Color(0xFF322751),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your BMI is: ${bmiValue.toStringAsFixed(2)} \n$message',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF322751),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
