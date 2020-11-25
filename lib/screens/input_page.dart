import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import 'results_page.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 45;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50,),
            Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Neumorphic(
                      child: Container(
                        height: 300,
                        width: 170,
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kInactiveCardColour
                              :kActiveCardColour ,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.male,
                            label: 'Male',
                          ),
                        ),
                      ) ,
                    ),
                    SizedBox(width: 30,),
                    Neumorphic(
                      child:  Container(
                        height: 300,
                        width: 170,
                        child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kInactiveCardColour
                              :kActiveCardColour ,
                          cardChild: IconContent(
                            icon: FontAwesomeIcons.female,
                            label: 'Female',
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(left: 25,right: 25),
              child: Neumorphic(
                child:   Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Colors.black26,
                            activeTrackColor: Colors.grey,
                            thumbColor: Color(0xFFEB1558),
                            overlayColor: Color(0x29EB1558),
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20,),
                    Neumorphic(
                      child:  Container(
                        height: 200,
                        width: 170,
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Neumorphic(
                      child: Container(
                        height: 200,
                        width: 170,
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(
                                            () {
                                          age--;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      })
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20,),
            Neumorphic(
              child: BottomButton(
                buttonTitle: 'Calculate',
                onTap: () {
                  CalculatorBrain calc = CalculatorBrain(height, weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,)
          ],
        ));
  }
}
