import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  Color blue = Color(0xff54D1DC);
  Color white = Colors.white;
  String bmiResult;
  String resultText;
  String theInterp;
  IconData icon;

  ResultPage({this.bmiResult, this.resultText,this.theInterp, this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(
        actions: <Widget>[
          NeumorphicButton(
            margin: EdgeInsets.only(top: 5),
            onPressed: () {
              NeumorphicTheme.of(context).themeMode =
              NeumorphicTheme.isUsingDark(context)
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.wb_sunny,
              color: _iconsColor(context),
            ),
          ),
        ],
        title: Text(
          'BMI Result',
          style: TextStyle(
            color: _textColor(context),
            //fontWeight: FontWeight.bold,
          ),
        ),
        leading: NeumorphicButton(
          margin: EdgeInsets.only(top: 5),
          onPressed: () {
            Navigator.pop(context);
          },
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: _iconsColor(context),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ReusableCard(
              chardChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                      fontSize: 40,
                      color: _textColor(context),
                      fontWeight: FontWeight.w100,
                    ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontSize: 80,
                        color: _textColor(context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              chardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    icon,
                    color: _iconsColor(context),
                    size: 40,
                  ),
                  Center(
                  child: Text(theInterp
                  ,style: TextStyle(
                      fontSize: 20,
                    //  fontWeight: FontWeight.w400,
                      color: _textColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
                ],
              ),
          ),
          ),
          NeumorphicButton(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 120,
            ),
            margin: EdgeInsets.all(15),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            duration: Duration(microseconds: 1),
            style: NeumorphicStyle(
              color: Color(0xff54D1DC),
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            ),
            child: Text(
              "RECALCULATE",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Text TitleStyle(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: _textColor(context),
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.shadowLightColor;
    } else {
      return Color(0xff525F79);
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return white;
    } else {
      return Color(0xff525F79);
    }
  }

  Color _toggleNotColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return white;
    } else {
      return Color(0xff525F79);
    }
  }
}
