import 'package:flutter/material.dart';
import '../Conest.dart';

class Resultview extends StatelessWidget {
  final double bmi;
  final int height;
  final int weight;
  final int age;

  const Resultview({super.key,
    required this.bmi,
    required this.height,
    required this.weight,
    required this.age,
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
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
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
