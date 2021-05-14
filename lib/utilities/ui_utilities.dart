import 'package:flutter/material.dart';

class UIUtilities {
  static Widget buildTextField(
      TextEditingController controller, String? title, String? hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: title,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.always),
      autofocus: false,
    );
  }

  static Widget dialog(BuildContext context,
      {String? title = 'Are You Sure To Delete This one?'}) {
    return AlertDialog(
      title: Text('Alert!'),
      content: Text(title!),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () => Navigator.pop(context, true), child: Text('Yes')),
        ElevatedButton(
            onPressed: () => Navigator.pop(context, false), child: Text('No')),
      ],
    );
  }
}
