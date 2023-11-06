import 'package:bdy/data/category_dao.dart';
import 'package:flutter/material.dart';

import '../confirmation_dialog.dart';
import 'box_card.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: BoxCard(
        boxContent: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              category,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
                onPressed: () {
                  showConfirmationDialog(
                    context,
                    title: "Deseja realmente excluir?",
                  ).then((value) async {
                    if (value) {
                      CategoryDao().delete(category);
                    }
                  });
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
