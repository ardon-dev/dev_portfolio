import 'package:dev_portfolio/view/screens/main_screen.dart';
import 'package:dev_portfolio/viewmodel/profile_viewmodel.dart';
import 'package:dev_portfolio/viewmodel/projects_viewmodel.dart';
import 'package:dev_portfolio/viewmodel/skills_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
