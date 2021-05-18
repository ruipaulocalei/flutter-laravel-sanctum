import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String title;
  final Function click;

  const ItemTile({required this.title, required this.click});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle( fontSize: 18),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: click(),
      ),
    );
  }
}
