import 'package:flutter/material.dart';
import 'progress_custom.dart';
import 'dart:async';

class ProgressView extends StatefulWidget {
  const ProgressView({Key? key}) : super(key: key);

    @override
  State<StatefulWidget> createState() => _ProgressViewState();
}
late Timer _timer;
var porcentaje =0;
class _ProgressViewState extends State<ProgressView>{
  @override
  void initState() {
    timer();
    super.initState();
  }

  void timer() {
    Duration duration = const Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (timer) {
      if (porcentaje == 100) {
        setState(() {
          timer.cancel();
          porcentaje = 100;
        });
      } else {
        setState(() {
          porcentaje++;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: CustomPaint(painter: ProgressCustom(porcentaje)),
        ),
      )

    );
  }

}
