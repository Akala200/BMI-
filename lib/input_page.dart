import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable.dart';

const colorCode = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);
const inactiveColor = Color(0xFF1D1E33);
const activeColor = Color(0xFFEB1555);
const activeTextColor = Color(0xFF1D1E33);
const inActiveTextColor = Color(0xFFFFFFFF);
const KTextNumberStyle = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.bold
);

const KTextMainStyle = TextStyle(
    fontSize: 20.0,
);

const KTextLabelStyle = TextStyle(
    fontSize: 20.0,
);
enum Gender {
 female,
 male
}

enum ColorActive {
  selected,
  notSelected
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  ColorActive selectedTextColor;
  Gender selectedGenderNew;
  int height = 180;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true, // this is all you need

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGenderNew = Gender.male;
                  });
                },
                child: ReuseableCard( colour: selectedGenderNew == Gender.male ? activeColor : inactiveColor,
                  cardChild: CustomIcon(icon: FontAwesomeIcons.mars, gender: 'Male', textColorData:  selectedTextColor == ColorActive.selected ? activeTextColor : inActiveTextColor ,),
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                   selectedGenderNew = Gender.female;
                  });
                },
                child: ReuseableCard( colour: selectedGenderNew == Gender.female ? activeColor : inactiveColor,
                cardChild: CustomIcon(icon: FontAwesomeIcons.venus, gender: 'Female', textColorData: selectedTextColor == ColorActive.notSelected ? activeTextColor : inActiveTextColor ),),
              ),
              ),
            ],
          )),
          Expanded(child: ReuseableCard( colour: colorCode, cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('HEIGHT', style: KTextMainStyle, ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(height.toString(),
                  style: KTextNumberStyle),
                  Text('cm',
                  style: KTextLabelStyle ,
                  ),
                ],
              ),
              Slider(value: height.toDouble(),  onChanged: (double newValue){
                setState(() {
                  height = newValue.round();
                });
              }, min: 120.0, max: 220.0, activeColor: activeColor, inactiveColor: activeTextColor ,)
            ],
          ),)
    ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReuseableCard( colour: colorCode
              ),
              ),
              Expanded(child: ReuseableCard( colour: colorCode)
              ),
            ],
          )),

          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80,
          )

        ],
      )

    );
  }
}



