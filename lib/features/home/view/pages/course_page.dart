import 'package:digital_salt/features/controller/pegination_controller.dart';
import 'package:digital_salt/features/home/view/pages/filterSearch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/app_pallete.dart';
import '../../../services/product_api.dart';
import '../../model/product_model.dart';
import '../widgets/customSearch.dart';
import '../widgets/productCard.dart';
import '../widgets/toggleButton.dart';

class courseScreen extends StatefulWidget {
  static router() => MaterialPageRoute(
        builder: (context) => const courseScreen(),
      );

  const courseScreen({super.key});

  @override
  State<courseScreen> createState() => _courseScreenState();
}

class _courseScreenState extends State<courseScreen> {
  late Future<List<Product>> futureProducts;
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    // Specify the categories you want to filter
    futureProducts =
        fetchFilteredProducts(['mens-shirts', 'mens-shoes', 'beauty']);
    productProvider = ProductProvider();
    productProvider.fetchAllProducts();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
    productProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 61,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Course",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SvgPicture.asset(
                'assets/svg_files/ProfileAvatarMale.svg',
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          SizedBox(
              height: 48,
              child: CustomSearchField(
                hintText: "Find Course",
                onSearchBarHit: () {
                Navigator.push(context, filterSearchScreen.route());
                },
                onChanged: (value) {
                  //when user enter the value
                },
                onFilterPressed: () {

                  //this is can triger filterBottomScreen Appear
                 // showFilterBottomSheet(context);
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.transparent,
                height: 118,
                width: 170,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 77.46,
                          decoration: BoxDecoration(
                              color: Pallete.cardBlueBg,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0.0,
                        child: SvgPicture.asset(
                          'assets/svg_files/musicAvatar.svg',
                          height: 115,
                        )),
                    Positioned(
                      right: 0,
                      bottom: 8.2,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 6, top: 3, bottom: 3, right: 2),
                        decoration: const BoxDecoration(
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Text(
                          "Languege",
                          style: TextStyle(
                              color: Pallete.bgBlue,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 118,
                width: 170,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 77.46,
                          decoration: BoxDecoration(
                              color: Pallete.fadePinkBannerBg,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                    Positioned(
                        bottom: 0.0,
                        child: SvgPicture.asset(
                          'assets/svg_files/drawing Avatar.svg',
                          height: 115,
                        )),
                    Positioned(
                      right: 0,
                      bottom: 8.2,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 6, top: 3, bottom: 3, right: 2),
                        decoration: const BoxDecoration(
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Text(
                          "Painting",
                          style: TextStyle(
                              color: Pallete.lightpurple,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          const Text(
            "Choice your course",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Pallete.headingFontColr),
          ),
          const SizedBox(
            height: 13,
          ),
          SizedBox(
            width: 253,
            child: CustomToggleButtons(
              buttonLabels: ['All', 'Popular', 'New'],
              onToggle: (index) {
                // Handle the toggle action here
                print("Button $index pressed");
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: SizedBox(
              child: ChangeNotifierProvider(
                create: (context) => productProvider..fetchAllProducts(),
                child: Consumer<ProductProvider>(
                  builder: (context, provider, child) {
                    return NotificationListener(
                        onNotification: (ScrollNotification scrolInfo) {
                          if (scrolInfo.metrics.pixels ==
                                  scrolInfo.metrics.maxScrollExtent &&
                              !productProvider.isLoading) {
                            productProvider.fetchAllProducts();
                          }
                          return false;
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: provider.allProducts.length +
                              (productProvider.hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == productProvider.allProducts.length) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Pallete.regFontColr.withOpacity(0.5),
                              ));
                            }
                            final product = provider.allProducts[index];
                            return CustomProductCard(
                              brand: product.brand,
                              title: product.title,
                              imageUrl: product.imageUrl,
                              discount: product.discount.toString(),
                              price: product.price.toString(),
                            );
                          },
                        ));
                  },
                ),
              ),
              // child: FutureBuilder<List<Product>>(
              //   future: futureProducts,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return Center(child: Text('Error: ${snapshot.error}'));
              //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //       return Center(child: Text('No products found'));
              //     } else {
              //       return ListView.builder(
              //         itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           Product product = snapshot.data![index];
              //           return CustomProductCard(
              //             brand: product.brand,
              //             title: product.title,
              //             imageUrl: product.imageUrl,
              //             discount: product.discount.toString(),
              //             price: product.price.toString(),
              //           );
              //         },
              //       );
              //     }
              //   },
              // ),
            ),
          )
        ],
      ),
    ));
    ;
  }
}
