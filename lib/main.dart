import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modou Mamoune Diop — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          secondary: AppColors.accent2,
          surface: AppColors.surface,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Syne',
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'DMSans',
            color: AppColors.text,
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class AppColors {
  static const Color bg = Color(0xFF0A0A0C);
  static const Color surface = Color(0xFF111113);
  static const Color card = Color(0xFF161618);
  static const Color border = Color(0xFF252528);
  static const Color accent = Color(0xFF00E5A0);
  static const Color accent2 = Color(0xFF4D6CFF);
  static const Color text = Color(0xFFE4E4EA);
  static const Color muted = Color(0xFF6A6A78);
  static const Color tagBg = Color(0xFF1A1A22);
}
