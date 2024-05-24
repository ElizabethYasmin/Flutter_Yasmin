import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:yasmin_flutter_1/content.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool vis = false;

  @override
  Widget build(BuildContext context) {
    DateTime specifiedTime = DateTime.parse('2024-05-24 00:00:00');
    DateTime currentTime = DateTime.now();
    Duration diff = specifiedTime.difference(currentTime);

    if (diff.isNegative) {
      // Si la diferencia es negativa, establecemos una duración mínima
      diff = Duration.zero;
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.pink],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/mascara.gif'),
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Surprise madar fakar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TimerCountdown(
                    timeTextStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                    format: CountDownTimerFormat.daysHoursMinutesSeconds,
                    endTime: DateTime.now().add(diff),
                    onEnd: () {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          vis = true;
                        });
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                vis == true
                    ? SizedBox(
                        width: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contentpage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Open",
                                style: TextStyle(color: Colors.red),
                              ),
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
