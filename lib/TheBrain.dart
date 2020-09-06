import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';
class Calculator{
  Calculator({this.height,this.weight});
  int height;
  int weight;
  double BMI;

  String calBMI(){
    BMI = weight / pow(height/100,2);

    return BMI.toStringAsFixed(1);
  }

  String getResult(){
    if(BMI >= 25){
      return "OVERWEIGHT";
    }else if (BMI > 18.5){
      return "NORMAL";
    }else{
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation(){
    if(BMI >= 25){
      return "You may be advised to lose some weight for health reasons.";
    }else if (BMI > 18.5){
      return "You are at a healthy weight for your height.";
    }else{
      return "You may need to put on some weight.";
    }
  }
  IconData getIcon(){
    if(BMI >= 25){
      return Icons.mood_bad;
    }else if (BMI > 18.5){
      return Icons.mood;
    }else{
      return Icons.mood_bad;
    }
  }

}
