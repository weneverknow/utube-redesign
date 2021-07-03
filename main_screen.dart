import 'package:flutter/material.dart';
import 'package:you_tube/components/bottom_nav.dart';
import 'package:you_tube/pages/history_page.dart';
import 'package:you_tube/pages/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_tube/pages/my_channel_page.dart';
import 'package:you_tube/pages/showing_video.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(), //HomePage(),
      bottomNavigationBar: BottomNav(),
    );
  }
}
