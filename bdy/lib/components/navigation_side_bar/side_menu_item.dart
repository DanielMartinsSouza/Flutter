import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final Icon icon;
  final Text text;
  final Widget route;
  final bool exit;
  final bool menu;
  const SideMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
    required this.exit,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: text,
      onTap: () {
        if (menu) {
          Navigator.pop(context);
        } else if (exit) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => route,
            ),
          );
        } else {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => route,
            ),
          );
        }
      },
    );
  }
}
