import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color blue = Color(0xff54D1DC);
const Color white = Colors.white;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCard;
  Color femaleCard;

  Color MColor;
  Color FColor;
  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: _textColor(context),
            //fontWeight: FontWeight.bold,
          ),
        ),
        leading: NeumorphicButton(
          margin: EdgeInsets.only(top: 5),
          onPressed: () {
            NeumorphicTheme.of(context).themeMode =
                NeumorphicTheme.isUsingDark(context)
                    ? ThemeMode.light
                    : ThemeMode.dark;
            _CardColor(context);
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: NeumorphicToggle(
                height: 80,
                width: 370,
                padding: EdgeInsets.all(8),
                selectedIndex: _selectedIndex,
                displayForegroundOnlyIfSelected: true,
                children: [
                  ToggleElement(
                    background: Center(
                        child: Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xff525F79)),
                    )),
                    foreground: Center(
                        child: Text(
                      "Female",
                      style: TextStyle(fontWeight: FontWeight.w700 ,color: white),
                    )),
                  ),
                  ToggleElement(
                    background: Center(
                        child: Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xff525F79)),
                    )),
                    foreground: Center(
                        child: Text(
                      "Male",
                      style: TextStyle(fontWeight: FontWeight.w700, color: white),
                    )),
                  )
                ],
                thumb:  Neumorphic(
                  style: NeumorphicStyle(
                    color: Color(0xff54D1DC),
                    shape: NeumorphicShape.concave,
                    boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                    // border: NeumorphicBorder(),
                  ),
                ),

                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                    print("_firstSelected: $_selectedIndex");
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: ReusableCard(),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(),
                  ),
                  Expanded(
                    child: ReusableCard(),
                  ),
                ],
              ),
            ),
            NeumorphicButton(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 130,
              ),
              margin: EdgeInsets.all(15),
              onPressed: () {},
              duration: Duration(microseconds: 1),
              style: NeumorphicStyle(
                color: Color(0xff54D1DC),
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                // border: NeumorphicBorder(),
              ),
              // padding: const EdgeInsets.all(12.0),
              child: Text(
                "Go to full sample",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
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

  void _GenderColor(BuildContext context, int f) {
    if (NeumorphicTheme.isUsingDark(context)) {
      if (f == 1) {
        maleCard = blue;
        MColor = white;
        femaleCard = Color(0xFF3E3E3E);
        FColor = Color(0xff525F79);
      } else {
        maleCard = Color(0xFF3E3E3E);
        MColor = Color(0xFF3E3E3E);
        femaleCard = blue;
        FColor = white;
      }
    } else if (!NeumorphicTheme.isUsingDark(context)) {
      if (f == 1) {
        maleCard = blue;
        femaleCard = Colors.white;
      } else {
        maleCard = Colors.white;
        femaleCard = blue;
      }
    }
  }

  void _CardColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      maleCard = Colors.white;
      femaleCard = Colors.white;
    } else {
      maleCard = Color(0xFF3E3E3E);
      femaleCard = Color(0xFF3E3E3E);
    }
  }
}

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

class ToggleElement {
  final Widget background;
  final Widget foreground;

  ToggleElement({
    this.background,
    this.foreground,
  });
}

@immutable
class NeumorphicToggle extends StatelessWidget {
  static const MIN_EMBOSS_DEPTH = -1.0;

  final EdgeInsets padding;

  final List<ToggleElement> children;
  final Widget thumb;

  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final Function(int) onAnimationChangedFinished;

  final NeumorphicToggleStyle style;
  final double height;
  final double width;
  final Duration duration;
  final bool isEnabled;

  final Curve movingCurve;

  final Curve alphaAnimationCurve;
  final bool displayForegroundOnlyIfSelected;

  const NeumorphicToggle({
    this.style = const NeumorphicToggleStyle(),
    Key key,
    @required this.children,
    @required this.thumb,
    this.padding = const EdgeInsets.all(2),
    this.duration = const Duration(milliseconds: 200),
    this.selectedIndex = 0,
    this.alphaAnimationCurve = Curves.linear,
    this.movingCurve = Curves.linear,
    this.onAnimationChangedFinished,
    this.onChanged,
    this.height = 30,
    this.width,
    this.isEnabled = true,
    this.displayForegroundOnlyIfSelected = true,
  }) : super(key: key);

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        _background(context),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: _generateBackgrounds(),
        ),
        AnimatedAlign(
          curve: this.movingCurve,
          onEnd: () {
            if (onAnimationChangedFinished != null) {
              onAnimationChangedFinished(this.selectedIndex);
            }
          },
          alignment: _alignment(),
          duration: this.duration,
          child: FractionallySizedBox(
            widthFactor: 1 / this.children.length,
            heightFactor: 1,
            child: Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(this.style.borderRadius),
              ),
              margin: this.padding,
              child: this.thumb,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: _generateForegrounds(),
        ),
      ],
    );
  }

  List<Widget> _generateBackgrounds() {
    final List<Widget> widgets = [];
    for (int i = 0; i < this.children.length; ++i) {
      widgets.add(_backgroundAtIndex(i));
    }
    return widgets;
  }

  List<Widget> _generateForegrounds() {
    final List<Widget> widgets = [];
    for (int i = 0; i < this.children.length; ++i) {
      widgets.add(_foregroundAtIndex(i));
    }
    return widgets;
  }

  Alignment _alignment() {
    double percentX = selectedIndex / (this.children.length - 1);
    double aligmentX = -1.0 + (2.0 * percentX);
    return Alignment(aligmentX, 0.0);
  }

  Widget _backgroundAtIndex(int index) {
    return Expanded(
        flex: 1, child: this.children[index].background ?? SizedBox.expand());
  }

  Widget _foregroundAtIndex(int index) {
    Widget child = (!this.displayForegroundOnlyIfSelected) ||
            (this.displayForegroundOnlyIfSelected &&
                this.selectedIndex == index)
        ? this.children[index].foreground
        : SizedBox.expand();
    //wrap with opacity animation
    if (style.animateOpacity) {
      child = AnimatedOpacity(
        curve: this.alphaAnimationCurve,
        opacity: this.selectedIndex == index ? 1 : 0,
        duration: this.duration,
        child: child,
      );
    }
    return Expanded(
        flex: 1,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _notifyOnChange(index);
          },
          child: child,
        ));
  }

  Widget _background(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(this.style.borderRadius),
          color: this.style.backgroundColor,
          disableDepth: this.style.disableDepth,
          depth: _getTrackDepth(context),
          shape: NeumorphicShape.flat,
          border: this.style.border,
          lightSource: this.style.lightSource ??
              NeumorphicTheme.currentTheme(context).lightSource),
      child: SizedBox.expand(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.width != null) {
      return SizedBox(
        height: this.height,
        width: this.width,
        child: _buildStack(context),
      );
    } else {
      return FractionallySizedBox(
        widthFactor: 1.0,
        child: SizedBox(
          height: this.height,
          child: _buildStack(context),
        ),
      );
    }
  }

  double _getTrackDepth(BuildContext context) {
    final NeumorphicThemeData theme = NeumorphicTheme.currentTheme(context);

    //force negative to have emboss
    final double depth = -1 * (this.style.depth ?? theme.depth).abs();
    return depth.clamp(Neumorphic.MIN_DEPTH, NeumorphicToggle.MIN_EMBOSS_DEPTH);
  }

  void _notifyOnChange(int newValue) {
    if (this.onChanged != null) {
      this.onChanged(newValue);
    }
  }
}
