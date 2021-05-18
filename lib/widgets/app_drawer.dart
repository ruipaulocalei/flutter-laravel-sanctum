import 'package:flutter/material.dart';
import 'package:flutter_sanctum/widgets/item_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ItemTile(title: 'Rui Paulo Calei', click: (){}),
          ItemTile(
            title: 'Products',
            click: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Container()));
            },
          ),
          ItemTile(
            title: 'Login',
            click: () {},
          ),
        ],
      ),
    );
  }
}
