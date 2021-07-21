import 'package:flutter/material.dart';
import 'package:flutter_sanctum/pages/login_page.dart';
import 'package:flutter_sanctum/providers/auth.dart';
import 'package:flutter_sanctum/widgets/app_drawer.dart';
import 'package:flutter_sanctum/widgets/custom_tab_bar.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final List<Widget> _pages = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.favorite,
    Icons.map,
    Icons.person,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authenticated = Provider.of<Auth>(context).authenticated;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
        ),
        drawer: AppDrawer(),
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: authenticated ? CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index)
          ) : Container(),
        ),
      ),
    );
  }
}
