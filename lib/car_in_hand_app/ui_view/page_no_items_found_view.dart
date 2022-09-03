import 'package:flutter/material.dart';

class PageNoItemsFoundView extends StatelessWidget {
  const PageNoItemsFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
          child: Text(
        "Não encotramos nenhum item nessa sessão!!!",
        style: TextStyle(fontSize: 15),
      )),
    );
  }
}
