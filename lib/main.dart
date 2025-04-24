import 'package:dev_portfolio/view/screens/main_screen.dart';
import 'package:dev_portfolio/viewmodel/profile_viewmodel.dart';
import 'package:dev_portfolio/viewmodel/projects_viewmodel.dart';
import 'package:dev_portfolio/viewmodel/skills_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileViewmodel()),
        ChangeNotifierProvider(create: (_) => SkillsViewmodel()),
        ChangeNotifierProvider(create: (_) => ProjectsViewmodel()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            brightness: Brightness.dark,
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: const MainScreen(),
      ),
    );
  }
}

extension ContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

void launchURL(String stringUrl) async {
  final url = Uri.parse(stringUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.platformDefault);
  } else {
    throw 'No se pudo abrir $url';
  }
}

void sendEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=&body=',
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'No se pudo abrir el cliente de correo';
  }
}
