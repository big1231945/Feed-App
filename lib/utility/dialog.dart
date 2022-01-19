import 'package:feed_app/utility/myStyle.dart';
import 'package:flutter/material.dart';

Future<Null> bigDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: showAppLogo(),
        title: Text(
          title,
        ),
        subtitle: Text(message),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Ok'))
      ],
    ),
  );
}
