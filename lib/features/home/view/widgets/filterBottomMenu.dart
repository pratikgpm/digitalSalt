// filter_bottom_sheet.dart
import 'package:digital_salt/core/widget/customButton.dart';
import 'package:digital_salt/features/controller/categoryController.dart';
import 'package:digital_salt/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../services/filterProduct.dart';
import 'categoryChip.dart';
import 'customRangeSlider.dart';

class FilterBottomSheet extends ConsumerStatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {
  RangeValues _selectedRange = RangeValues(20, 80);
  List<String> _categories = [
    "beauty",
    "fragrances",
    "furniture",
    "groceries",
    "home-decoration",
    "kitchen-accessories"
  ];

  void _onRangeChanged(RangeValues values) {
    setState(() {
      _selectedRange = values;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategories = ref.watch(SelectedCategoriesNotifierProvider);
    //initially empty will contain result
    final filterProduct = ref.watch(resultProvider);
    final myList = ref.watch(SelectedCategoriesNotifierProvider);
    //contain all product
    final allData = ref.watch(AllProductProvider);
    return Container(
      constraints: BoxConstraints(maxHeight: 500),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
            height: 10,
          ),
          const Text(
            "Categories",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Pallete.headingFontColr),
          ),
          desi(_categories),

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
          // const Spacer(),
          const Text(
            'The button will appear here shortly',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: customButton(
                  isInverse: true,
                  title: "Clear",
                  onPressed: () {
                    ref.invalidate(SelectedCategoriesNotifierProvider);
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
                    ref.invalidate(resultProvider);
                    allData.when(
                      data: (data) {
                        List<Product> my = data
                            .where((element) => ref
                                .read(SelectedCategoriesNotifierProvider)
                                .contains(element.category))
                            .toList();
                        ref.read(resultProvider.notifier).upDate(my);
                      },
                      error: (error, stackTrace) => Text("error coccut"),
                      loading: () => null,
                    );
                    print(selectedCategories.length.toString());
                    Navigator.pop(context);
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
