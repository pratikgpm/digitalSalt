import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:digital_salt/features/controller/filterController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../services/filterProduct.dart';
import '../widgets/customSearch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/filterBottomMenu.dart';
import '../widgets/productCard.dart';

class filterSearchScreen extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => filterSearchScreen(),
      );

  const filterSearchScreen({super.key});

 // late filterRepository filterRepo;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final filterProduct = ref.watch(resultProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            SvgPicture.asset('assets/svg_files/closeEye.svg'),
            const SizedBox(
              height: 36,
            ),
            CustomSearchField(
              onChanged: (value) {},
              onFilterPressed: () {
                showFilterBottomSheet(context);
              },
            ),
            const Text(
              "Results",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Pallete.headingFontColr),
            ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 10),
              child:
                  filterProduct.isEmpty ? const Center(
                    child:  Text(
                      "No Results til now ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Pallete.headingFontColr),
                    ),
                  ):
              ListView.builder(
                itemCount: filterProduct.length,
                itemBuilder: (context, index) {
                  final product = filterProduct[index];
                  return CustomProductCard(
                    brand: product.brand.toString().length > 1
                        ? product.brand.toString()
                        : product.category.toString(),
                    title: product.title ?? " ",
                    imageUrl: product.imageUrl ?? " ",
                    discount: product.discount.toString(),
                    price: product.price.toString(),
                  );

                },),
            ),
          )

          ],
        ),
      ),
    );
  }
}
