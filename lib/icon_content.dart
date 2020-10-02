import 'package:flutter/material.dart';
const textColor = Color(0x00000000);


class CustomIcon extends StatelessWidget {
  CustomIcon({this.icon, this.gender, this.textColorData});
  final IconData icon;
  final String gender;
  final Color textColorData;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(gender, style: TextStyle(fontSize: 18.0, color: textColorData),),
      ],
    );
  }
}