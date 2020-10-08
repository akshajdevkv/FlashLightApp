import 'package:flutter/material.dart';
import 'package:torch_compat/torch_compat.dart';

void main() => runApp(FlashLightApp());

class FlashLightApp extends StatefulWidget {
  @override
  _FlashLightAppState createState() => _FlashLightAppState();
}

class _FlashLightAppState extends State<FlashLightApp> {
  var _flashOn = false;

  _checkFlashlight() {
    setState(() {
      if (_flashOn == false) {
        _flashOn = true;
        TorchCompat.turnOn();
      } else if (_flashOn == true) {
        _flashOn = false;
        TorchCompat.turnOff();
      }
    });
  }

  _displayText() {
    if (_flashOn == false) {
      return Text(
        'Flash is OFF',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      );
    } else if (_flashOn == true) {
      return Text(
        'Flash is ON',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('FlashLight App by Akshaj Dev'),
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: _displayText(),
          ),
          floatingActionButton: _flashOn
              ? FloatingActionButton(
                  onPressed: _checkFlashlight,
                  child: Icon(Icons.flash_on),
                  backgroundColor: Colors.green,
                )
              : FloatingActionButton(
                  onPressed: _checkFlashlight,
                  child: Icon(Icons.flash_off),
                  backgroundColor: Colors.green,
                )),
    );
  }

  @override
  void dispose() {
    // Mandatory for Camera 1 on Android
    TorchCompat.dispose();
    super.dispose();
  }
}
