import 'package:flutter/material.dart';
import 'package:flutter_sanctum/providers/auth.dart';
import 'package:flutter_sanctum/widgets/item_tile.dart';
import 'package:flutter_sanctum/pages/pages.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(
        builder: (context, auth, __) {
          if (auth.authenticated) {
            return ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ListTile(
                  title: Text(
                    '${auth.user!.username}',
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Rooms',
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Provider.of<Auth>(context, listen: false).logout();
                  },
                ),
              ],
            );
          } else
            return ListView(physics: BouncingScrollPhysics(), children: [
              ListTile(
                title: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ]);
        },
      ),
    );
  }
}
