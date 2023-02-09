import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'card_content.dart';
import 'constants.dart';
import 'package:bmi_calculator/result.dart';
import 'package:bmi_calculator/roundIconButton.dart';
import 'bottomButton.dart';
import 'package:bmi_calculator/calculatorBrain.dart';


enum GenderType {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: (){setState((){
                        selectedGender = GenderType.male;
                      })
                      ;},
                      colour: selectedGender == GenderType.male?
                  kActiveCardColour : kInactiveCardColour,
                      cardChild:
                  CardContent(icon: FontAwesomeIcons.mars,label:'MALE') ),

                ),
                Expanded(
                  child: ReusableCard(
                      onPress: (){setState((){
                        selectedGender = GenderType.female;
                      })
                      ;},
                      colour:selectedGender == GenderType.female?
                  kActiveCardColour : kInactiveCardColour,
                      cardChild:
                      CardContent(icon: FontAwesomeIcons.venus,label:'FEMALE')),

                ),],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: kActiveCardColour,
            cardChild:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('HEIGHT',
              style:kLabelStyle),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
              Text(height.toString(),
              style: kNumberStyle,),
              Text('cm',
              style: kLabelStyle,),


            ],),
                SliderTheme(data: SliderTheme.of(context).copyWith(

                  inactiveTrackColor: Color(0xFF8DE98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x1fEB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape:RoundSliderOverlayShape(overlayRadius: 20.0),),
                  child: Slider(
                    value: height.toDouble(),
                    min:120.0,
                    max:220.0,
                    onChanged: (double newValue){
                      print(newValue);
                      setState(() {
                        height = newValue.round();
                      });
                    }
                    ,),
                )
              ],)
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: kActiveCardColour,
                  cardChild: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',
                      style: kLabelStyle,),
                      Text(weight.toString(),
                      style: kNumberStyle,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onPressed:(){
                              setState((){weight--;
                                                       });},
                            icon: FontAwesomeIcons.minus,),
                          SizedBox(width: 10.0,),
                          RoundIconButton( onPressed:(){
                            setState((){weight++;
                            });},
                            icon: FontAwesomeIcons.plus,),
                        ],
                      )


                    ],
                  )
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColour,
                  cardChild: Column(
                    children: [
                      Text('AGE',
                      style: kLabelStyle,),
                      Text(age.toString(),
                      style: kNumberStyle,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){setState((){
                          age--;
                        });},),
                        SizedBox(width: 10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                          {setState((){
                            age++;
                          });},)
                      ],)
                    ],
                  ),),
                ),],
            ),
          ),

        BottomButton(title: 'CALCULATE', onTap: (){
          CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
          Navigator.push(context,
          MaterialPageRoute(builder: (context)
    {return ResultPage(

      bmiResult: calc.calculateBmi(),
      resultText: calc.getResult(),
      interpretation: calc.getInterpretation(),

    );},),);},),

    ]));

  }
}









