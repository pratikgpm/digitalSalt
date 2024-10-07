import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:digital_salt/features/controller/filterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../services/filterProduct.dart';
import '../widgets/customSearch.dart';
import '../widgets/filterBottomMenu.dart';
import '../widgets/productCard.dart';

class filterSearchScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => filterSearchScreen(),
      );

  const filterSearchScreen({super.key});

  @override
  State<filterSearchScreen> createState() => _filterSearchState();
}

class _filterSearchState extends State<filterSearchScreen> {
  late FilterProvider filterProvider;
  late filterRepository filterRepo;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    filterProvider = FilterProvider();
    filterProvider.fetchFilterProducts();
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: SizedBox(
                child: Consumer<FilterProvider>(
                builder: (context, val, child) {
                debugPrint(filterProvider.allProducts.length.toString());
                debugPrint(filterProvider.filteredProduct.length.toString());
                return ListView.builder(
                  itemCount: filterProvider.filteredProduct.length,
                  itemBuilder: (context, index) {
                    final product = filterProvider.filteredProduct[index];
                    return filterProvider.isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Pallete.bgBlue,
                          ))
                        : CustomProductCard(
                            brand: product.brand ?? product.category.toString(),
                            title: product.title!,
                            imageUrl: product.imageUrl ?? '',
                            discount: product.discount.toString(),
                            price: product.price.toString(),
                          );
                  },
                );
              },
            ))),
          ],
        ),
      ),
    );
  }
}
