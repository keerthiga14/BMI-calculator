import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconcol.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calcute_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
Gender selectedgender;
int height = 180;
int weight = 60;
int age = 30;
  /*Color maleclr = inactivecardclr;
  Color femaleclr = inactivecardclr;

  void update(Gender selectedgender) {
    if(selectedgender == Gender.male) {
        if(maleclr==inactivecardclr){
          maleclr = cardclr;
          femaleclr = inactivecardclr;
        }
        else{
          maleclr = inactivecardclr;
        }
      }
    if(selectedgender == Gender.female){
      if(femaleclr==inactivecardclr){
        femaleclr = cardclr;
        maleclr = inactivecardclr;
      }
      else{
        femaleclr = inactivecardclr;
      }

    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Reusuablecard(
                      colour: selectedgender == Gender.male ? kcardclr : kinactivecardclr ,
                      cardchild: iconcol(icon: FontAwesomeIcons.mars,label: 'MALE',),),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: Reusuablecard(
                        colour: selectedgender == Gender.female ? kcardclr : kinactivecardclr ,
                        cardchild: iconcol(icon: FontAwesomeIcons.venus,label: 'FEMALE',),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusuablecard(
                colour: kcardclr,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                    style: klabeltextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: knumbertextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabeltextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.5),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusuablecard(
                      colour: kcardclr,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabeltextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                              setState(() {
                                weight--;
                              });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                weight++;
                              });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusuablecard(colour: kcardclr,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabeltextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottonButton(buttonTitle: 'CALCULATE',onTap: (){
            Calculatorbrain calc = Calculatorbrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(bmiResult: calc.Calculatebmi(),inter: calc.getInterolation(),resultText: calc.getResult(),)));
          },),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 54.0,
        height: 54.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

