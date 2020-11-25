import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
        @required this.interpretation,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Neumorphic(
              child: Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(50),
              child: Neumorphic(
                child:  BottomButton(
                  buttonTitle: 'Re-Calculate',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
          ),
        ],
      ),
    );
  }
}
