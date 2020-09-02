import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableCard extends StatelessWidget {
  Color color;
  Widget chardChild;
  ReusableCard({this.color, this.chardChild});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: color,
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15.0),
      child: Container(
        child: chardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
