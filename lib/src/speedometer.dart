import 'package:flutter/material.dart';
import 'package:speedometer_widget/src/constants.dart';
import 'package:speedometer_widget/src/speedometer_painter.dart';

class Speedometer extends StatefulWidget {
  final double height;
  final double width;
  final double speedKmh;
  final Duration duration;
  final double fuelPercent;
  final int distanceTravelledKm;
  final Color speedoMeterBoundaryColor;
  final Color speedoMeterColor;
  final Color speedoMeterNeedleColor;
  final Color fuelMeterBoundaryColor;
  final Color fuelMeterColor;
  final Color fuelMeterNeedleColor;
  final Color distanceScreenBoundaryColor;
  final Color distanceScreenColor;
  final Color distanceScreenTextColor;

  const Speedometer({
    super.key,
    required this.speedKmh,
    required this.fuelPercent,
    required this.distanceTravelledKm,
    this.height = 300,
    this.width = 300,
    this.duration = const Duration(milliseconds: 300),
    this.speedoMeterColor = Colors.black,
    this.speedoMeterBoundaryColor = const Color.fromARGB(255, 117, 117, 117),
    this.speedoMeterNeedleColor = Colors.red,
    this.distanceScreenBoundaryColor = const Color.fromARGB(255, 117, 117, 117),
    this.distanceScreenColor = const Color.fromARGB(255, 33, 33, 33),
    this.distanceScreenTextColor = const Color.fromARGB(255, 224, 224, 224),
    this.fuelMeterBoundaryColor = const Color.fromARGB(255, 117, 117, 117),
    this.fuelMeterColor = const Color.fromARGB(255, 33, 33, 33),
    this.fuelMeterNeedleColor = Colors.red,
  });

  @override
  State<StatefulWidget> createState() {
    return SpeedometerState();
  }
}

class SpeedometerState extends State<Speedometer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation _speedoMeterNeedleAnimation;
  late Animation _fuelMeterNeedleAnimation;
  double _currentValueSpeedoMeterAnimation = 0.0;
  double _currentValueFuelMeterAnimation = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {
              _currentValueSpeedoMeterAnimation =
                  _speedoMeterNeedleAnimation.value;
              _currentValueFuelMeterAnimation = _fuelMeterNeedleAnimation.value;
            });
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double speed;
    if (widget.speedKmh > Constants.maxSpeedKmh) {
      speed = Constants.maxSpeedKmh;
    } else if (widget.speedKmh < Constants.minSpeedKmh) {
      speed = Constants.minSpeedKmh;
    } else {
      speed = widget.speedKmh;
    }
    _speedoMeterNeedleAnimation = Tween(
      begin: _currentValueSpeedoMeterAnimation,
      end: convertSpeedToAngle(speed),
    ).animate(_animationController);

    double fuel;
    if (widget.fuelPercent > Constants.maxFuelPercent) {
      fuel = Constants.maxFuelPercent;
    } else if (widget.fuelPercent < Constants.minFuelPercent) {
      fuel = 0;
    } else {
      fuel = widget.fuelPercent;
    }
    _fuelMeterNeedleAnimation = Tween(
      begin: _currentValueFuelMeterAnimation,
      end: convertFuelToAngle(fuel),
    ).animate(_animationController);

    _animationController.forward(from: 0);

    return CustomPaint(
      size: Size(widget.width, widget.height),
      painter: SpeedometerPainter(
        angleSpeedoMeterNeedle: _speedoMeterNeedleAnimation.value,
        angleFuelMeterNeedle: _fuelMeterNeedleAnimation.value,
        distanceTravelledKm: widget.distanceTravelledKm,
        distanceScreenBoundaryColor: widget.distanceScreenBoundaryColor,
        distanceScreenColor: widget.distanceScreenColor,
        distanceScreenTextColor: widget.distanceScreenTextColor,
        fuelMeterBoundaryColor: widget.fuelMeterBoundaryColor,
        fuelMeterColor: widget.fuelMeterColor,
        fuelMeterNeedleColor: widget.fuelMeterNeedleColor,
        speedoMeterBoundaryColor: widget.speedoMeterBoundaryColor,
        speedoMeterColor: widget.speedoMeterColor,
        speedoMeterNeedleColor: widget.speedoMeterNeedleColor,
      ),
    );
  }
}

double convertSpeedToAngle(double speed) {
  return speed * Constants.speedToAngleRatio;
}

double convertFuelToAngle(double fuel) {
  return fuel * Constants.fuelToAngleRatio;
}
