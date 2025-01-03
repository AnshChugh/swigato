import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_page/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 250, 250)),
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(),
    );
  }
}
