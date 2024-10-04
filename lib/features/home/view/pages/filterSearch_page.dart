import 'package:digital_salt/core/theme/app_pallete.dart';
import 'package:digital_salt/features/controller/filterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/customSearch.dart';
import '../widgets/filterProduct.dart';
import '../widgets/productCard.dart';
class filterSearchScreen extends StatefulWidget {static route()=> MaterialPageRoute(builder: (context) => filterSearchScreen(),);
  const filterSearchScreen({super.key});

  @override
  State<filterSearchScreen> createState() => _filterSearchState();
}

class _filterSearchState extends State<filterSearchScreen> {
  late  FilterProvider filterProvider;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    filterProvider = FilterProvider();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 56,),
            SvgPicture.asset('assets/svg_files/closeEye.svg'),
            const SizedBox(height: 36,),
            CustomSearchField(onChanged: (value) {
            },onFilterPressed: () {
              showFilterBottomSheet(context);
            },),
            const Text("Results",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Pallete.headingFontColr),),
            const SizedBox(height: 5,),
    Expanded(
    child: SizedBox(
    child:ListView.builder(
      itemCount: filterProvider.allProducts.length,
      itemBuilder: (context, index) {
        final product = filterProvider.allProducts[index];
        return CustomProductCard(
          brand: product.brand,
          title: product.title,
          imageUrl: product.imageUrl,
          discount: product.discount.toString(),
          price: product.price.toString(),
        );
    },)
    ),
    )
          ],
        ),
      ),
    );

  }
}
