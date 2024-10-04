// filter_bottom_sheet.dart
import 'package:digital_salt/core/widget/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../controller/filterController.dart';
import 'categoryToggleButtons.dart';
import 'customRangeSlider.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<bool> _sizeSelections = [false, false, false];
  List<bool> _stateSelections = [false, false, false, false, false];
  List<String> _selectedCategories = [];
  List<String> _selectedBrands = [];
  RangeValues _selectedRange = RangeValues(20, 80);
  late FilterProvider filterProvider;

  void _onRangeChanged(RangeValues values) {
    setState(() {
      _selectedRange = values;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterProvider = FilterProvider();
    filterProvider.fetchAllProducts(_selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/svg_files/crossBold.svg')),
          const Center(
            child: Text(
              "Search Filter",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Pallete.headingFontColr),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Categories",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Pallete.headingFontColr),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: CategoryToggleButtons(
              categories: [
                "Beauty",
                "fragrances",
                "furniture",
                "groceries",
                "home-decoration",
                "kitchen-accessories"
              ],
              onSelectedCategoriesChanged: (selectedCategories) {
                _selectedCategories = selectedCategories;
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(height: 20),
          const Text(
            'Price',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Pallete.headingFontColr),
          ),
          RangeSliderWithLabels(
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: _onRangeChanged,
          ),
          const SizedBox(height: 20),
          const Text(
            'Brands',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          CategoryToggleButtons(
            categories: ["first", "second", "third"],
            onSelectedCategoriesChanged: (selectedCategories) {
              _selectedBrands = selectedCategories;
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: customButton(
                  isInverse: true,
                  title: "Clear",
                  onPressed: () {
                    setState(() {
                      _sizeSelections = [false, false, false];
                      _stateSelections = [false, false, false, false, false];
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                width: 9.75,
              ),
              Expanded(
                flex: 7,
                child: customButton(
                  title: "Apply",
                  onPressed: () {
                    filterProvider.fetchAllProducts(_selectedCategories);
                    // Apply filter logic here
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isDismissible: false,
    backgroundColor: Pallete.whiteColor,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return FilterBottomSheet();
    },
  );
}
