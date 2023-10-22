import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'mainscreen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App V-1 by Syed Yousuf Hussain ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TitlePage(),
    );
  }
}

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(()=>MainScreen(),transition: Transition.rightToLeftWithFade);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icon/3d-render-smartphone-black-hands-with-finger-removebg-preview.png", width: 980, height: 410),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Vx.blue500,
                foregroundColor: Vx.white, 
                minimumSize: const Size(300, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child:"Let's Set Task".text.extraBold.make(),
              ),
            const SizedBox(height: 210),
            const Text(
              "By Syed Yousuf Hussain",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Vx.blue500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}