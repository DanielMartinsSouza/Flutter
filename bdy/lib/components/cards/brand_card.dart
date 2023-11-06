import 'package:bdy/components/confirmation_dialog.dart';
import 'package:bdy/data/brand_dao.dart';
import 'package:flutter/material.dart';

import 'box_card.dart';

class BrandCard extends StatelessWidget {
  final String name;

  BrandCard(this.name, {super.key});

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
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            IconButton(
                onPressed: () {
                  showConfirmationDialog(
                    context,
                    title: "Deseja realmente excluir?",
                  ).then((value) async {
                    if (value) {
                      BrandDao().delete(name);
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
