import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/size_mg.dart';
import 'package:flutter_task/features/splash_screen/view_model/splash_view_vm.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late SplashViewVM _model;
  var _height = 1.0;
  var _width = 1.0;
  var _textSize = 1.0;
  Color _color = Colors.lightBlue;

  void startApp() {
    _model.initDatabase();
    setState(() {
      _height = 400.0;
      _width = 300.0;
      _textSize = 30;
      _color = Colors.lightBlue.withOpacity(.2);
    });
  }

  @override
  void initState() {
    _model = SplashViewVM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 3),
              curve: Curves.bounceInOut,
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(SizeMg.radius(20),),
              ),
              child: Center(
                  child: Text(
                "HELLO !!!",
                style: TextStyle(
                  fontSize: _textSize,
                ),
              ),
              ),
            ),
            SizedBox(
              height: SizeMg.height(20),
            ),
            ElevatedButton(
              onPressed: startApp,
              child: const Text("Tap to get started"),
            ),
          ],
        ),
      ),
    );
  }
}
