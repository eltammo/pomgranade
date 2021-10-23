import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ppg/models/constants.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    Key key,
  }) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
      print("FavoriteWidget pressed.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            iconSize: 35,
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: _isFavorited ? Icon(Icons.star_rounded) : Icon(Icons.star_outline_rounded),
            color: kOnPrimary,
            onPressed: _toggleFavorite,
          ),
        )
      ],
    );
  }
}