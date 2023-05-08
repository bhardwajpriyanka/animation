import 'package:animation/screen/animation/view/animation_screen.dart';
import 'package:animation/screen/animation/view/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => homeScreen(),
        ),
        GetPage(
          name: '/detail',
          page: () => Details(),
        ),
      ],
    ),
  );
}
