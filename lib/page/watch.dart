// ignore_for_file: prefer_const_constructors, unused_element

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watch> {


  @override
  void initState() {
    
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {});
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 400,
        height: 680,
        
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 23),
          child: Stack(
            // the design of clock
            children: [
              Container(
                
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft, 
                    end: Alignment.bottomRight,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Colors.white12,
                      Colors.white60,
                    ],
                  ),
                 // for its shadow for first circle
                  boxShadow: [
                   
                        BoxShadow(
                      color: Colors.white70,
                      blurRadius: 36,
                      offset: Offset(-15, -8),
                    ),
                     BoxShadow(
                      color: Color(0xFF123468). withOpacity(.2),
                      blurRadius: 32,
                      offset: Offset(20, 10),
                    ),
                  ]
                ),
              ),
              // second circle
                Padding(
                  padding: const EdgeInsets.only(left: 161),
                  child: Container(
                  width: 25,
                  height: 800,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft, 
                      end: Alignment.bottomRight,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Colors.white60,
                        Colors.white70,
                      ],
                    ),
                   
                    boxShadow: [
                     BoxShadow(
                        color: Color(0xFF123468). withOpacity(.2),
                        blurRadius: 28,
                        offset: Offset(20, 10),
                      ),
                          BoxShadow(
                        color: Colors.blueGrey,
                        blurRadius: 8,
                        offset: Offset(-3, -1),
                      ),
                       
                    ]
                  ),
              ),
                ),
                // end second circle
                Transform.rotate(
                  angle: pi / 2,
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: CustomPaint(
                    painter: ClockPainter(),
                  ),
                ),
              )
              // defining from where the painter will start 
            ],
          ),
        ),
      );
      
      
      
    


}

}

class ClockPainter extends CustomPainter  {
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);
    Offset center = Offset(centerX, centerY);
    double outerRadius = radius- 20;
    double innerRadius = radius - 30;
    Paint hourDashPaint = Paint()
     ..color = Colors.blueGrey ..strokeWidth = 2..strokeCap = StrokeCap.round;
     for (int i = 0; i<360; i+=30){
       double x1 = centerX - outerRadius * cos(i * pi / 180);
       double y1 = centerY - outerRadius * sin(i * pi / 180);

         double x2 = centerX - innerRadius* cos(i * pi / 180);
       double y2 = centerY - innerRadius* sin(i * pi / 180);
       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
     }
     for (int i = 0; i<360; i+=6){
       double x1 =centerX - outerRadius* 0.9 * cos(i * pi / 180);
       double y1 =centerY - outerRadius* 0.9 *sin(i * pi /180);

         double x2 =centerX - innerRadius* cos(i * pi / 180);
       double y2 =centerY - innerRadius* sin(i * pi / 180);
       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
     }

    DateTime dateTime = DateTime.now();

    Paint secLinePaint = Paint()
    ..color = Colors.pinkAccent..strokeWidth = 2..strokeCap = StrokeCap.round;
     Offset secStartOffset = Offset(
      centerX +20 * cos(dateTime.second * 6 *pi / 180),
      centerY +20 * sin(dateTime.second * 6 *pi / 180),
      );
    Offset secEndOffset = Offset(
      centerX - outerRadius *0.89* cos(dateTime.second * 6 *pi / 180),
      centerY - outerRadius *0.89 * sin(dateTime.second * 6 *pi / 180),
      );
     canvas.drawLine(secStartOffset, secEndOffset, secLinePaint); 
      Paint minLinePaint = Paint()
    ..color = Colors.grey..strokeWidth = 4..strokeCap = StrokeCap.round;
    Offset minEndOffset = Offset(
      centerX - outerRadius* .75 * cos(dateTime.minute * 6 *pi / 180),
      centerY - outerRadius *.75 * sin(dateTime.minute * 6 *pi / 180),
      );
      Offset minStartOffset = Offset(
      centerX +20 * cos(dateTime.minute * 6 *pi / 180),
      centerY +20 * sin(dateTime.minute * 6 *pi / 180),
      );
       canvas.drawLine(minStartOffset, minEndOffset, minLinePaint);
       Paint hourLinePaint = Paint()
    ..color = Colors.black87..strokeWidth = 6..strokeCap = StrokeCap.round;
    Offset hourEndOffset = Offset(
      centerX - outerRadius* .3 * cos(dateTime.hour * 6 *pi / 180),
      centerY - innerRadius *.1 * sin(dateTime.hour * 6 *pi / 180),
    );
    Offset hourStartOffset = Offset(
      centerX + 20 * cos(dateTime.hour * 6 *pi / 180),
      centerY + 20 * sin(dateTime.hour * 6 *pi / 180),
    );
        Paint centerCirclePaint = Paint()..color = Colors.pinkAccent;
        canvas.drawLine( hourStartOffset, hourEndOffset, hourLinePaint);
        canvas.drawCircle(center, 6, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
 
}
