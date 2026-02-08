import 'package:speedometer_widget/speedometer_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   double _speed = 0;
  double _fuel = 80;
  int _distanceTravelled = 2100;

  void _onTap() {
    setState(() {
     _speed += 25;
     _fuel -= 5;
     _distanceTravelled++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Custom Speedometer',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Center(
        child: Speedometer(
         height: 320,
          width: 220,
          speedKmh: _speed,
          fuelPercent: _fuel,
          duration: const Duration(milliseconds: 400),
          distanceTravelledKm: _distanceTravelled,
          speedoMeterNeedleColor: Colors.yellow,
          speedoMeterBoundaryColor: Colors.blue.shade800,
          speedoMeterColor: Colors.lightBlueAccent,
          fuelMeterBoundaryColor: Colors.blue.shade900,
          fuelMeterColor: Colors.blueAccent,
          fuelMeterNeedleColor: Colors.yellow,
          distanceScreenTextColor: Colors.yellow,
          distanceScreenColor: Colors.white,
          distanceScreenBoundaryColor: Colors.blueGrey,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onTap,
        tooltip: 'Change',
        backgroundColor: Colors.grey.shade200,
        child: const Icon(Icons.star, color: Color.fromARGB(255, 41, 41, 41)),
      ),
    );
  }
}
