import 'package:flutter/cupertino.dart';

class PublicKeyQRCode extends StatelessWidget {
  const PublicKeyQRCode({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
          '/QR-code_sample.png', //WHY DOES THAT SHIT NOT WORK?
          fit: BoxFit.cover,
      ),
    );
  }
}