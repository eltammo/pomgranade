import 'package:flutter/material.dart';
import 'package:ppg/models/constants.dart';
import 'package:ppg/models/AddressBundel.dart';
import 'package:ppg/screens/address/address_card_fullscreen.dart';

import '../../../size_config.dart';

class AddressBundelCard extends StatelessWidget {
  final AddressBundel addressBundel;
  final Function press;

  const AddressBundelCard({Key key, this.addressBundel, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddressCardFullscreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: addressBundel.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8), // 18
          //Cannot be used with List
          // boxShadow: BoxShadow(
          //   color: kOnSurface,
          //   offset: Offset(0, 10),
          //     blurRadius: 10,
          // ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), // 20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      addressBundel.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.2, // 22
                          color: Colors.white
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    Text(
                      addressBundel.description,
                      style: TextStyle(color: Colors.white54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    buildInfoRow(
                        defaultSize,
                        iconSrc: "assets/icons/pot.svg",
                        text: "Balance: ${addressBundel.balance }"
                    ),
                    SizedBox(height: defaultSize * 0.5), // 5
                    buildInfoRow(
                        defaultSize,
                        iconSrc: "assets/icons/chef.svg",
                        text: "Price: ${addressBundel.price}"
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultSize * 0.5), // 5
            Padding(
              padding: EdgeInsets.all(defaultSize * 1), // 10
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultSize * 1.8),
                child: Container(
                  // color: Colors.grey, //Just to see the container, can be deactivated.
                  child: AspectRatio(
                    aspectRatio: 1/1.5,
                    // Image of currency
                    child: Image.asset(
                      addressBundel.imageSrc,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: <Widget>[
        // SvgPicture.asset(iconSrc)
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: TextStyle(
              color: Colors.white),
        )
      ],
    );
  }
}