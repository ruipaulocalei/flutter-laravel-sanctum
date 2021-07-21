import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  CustomTabBar(
      {required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
          border: Border(
              top:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3))),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(e, color: i == selectedIndex ? Theme.of(context).primaryColor: Colors.black45,),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
