import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/constants.dart';

class PublicKeyTextBox extends StatelessWidget {
  const PublicKeyTextBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 80,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: kSurfaceWhite.withOpacity(0.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "k23j4kl23j52kl345h23kl45h23kl45h23lk45hl234k5hl23k45h23kl45h23kl4523kl45h23k4j5h23kl45l23k4h23lkj23kl45h23l4k2l3kj5l234k234kl",
          style: TextStyle(color: kOnSurface,),
        ),
      ),
    );
  }
}