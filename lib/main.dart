import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/screens.dart';
import 'package:nawel/features/auth/presentation/screens/login_screen.dart';
import 'package:nawel/features/auth/presentation/screens/register_screen.dart';
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
          kLoginScreen: (context) => LoginScreen(),
          kRegisterScreen: (context) => RegisterScreen(),
        },
        initialRoute: kLoginScreen,
        theme: ThemeData(
            textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        )),
      ),
    );
  }
}
