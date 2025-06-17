import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/core/constants/screens.dart';
import 'package:nawel/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:nawel/features/auth/presentation/screens/login_screen.dart';
import 'package:nawel/features/auth/presentation/screens/register_screen.dart';
import 'package:nawel/features/onboarding/landing_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/splash_screen.dart';

void main() async {
  GetIt.I.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          kLoginScreen: (context) => BlocProvider(
                create: (context) => AuthBloc(),
                child: LoginScreen(),
              ),
          kRegisterScreen: (context) => BlocProvider(
                create: (context) => AuthBloc(),
                child: RegisterScreen(),
              ),
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
