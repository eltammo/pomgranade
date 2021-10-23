import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppg/models/AddressBundel.dart';
import 'package:ppg/models/constants.dart';
import 'address_bundel_card.dart';
import 'package:ppg/size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Categories(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Container(
                width: 300,
                child: CupertinoSearchTextField(
                  suffixIcon: Icon(Icons.clear),
                  controller: _textEditingController,
                  padding: EdgeInsets.all(8),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16.0),
              child: IconButton(
                  icon: Icon(Icons.close, color: kPrimary,),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    _textEditingController.clear();
                  }
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 3),
            child: GridView.builder(
              itemCount: addressBundel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: SizeConfig.orientation == Orientation.landscape ? SizeConfig.defaultSize * 2 : 0,
                childAspectRatio: 1.65,
              ),
              ///Try to replace address bundel card gesture detector...
              itemBuilder: (context, index) => AddressBundelCard(
                addressBundel: addressBundel[index],
                // press: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => AddressCardScreen()));
                // },
              )
            ),
          ),
        ),
      ],
    );
  }
}