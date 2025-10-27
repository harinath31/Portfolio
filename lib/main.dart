import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constant.dart';
import 'package:portfolio/constants/constant.dart';
import 'package:portfolio/screens/homes_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harinath G - Portfolio',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          // Applies Inter to all text styles
          ThemeData.light().textTheme,
        ),
        // latoTextTheme(  // Applies Lato to all text styles
        //   ThemeData.dark().textTheme,
        // ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppConstant().themeColor,
        ), // Teal accent
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
      ),
      home: SelectionArea(child: const HomeScreen()),
    );
  }
}

// Utility to launch URLs
Future<void> launchURL(String url, String name) async {
  final Uri uri = name == 'gmail'
      ? Uri(scheme: 'mailto', path: Constants().userProfile.email)
      : Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $url');
  }
}
