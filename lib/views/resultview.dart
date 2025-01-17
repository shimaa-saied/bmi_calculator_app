import 'package:flutter/material.dart';
import '../Conest.dart';

class Resultview extends StatelessWidget {
  final double bmi;
  final int height;
  final int weight;
  final int age;
  final String? gender;

  const Resultview({super.key,
    required this.bmi,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  String getBMICategory() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String getBMIDescription() {
    if (gender=='male') {
      if (bmi < 18.5) return "You are underweight. Men need to maintain a BMI of 18.5 or higher.";
      if (bmi < 24.9) return "You have a normal weight. Good job!";
      if (bmi < 29.9) return "You are overweight. Consider a balanced diet and exercise.";
      return "You are in the obese category. It's recommended to consult a health professional.";
    } else {
      if (bmi < 18.5) return "You are underweight. Women need to maintain a BMI of 18.5 or higher.";
      if (bmi < 24.9) return "You have a normal weight. Well done!";
      if (bmi < 29.9) return "You are overweight. Focus on a healthy lifestyle.";
      return "You are in the obese category. Professional advice is suggested.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardCoulor,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Result',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Height: $height cm',
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Weight: $weight kg',
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Age: $age years',
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              'Gender: $gender',
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: kActiveCardCoulor,
                borderRadius: BorderRadius.circular(20)
              ),

              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    getBMICategory(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${bmi.toStringAsFixed(1)}',
                    style: kBMITextStyle,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),
                  Text(
                    getBMIDescription(),
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: kBottomContainerCoulor,
                      margin: const EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: kBottomContainerHeight,
                      child: const Center(
                        child: Text(
                          'RE-CALCULATE',
                          style: kLargeBottonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
