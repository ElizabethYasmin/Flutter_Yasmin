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
            colors: [Color.fromARGB(255, 214, 40, 40), Color.fromARGB(255, 0, 48, 73)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/mascara.gif'),
                        height: 900,
                        width: 900,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'SORPRESA!!!  Faltan ...',
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
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      
                      colors: [Color.fromARGB(190, 0, 47, 73), Color.fromARGB(193, 230, 53, 53)],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Cambia la posición de la sombra
                      ),
                    ],
                  ),
                  child: TimerCountdown(
                    
                    timeTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
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
                        width:170,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(181, 214, 40, 40),
                            shape: StadiumBorder(),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Contentpage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Abrir tu ->",
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                                
                              ),
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.white,
                                size: 37.0,
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
