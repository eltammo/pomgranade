import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';
import 'home/home_screen.dart';


class CreateNewCard extends StatefulWidget {
  @override
  _CreateNewCardState createState() => _CreateNewCardState();
}

class _CreateNewCardState extends State<CreateNewCard> {
  final _descriptionController = TextEditingController();
  final _publickeyController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _descriptionFocusNode = FocusNode();
  final _publickeyFocusNode = FocusNode();
  final snackBarText = SnackBar(content: Text('Your new card is saved!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kOnPrimary,
        ),
        title: Text("Create a New Card", style: TextStyle(color: kOnPrimary),),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          ///Adapt text style to theme!
          SizedBox(height: 12),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: _descriptionController.text.isEmpty ? _unfocusedColor : Theme.of(context).primaryColor),
                onPressed: () {
                  _descriptionController.clear();
                  FocusScope.of(context).unfocus();
                },
              ),
              labelText: 'Description',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                  color: _descriptionFocusNode.hasFocus ? Theme.of(context).primaryColor : _unfocusedColor),
            ),
            focusNode: _descriptionFocusNode,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4),
            child: Text("Describe your new card.", style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(height: 12.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: CupertinoPicker(
              backgroundColor: kPrimaryLight,
              itemExtent: 200,
              squeeze: 1.45,
              diameterRatio: 1.07,
              useMagnifier: true,
              magnification: 1,
              onSelectedItemChanged: (int index) {
                print(index);
              },
              children: <Widget>[
                Text("Test Coin"),
                Text("huan soun"),
                Text("otto"),
                Text("schlag dich"),
                Text("kaputt"),
                Text("moruk"),
                Text("oh"),
                Text("sorry"),
                Text("FALLSCHISSALARM!!!"),
                Text("Fallschiss salam aleikum"),
              ]
            ),
          ),
          SizedBox(height: 12.0),
          TextField(
            controller: _publickeyController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Public-Key',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                  color: _publickeyFocusNode.hasFocus ? Theme.of(context).primaryColor : _unfocusedColor),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: _descriptionController.text.isEmpty ? _unfocusedColor : Theme.of(context).primaryColor),
                onPressed: () {
                  _publickeyController.clear();
                },
              ),
              ),
            focusNode: _publickeyFocusNode,
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.qr_code_rounded, size: 40, color: kPrimary,),
            focusColor: kPrimary,
          ),
          IconButton(
            icon: Icon(Icons.paste_rounded, size: 40, color: kPrimary,),
            focusColor: kPrimary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4),
            child: Text("Type in your public key.", style: TextStyle(color: Colors.grey),),
          ),
          SizedBox(height: 30),
          //should be applied from themedata..., dont know why, have to check
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kSecondary),
              foregroundColor: MaterialStateProperty.all(kOnSecondary),
            ),
            child: Text("Create Card"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              ScaffoldMessenger.of(context).showSnackBar(snackBarText);
            },
          ),
        ],
      ),
    );
  }
}
