
# Speedometer
A visually appealing and customizable widget to be used as a speedometer in Flutter.

## Features

This widget will create a speedometer. 
It can be integrated with any state management. 
Animated speed and fuel needles.

## Getting started

- [Installation](#installation)
- [Constructor](#constructor)
- [Usage_Example](#usage-example)


### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  speedometer_widget: ^0.1.0
```

And then run following command on terminal:

```bash
flutter pub get
```

Add the following import statement in the dart file you are going to use this widget:

```dart
import 'package:speedometer_widget/speedometer_widget.dart';
```

### Constructor

| Property | Default | Description |
|-----------|----------|-------------|
| height | 300 | The height of the speedometer. |
| width | 300 | The width of the speedometer. |
| speedKmh | | The speed of speedometer shoud be in range from 0 to 200. |
| fuelPercent | | The fuel percentage of vehicle should be in range from 0 to 100. |
| distanceTravelledKm | | The distance travelled by vehicle in kilometers. |
| duration | const Duration(milliseconds: 300) | The duration of animation of needle. |
| speedoMeterColor | Colors.black | The background color of speedometer. |
| speedoMeterBoundaryColor | const Color.fromARGB(255, 117, 117, 117) | The color of boundary of speedometer. |
| speedoMeterNeedleColor | Colors.red | The color of needle of speedometer. |
| distanceScreenBoundaryColor | const Color.fromARGB(255, 117, 117, 117) | The color of boundary of distance displaying screen. |
| distanceScreenColor | const Color.fromARGB(255, 33, 33, 33) | The background color of distance displaying screen. |
| distanceScreenTextColor | const Color.fromARGB(255, 224, 224, 224) | The text color of text on distance displaying screen. |
| fuelMeterBoundaryColor | const Color.fromARGB(255, 117, 117, 117) | The color of boundary of fuel meter. |
| fuelMeterColor | const Color.fromARGB(255, 33, 33, 33) | The background color of fuel meter. |
| fuelMeterNeedleColor | Colors.red | The color of needle of fuel meter. |


### Usage Example

Here is a basic example.
It consists of speedometer widget and a button. On clicking button, the values of speed and fuel change and needle animates from last to new value.

```dart
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
          distanceTravelledKm: _distanceTravelled,
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
```

![Speedometer example](https://github.com/Ahmed-Yasir1147/speedometer_widget/blob/main/assets/images/example.gif?raw=true) 