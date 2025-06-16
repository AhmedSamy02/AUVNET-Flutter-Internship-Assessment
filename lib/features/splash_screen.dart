import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nawel/core/constants/assets.dart';
import 'package:nawel/core/constants/screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      final isLogged =
          await GetIt.I.get<FlutterSecureStorage>().containsKey(key: 'token');
      if (isLogged) {
        Navigator.pushReplacementNamed(context, kHomeScreen);
        return;
      } else {
        Navigator.pushReplacementNamed(context, kLandingScreen);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        kLogo,
        width: 200.w,
        height: 200.h,
        fit: BoxFit.cover,
      ).animate().blur(
                  duration: 1.seconds,
                  begin: const Offset(30, 30),
                  end: const Offset(0, 0))
          ),
    );
  }
}
