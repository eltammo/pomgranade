import 'package:flutter/material.dart';
import '../../../models/constants.dart';
import '../../../size_config.dart';

// Our Categories List need StateFullWidget
// I can use Provider on it, then we don't need StateFullWidget

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [ "Favorites ", "Alphabetical", "Currency", "Platform", "Balance"];
  // Be default, first one is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultSize * 1.5 // 15
      ),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5, // 35
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 0);
          },
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultSize * 1, // 10
            vertical: SizeConfig.defaultSize * 0.5 // 5
        ),
        decoration: BoxDecoration(
            color: selectedIndex == index ? Color(0xFFEFF3EE) : Colors.transparent,
            borderRadius: BorderRadius.circular(
                SizeConfig.defaultSize * 2 // 20
            ),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimary : Color(0xFFC2C2B5),
          ),
        ),
      ),
    );
  }
}