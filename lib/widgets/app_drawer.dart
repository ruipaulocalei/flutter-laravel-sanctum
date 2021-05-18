import 'package:flutter/material.dart';
import 'package:flutter_sanctum/widgets/item_tile.dart';
import 'package:flutter_sanctum/pages/pages.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            title: Text(
              'Rui Paulo Calei',
              style: TextStyle(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ListTile(
            title: Text(
              'Login',
              style: TextStyle(fontSize: 18),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
