import 'package:bmicalculator/Screens/screen2code.dart';
import 'package:bmicalculator/componenets/ICON.dart';
import 'package:bmicalculator/componenets/brainCalculate.dart';
import '../componenets/buttombutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componenets/ReuseableCard.dart';
import '../componenets/constants.dart';
import '../componenets/RoundICon.dart';


enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColour;
  Color femaleCardColor=inactiveCardColour;
  Gender selectedGender;
  int height=180,Weight=60,age=5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
          child : GestureDetector(
              onTap: (){
                setState(() {
                  selectedGender=Gender.male;
                });
                },
              child :ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
                colour : selectedGender==Gender.male? activeCardColour : inactiveCardColour,
              cardChild:iconBack('MALE',FontAwesomeIcons.mars),
              ),
              ),
              ),
              Expanded(
                child : GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
              child : ReusableCard(
                onPress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                colour : selectedGender==Gender.female? activeCardColour : inactiveCardColour,
               cardChild:iconBack('FEMALE',FontAwesomeIcons.venus),
    ),
                 ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour : activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                        'HEIGHT',
                    style: labelTextStyle,
                        ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        height.toString(),
                        style: textTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),

                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTickMarkColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ) ,
                  child : Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  ),
                  ),
                ],
                ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                    colour : Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      Weight.toString(),
                      style: textTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              Weight--;
                            });
                          },
                          icona: FontAwesomeIcons.minus,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icona: FontAwesomeIcons.plus,
                        onPressed: (){
                            setState(() {
                              Weight++;
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
                child: ReusableCard(
                    colour : Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Age',
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: textTextStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          icona: FontAwesomeIcons.minus,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icona: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                ),
              )
            ],
          ),
        ),
        BottomButton(buttonTitle: 'CALCULATE', onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: Weight);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2Code(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          )));},),
      ],
      ),

    );
  }
}
