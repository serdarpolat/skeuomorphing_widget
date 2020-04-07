import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skuemorphic_widgets/radial_progress_bar.dart';
import 'package:skuemorphic_widgets/themes.dart';
import 'package:skuemorphic_widgets/ticker_painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

double ww(double w, double s) => w * (s / 455);
double hh(double h, double s) => h * (s / 960);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Brush.bg,
        child: Padding(
          padding: EdgeInsets.all(ww(w, 30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              //? Menu Button
              MenuButton(),
              SizedBox(height: w * 0.04),
              //? Singer Info
              SingerInfo(),
              SizedBox(height: ww(w, 32)),
              //? Radial Button
              RadialButton(),
              //? SeekBar
              SeekBar(),
              //? Control Buttons
              ControlButtons(),
              SizedBox(height: ww(w, 40)),
              //? Bottom Buttons
              BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: ww(w, 48),
      height: ww(w, 48),
      padding: EdgeInsets.all(2.4),
      child: Container(
        padding: EdgeInsets.all(ww(w, 12)),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: ww(w, 4),
              color: Color(0xff7b7d91),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: ww(w, 4),
              color: Color(0xff7b7d91),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: ww(w, 4),
              color: Color(0xff7b7d91),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ww(w, 9)),
          gradient: LinearGradient(
            colors: [
              Color(0xff393b50),
              Color(0xff1f2233),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xff121525),
        borderRadius: BorderRadius.circular(ww(w, 12)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1a1b2d),
            offset: Offset(5, 5),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Color(0xff313348),
            offset: Offset(-5, -5),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}

class SingerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "Sezen Aksu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                "Manifesto",
                style: TextStyle(
                  color: Brush.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Container(
            width: w * 0.15,
            height: w * 0.15,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Brush.darkBlue,
              boxShadow: [
                BoxShadow(
                  color: Brush.bottomShadow,
                  offset: Offset(5, 5),
                  blurRadius: 6,
                ),
                BoxShadow(
                  color: Brush.topShadow,
                  offset: Offset(-5, -5),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/sezen_aksu.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      alignment: Alignment.topCenter,
      child: Container(
        width: ww(w, 355),
        height: ww(w, 355), //! Önceki = -40
        child: CustomPaint(
          painter: TickerPainter(
            color: Brush.grey.withOpacity(0.5),
          ),
          child: Padding(
            padding: EdgeInsets.all(ww(w, 50)), //! Önceki = 50
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(ww(w, 4)),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(ww(w, 8)),
                child: RadialProgressbar(
                  trackColor: Brush.grey.withOpacity(0.3),
                  trackWidth: 4,
                  trackPercent: 0.67,
                  progressWidth: 4,
                  progressPercent: 0.33,
                  progressColor: Color(0xff2d41bb),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Container(
                                width: 10,
                                height: 10,
                                padding: EdgeInsets.all(1),
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        Color(0xff3e76ff),
                                        Color(0xff1f4299),
                                      ],
                                      center: Alignment.center,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Brush.grey.withOpacity(0.3),
                                      Brush.topShadow.withOpacity(0.5),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Brush.topShadow,
                                        Brush.bottomShadow,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Brush.grey.withOpacity(0.3),
                                      Brush.topShadow.withOpacity(0.5),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "75%",
                              style: TextStyle(
                                color: Brush.grey,
                                fontSize: 26,
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Brush.bg,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Brush.darkBlue,
                            offset: Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff393b50),
                            Brush.bg,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Brush.darkBlue.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
              ),
              decoration: BoxDecoration(
                color: Brush.bg,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1a1b2d),
                    offset: Offset(8, 8),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color(0xff313348),
                    offset: Offset(-8, -8),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SeekBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w - 20,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "1:52",
                style: TextStyle(
                  color: Brush.grey,
                  fontSize: 16,
                ),
              ),
              Text(
                "3:45",
                style: TextStyle(
                  color: Brush.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: ww(w, 10)),
          Container(
            height: 48,
            padding: EdgeInsets.all(2),
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: w - 40,
                  height: ww(w, 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Brush.bg,
                    boxShadow: [
                      BoxShadow(
                        color: Brush.topShadow,
                        offset: Offset(-3, -3),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: Brush.bottomShadow,
                        offset: Offset(3, 3),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: w - 38,
                    height: ww(w, 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Brush.darkBlue,
                          Brush.bottomShadow.withOpacity(0.4),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ww(w, 6.5)),
                  child: Container(
                    width: (w - 40) / 2,
                    height: ww(w, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff2dc143),
                          Color(0xff1c75f3),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -12,
                  left: (w - 82) / 2,
                  child: Container(
                    width: ww(w, 42),
                    height: ww(w, 42),
                    padding: EdgeInsets.all(ww(w, 7)),
                    child: Container(
                      width: ww(w, 42),
                      height: ww(w, 42),
                      child: Center(
                        child: Container(
                          width: ww(w, 12),
                          height: ww(w, 12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Brush.darkBlue,
                              width: 1,
                            ),
                            gradient: RadialGradient(
                              colors: [
                                Color(0xff3e76ff),
                                Color(0xff1f4299),
                              ],
                              center: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Brush.bg,
                            Color(0xff393b50),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Brush.darkBlue,
                          offset: Offset(0, 5),
                          blurRadius: 6,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff393b50),
                          Brush.bg,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: ww(w, 88),
          height: ww(w, 88),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Brush.darkBlue, Brush.darkBlue.withOpacity(0.6)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(6.6),
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.skip_previous,
                        color: Brush.grey,
                        size: 36,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(0, 2),
                          blurRadius: 3,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff393b50),
                          Color(0xff1f2233),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Brush.bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff1a1b2d),
                offset: Offset(8, 8),
                blurRadius: 9,
              ),
              BoxShadow(
                color: Color(0xff313348),
                offset: Offset(-8, -8),
                blurRadius: 9,
              ),
            ],
          ),
        ),
        Container(
          width: ww(w, 144),
          height: ww(w, 144),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Brush.darkBlue, Brush.darkBlue.withOpacity(0.6)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(7.6),
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.pause,
                        color: Brush.grey,
                        size: 54,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(0, 2),
                          blurRadius: 3,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff393b50),
                          Color(0xff1f2233),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Brush.bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff1a1b2d),
                offset: Offset(8, 8),
                blurRadius: 9,
              ),
              BoxShadow(
                color: Color(0xff313348),
                offset: Offset(-8, -8),
                blurRadius: 9,
              ),
            ],
          ),
        ),
        Container(
          width: ww(w, 88),
          height: ww(w, 88),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Brush.darkBlue, Brush.darkBlue.withOpacity(0.6)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(6.6),
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.skip_next,
                        color: Brush.grey,
                        size: 36,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          offset: Offset(0, 2),
                          blurRadius: 3,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff393b50),
                          Color(0xff1f2233),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Brush.bg,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff1a1b2d),
                offset: Offset(8, 8),
                blurRadius: 9,
              ),
              BoxShadow(
                color: Color(0xff313348),
                offset: Offset(-8, -8),
                blurRadius: 9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: ww(w, 82),
      padding: EdgeInsets.all(2.4),
      decoration: BoxDecoration(
        color: Brush.bg,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Brush.topShadow,
            offset: Offset(-8, -7),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Brush.bottomShadow,
            offset: Offset(8, 7),
            blurRadius: 8,
          ),
        ],
      ),
      child: Container(
        height: ww(w, 82),
        padding: EdgeInsets.all(4),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.6),
                      child: Container(
                        height: 68.8,
                        width: w - (ww(w, 30) * 2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1f2233),
                              Color(0xff393b50),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                        child: Icon(
                          Icons.refresh,
                          color: Brush.grey,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Brush.grey.withOpacity(0.5),
                      Brush.bottomShadow,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.6),
                      child: Container(
                        height: 68.8,
                        width: w - (ww(w, 30) * 2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff1f2233),
                              Color(0xff393b50),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Icon(
                          Icons.shuffle,
                          color: Brush.grey,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Brush.grey.withOpacity(0.5),
                      Brush.bottomShadow,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Brush.darkBlue,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
