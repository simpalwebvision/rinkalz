import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/splash_screen.dart';

Future<void> main() async {
  runApp(const ProviderScope(
    child:
        GetMaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
  ));
}
