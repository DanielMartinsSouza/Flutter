import 'package:flutter/material.dart';

import '../themes/theme_colors.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      backgroundColor: ThemeColors.backgroundColor,
    );
  }
}
