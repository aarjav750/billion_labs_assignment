import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget(this.title, this.data, {super.key});

  final String title;
  final Iterable data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: const TextStyle(
        color: Colors.amber,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...data],
      ),
      subtitleTextStyle: const TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    );
  }
}
