import 'package:flutter/material.dart';
import 'constants.dart';


class CardContent extends StatelessWidget {
  CardContent ({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon
          ,
          size: 80.0,
          color: Color(0xFFFFFFFF),
        ),
        SizedBox(height: 10.0),
        Text(label,
            style:kLabelStyle
    ),
    ]
    );
  }
}