import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/core/constants/screens.dart';
import 'package:nawel/features/onboarding/landing_screen.dart';

import 'features/splash_screen.dart';

void main() {
  GetIt.I.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nawel',
        routes: {
          kSplashScreen: (context) => const SplashScreen(),
          kLandingScreen: (context) => LandingScreen(),
        },
        initialRoute: kSplashScreen,
      ),
    );
  }
}
