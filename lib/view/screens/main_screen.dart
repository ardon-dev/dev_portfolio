import 'package:dev_portfolio/view/screens/profile_screen.dart';
import 'package:dev_portfolio/view/screens/projects_screen.dart';
import 'package:dev_portfolio/view/screens/skills_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<String> _titles = ['Perfil', 'Habilidades', 'Proyectos'];
  final List<Widget> _pages = [
    ProfileScreen(),
    SkillsScreen(),
    ProjectsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex]), centerTitle: false),
      body: Row(children: [_navigationRail(isWide), _content()]),
    );
  }

  Expanded _content() => Expanded(child: Center(child: _pages[_selectedIndex]));

  NavigationRail _navigationRail(bool isWide) => NavigationRail(
    elevation: 1,
    selectedIndex: _selectedIndex,
    extended: isWide,
    labelType:
        isWide ? NavigationRailLabelType.none : NavigationRailLabelType.all,
    onDestinationSelected: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    destinations: const [
      // About me
      NavigationRailDestination(
        icon: Icon(Icons.person),
        label: Text('Sobre mí'),
      ),
      // Technology stack
      NavigationRailDestination(
        icon: Icon(Icons.code),
        label: Text('Habilidades'),
      ),
      // Projects
      NavigationRailDestination(
        icon: Icon(Icons.work),
        label: Text('Proyectos'),
      ),
    ],
  );
}
