import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton ({@required this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      child: Icon(icon, color: Colors.white),
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}