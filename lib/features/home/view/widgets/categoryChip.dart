import 'package:digital_salt/features/controller/categoryController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_pallete.dart';

class desi extends ConsumerWidget {
  final List<String> cat;

  const desi(this.cat, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoriesNotifierController =
        ref.read(SelectedCategoriesNotifierProvider);
    return Wrap(
      spacing: 8.0,
      children: cat.map((category) {
        final isselected = ref
            .read(SelectedCategoriesNotifierProvider.notifier)
            .isAvailable(category);
        // final isselected = selectedCategories.contains(category);
        return FilterChip(
          label: Text(
            category,
            style: TextStyle(
                color:
                    isselected ? Pallete.whiteColor : Pallete.headingFontColr),
          ),
          selected: isselected,
          onSelected: (_) {
            isselected
                ? ref
                    .read(SelectedCategoriesNotifierProvider.notifier)
                    .remoreCatefory(category)
                : ref
                    .read(SelectedCategoriesNotifierProvider.notifier)
                    .addCategory(category);
          },
          selectedColor: Pallete.bgBlue,
          backgroundColor: Pallete.whiteColor,
        );
      }).toList(),
    );
  }
}
