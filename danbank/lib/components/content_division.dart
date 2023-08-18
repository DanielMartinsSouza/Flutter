import 'package:flutter/material.dart';

import '../themes/theme_colors.dart';

class ContentDivision extends StatelessWidget {
  const ContentDivision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.division),
      ),
      height: 1,
    );
  }
}
