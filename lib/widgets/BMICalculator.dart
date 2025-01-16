import 'package:flutter/material.dart';
import '../Conest.dart';
import '../views/resultview.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator();

  int height = 120;
  int weight = 55;
  int age = 20;

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  double calculateBMI() {
    double heightInMeters = widget.height / 100;
    return widget.weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                    isMaleSelected = true;
                      isFemaleSelected = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isMaleSelected
                          ? kActiveCardCoulor
                          : Colors.black12, //if true
                    ),
                    height: 200,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.male, size: 100),
                        Text('Male', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected = false;
                      isFemaleSelected = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          isFemaleSelected ? kActiveCardCoulor : Colors.black12,
                    ),
                    height: 200,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.female, size: 100),
                        Text('Female', style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardCoulor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          widget.height.toString(),
                          style: kNumberTextStyle.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomContainerCoulor,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        value: widget.height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            widget.height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 170,
                  width: 150,
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: kActiveCardCoulor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLableTextStyle,
                      ),
                      Text(
                        widget.weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                widget.weight--;
                              });
                            },
                            backgroundColor: Colors.grey[800],
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            shape: const CircleBorder(),
                            onPressed: () {
                              setState(() {
                                widget.weight++;
                              });
                            },
                            backgroundColor: Colors.grey[800],
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 170,
                  width: 150,
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: kActiveCardCoulor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLableTextStyle,
                        ),
                        Text(
                          widget.age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              shape: const CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  widget.age--;
                                });
                              },
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              shape: const CircleBorder(),
                              onPressed: () {
                                setState(() {
                                  widget.age++;
                                });
                              },
                              backgroundColor: Colors.grey[800],
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                double bmi = calculateBMI();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Resultview(
                      bmi: bmi,
                      height: widget.height,
                      weight: widget.weight,
                      age: widget.age,
                    ),
                  ),
                );
              },
              child: Container(
                color: kBottomContainerCoulor,
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: kLargeBottonTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
