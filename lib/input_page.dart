import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'result_page.dart';
import 'TheBrain.dart';

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
  int _selectedIndex = 0;
  int weight =60;
  int age =30;
  int hieght = 140;

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
        leading:  NeumorphicButton(
          margin: EdgeInsets.only(top: 5),
          onPressed: () {

          },
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.account_circle,
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
              child: Container(
                margin: EdgeInsets.all(15),
                child: NeumorphicToggle(
                  height: 80,
                  padding: EdgeInsets.all(8),
                  selectedIndex: _selectedIndex,
                  displayForegroundOnlyIfSelected: true,
                  children: [
                    ToggleElement(
                      background: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            color: _toggleNotColor(context),
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 20,
                                //fontWeight: FontWeight.w500,
                                color: _toggleNotColor(context)),
                          ),
                        ],
                      )),
                      foreground: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            color: white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700, color: white),
                          ),
                        ],
                      )),
                    ),
                    ToggleElement(
                      background: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            color: _toggleNotColor(context),
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 20,
                                //fontWeight: FontWeight.w500,
                                color: _toggleNotColor(context)),
                          ),
                        ],
                      )),
                      foreground: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            color: white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700, color: white),
                          ),
                        ],
                      )),
                    )
                  ],
                  thumb: Neumorphic(
                    style: NeumorphicStyle(
                      color: Color(0xff54D1DC),
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(15),
                      ),
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
            ),
            Expanded(
              flex: 2,
              child: ReusableCard(
                chardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TitleStyle(context,"Height"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            hieght.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              color: _textColor(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TitleStyle(context,"cm"),
                        ],
                      ),
                    ),
                    NeumorphicSlider(
                        height: 10,
                        value: hieght.toDouble(),
                        min: 80,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            hieght = newValue.round();
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      chardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TitleStyle(context,"Weight"),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              color: _textColor(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NeumorphicButton(
                                margin: EdgeInsets.all(10),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.circle(),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.remove,
                                  color: _iconsColor(context),
                                ),
                              ),
                              NeumorphicButton(
                                margin: EdgeInsets.all( 10),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.circle(),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.add,
                                  color: _iconsColor(context),
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      chardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TitleStyle(context,"Age"),
                          Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              color: _textColor(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              NeumorphicButton(
                                margin: EdgeInsets.all(10),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.circle(),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.remove,
                                  color: _iconsColor(context),
                                ),
                              ),
                              NeumorphicButton(
                                margin: EdgeInsets.all( 10),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.circle(),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.add,
                                  color: _iconsColor(context),
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
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
              onPressed: () {
                Calculator calc= Calculator(height: hieght,weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                  bmiResult: calc.calBMI(),
                  resultText: calc.getResult(),
                  theInterp: calc.getInterpretation(),
                    icon : calc.getIcon(),
                ),
                ),
                );
              },
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
                "CALCULATE",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text TitleStyle(BuildContext context,String text) {
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

class ToggleElement {
  final Widget background;
  final Widget foreground;

  ToggleElement({
    this.background,
    this.foreground,
  });
}

class SliderStyle {
  final double depth;
  final bool disableDepth;
  final BorderRadius borderRadius;
  final Color accent;
  final Color variant;
  final LightSource lightSource;

  final NeumorphicBorder border;
  final NeumorphicBorder thumbBorder;

  const SliderStyle({
    this.depth,
    this.disableDepth,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.accent,
    this.lightSource,
    this.variant,
    this.border = const NeumorphicBorder.none(),
    this.thumbBorder = const NeumorphicBorder.none(),
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderStyle &&
          runtimeType == other.runtimeType &&
          depth == other.depth &&
          disableDepth == other.disableDepth &&
          lightSource == other.lightSource &&
          borderRadius == other.borderRadius &&
          thumbBorder == other.thumbBorder &&
          border == other.border &&
          accent == other.accent &&
          variant == other.variant;

  @override
  int get hashCode =>
      depth.hashCode ^
      disableDepth.hashCode ^
      borderRadius.hashCode ^
      border.hashCode ^
      lightSource.hashCode ^
      thumbBorder.hashCode ^
      accent.hashCode ^
      variant.hashCode;
}

@immutable
class NeumorphicSlider extends StatefulWidget {
  final SliderStyle style;
  final double min;
  final double value;
  final double max;
  final double height;
  final NeumorphicSliderListener onChanged;
  final NeumorphicSliderListener onChangeStart;
  final NeumorphicSliderListener onChangeEnd;

  final Widget thumb;

  NeumorphicSlider({
    Key key,
    this.style = const SliderStyle(),
    this.min = 0,
    this.value = 0,
    this.max = 10,
    this.height = 15,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.thumb,
  });

  double get percent => (((value.clamp(min, max)) - min) / ((max - min)));

  @override
  createState() => _NeumorphicSliderState();
}

class _NeumorphicSliderState extends State<NeumorphicSlider> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          final RenderBox box = context.findRenderObject();
          final tapPos = box.globalToLocal(details.globalPosition);
          final newPercent = tapPos.dx / constraints.maxWidth;
          final newValue =
              ((widget.min + (widget.max - widget.min) * newPercent))
                  .clamp(widget.min, widget.max);

          if (widget.onChanged != null) {
            widget.onChanged(newValue);
          }
        },
        onPanStart: (DragStartDetails details) {
          if (widget.onChangeStart != null) {
            widget.onChangeStart(widget.value);
          }
        },
        onPanEnd: (details) {
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd(widget.value);
          }
        },
        child: _widget(context),
      );
    });
  }

  Widget _widget(BuildContext context) {
    double thumbSize = widget.height * 2.5;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: thumbSize / 2, right: thumbSize / 2),
          child: _generateSlider(context),
        ),
        Align(
            alignment: Alignment(
                //because left = -1 & right = 1, so the "width" = 2, and minValue = 1
                (widget.percent * 2) - 1,
                0),
            child: _generateThumb(context, thumbSize))
      ],
    );
  }

  Widget _generateSlider(BuildContext context) {
    final theme = NeumorphicTheme.currentTheme(context);
    return NeumorphicProgress(
      duration: Duration.zero,
      percent: widget.percent,
      height: widget.height,
      style: ProgressStyle(
        disableDepth: widget.style.disableDepth,
        depth: widget.style.depth,
        border: widget.style.border,
        lightSource: widget.style.lightSource ?? theme.lightSource,
        borderRadius: widget.style.borderRadius,
        accent: widget.style.accent ?? blue,
        variant: widget.style.variant ?? _sliderColor(context),
      ),
    );
  }

  Widget _generateThumb(BuildContext context, double size) {
    final theme = NeumorphicTheme.currentTheme(context);
    return Neumorphic(
      style: NeumorphicStyle(
        disableDepth: widget.style.disableDepth,
        shape: NeumorphicShape.concave,
        border: widget.style.thumbBorder,
        lightSource: widget.style.lightSource ?? theme.lightSource,
        color: widget.style.accent ?? blue,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: SizedBox(
        height: size,
        width: size,
      ),
    );
  }

  Color _sliderColor(BuildContext context) {
    final theme = NeumorphicTheme.currentTheme(context);
    if (NeumorphicTheme.isUsingDark(context)) {
      return white;
    } else {
      return theme.accentColor;
    }
  }

}
