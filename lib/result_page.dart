import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'input_page.dart';
import 'bottom_button.dart';

class Resultpage extends StatelessWidget {
  Resultpage({@required this.bmiResult,@required this.inter,@required this.resultText});


  final String bmiResult;
  final String resultText;
  final String inter;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(
          'Your Result',
        style: ktitletextStyle,
      ),
      ),
          ),
          Expanded(
            flex: 6,
            child: Reusuablecard(colour: kcardclr,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultText.toUpperCase(),
                  style: kresulttextStyle,
                ),
                Text(
                  bmiResult,
                  style: kbmistyle,
                ),
                Text(
                  inter,
                  textAlign: TextAlign.center,
                  style: kbodystyle,
                ),
              ],
            ),
            ),
          ),
          bottonButton(buttonTitle: 'RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}


