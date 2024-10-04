import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryToggleButtons extends StatefulWidget {
  final List<String> categories;
  final Function(List<String>) onSelectedCategoriesChanged;

  CategoryToggleButtons({
    required this.categories,
    required this.onSelectedCategoriesChanged,
  });

  @override
  _CategoryToggleButtonsState createState() => _CategoryToggleButtonsState();
}

class _CategoryToggleButtonsState extends State<CategoryToggleButtons> {
  List<bool> _selected = [];

  @override
  void initState() {
    super.initState();
    _selected = List.generate(widget.categories.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(fillColor: Pallete.bgBlue,
      textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),
      renderBorder: false,
      selectedColor: Pallete.whiteColor,
      children: widget.categories
          .map((category) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10
        ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15),),
                child: Center(child: Text(category)),
              ))
          .toList(),
      isSelected: _selected,
      color:  Pallete.bgBlue,
      onPressed: (int index) {
        setState(() {
          _selected[index] = !_selected[index];
        });
        widget.onSelectedCategoriesChanged(
          List<String>.generate(
            widget.categories.length,
            (int i) => _selected[i] ? widget.categories[i] : '',
          ).where((category) => category.isNotEmpty).toList(),
        );
      },
    );
  }
}
