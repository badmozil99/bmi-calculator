import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  final ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Color(0xFF0A0E21),
              secondary: Colors.purple),
      scaffoldBackgroundColor: Color(0xFF0A0E21),

      textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)
      ),),
      home: InputPage(),
    );
  }
}


