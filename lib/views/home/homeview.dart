import 'package:flutter/material.dart';
import 'package:quiz_app/views/home/homewidget/homewidget.dart';
import 'package:quiz_app/widgets/backgroundvideo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Padding(
          padding: EdgeInsets.all(0.1),
          child: BackgroundVideo(),
        ),
        Homewidget()
      ]),
    );
  }
}
