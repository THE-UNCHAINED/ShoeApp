import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spends_product/controller/home_controller.dart';
import 'package:spends_product/pages/add_product_page.dart';
import 'package:spends_product/pages/home_page.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAZ3jHMQMh-W0Rs6-k7Qh4l3KCVvEWOzNo",
              appId: "1:1049882387049:android:8ae0835d0be1a2eaf8b8f8",
              messagingSenderId: "1049882387049",
              projectId: "basicapp-6c385"),
        )
      : await Firebase.initializeApp();

  Get.put(HomeController()) ;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
    );
  }
}
