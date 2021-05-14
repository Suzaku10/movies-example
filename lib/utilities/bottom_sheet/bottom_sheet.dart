import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'bottom_sheet_base.dart';

class BottomSheetUtilities extends StatefulWidget {
  @override
  _BottomSheetUtilitiesState createState() => _BottomSheetUtilitiesState();
}

class _BottomSheetUtilitiesState extends State<BottomSheetUtilities> {
  late final BottomSheetHelper sheet;

  @override
  void initState() {
    sheet = BottomSheetHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: Observer(
            builder: (context) => ListView.builder(
              itemCount: sheet.genres.length,
              itemBuilder: (context, index) => CheckboxListTile(
                title: Text(sheet.genres[index]["genre"]),
                value: sheet.genres[index]["status"],
                activeColor: Colors.pink,
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  sheet.setFlag(value!, sheet.genres[index]["id"]);
                },
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () => Navigator.pop(context, sheet.genres),
            child: Center(child: Text("Done")))
      ],
    );
  }
}
