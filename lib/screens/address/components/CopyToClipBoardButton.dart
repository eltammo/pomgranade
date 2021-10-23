import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppg/models/constants.dart';

class CopyToClipBoardButton extends StatelessWidget {
  const CopyToClipBoardButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints(
        minWidth: 50,
        minHeight: 50,
      ),
      onPressed: () {
        print("copy pressed.");
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Icon(
        Icons.copy,
        size: 24,
        color: kOnPrimary,
      ),
    );
  }
}