import 'package:dev_portfolio/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;
    return Scaffold(body: Row(children: [_navigationRail(isWide), _content()]));
  }

  Expanded _content() => Expanded(child: _pages[_selectedIndex]);

  NavigationRail _navigationRail(bool isWide) => NavigationRail(
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
        label: Text('Tecnologías'),
      ),
      // Projects
      NavigationRailDestination(
        icon: Icon(Icons.work),
        label: Text('Proyectos'),
      ),
    ],
  );
}
