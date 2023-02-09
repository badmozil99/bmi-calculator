import 'package:bmi_calculator/bottomButton.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class ResultPage extends StatelessWidget {


ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR')
      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(padding: EdgeInsets.only(top: 10.0),
              child: Text('Your Result',
              style: kTitleStyle,
                  textAlign: TextAlign.center ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColour,
            cardChild: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(resultText,
                style: kResultStyle,),
                Text(bmiResult,
                style: kWeightStyle),
                Text(interpretation,
                style: kCommentStyle,
                textAlign: TextAlign.center,)
              ],
            ),),
          ),

          BottomButton(title: 'RE-CALCULATE', onTap: (){Navigator.pop(context);})
        ],
      ),
    );
  }
}
