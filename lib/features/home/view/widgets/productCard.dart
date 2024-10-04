import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_pallete.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final String price;
  final String discount;

  const CustomProductCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.discount,
      required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 98,
        padding: EdgeInsets.symmetric(horizontal:14),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Pallete.whiteColor,
          boxShadow: [
            BoxShadow(
                color: Pallete.formFieldGrey.withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 0.5,
                offset: const Offset(0, 5))
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 68,
                width: 68,
                child: Image.network(imageUrl),
                decoration: BoxDecoration(
                    color: Pallete.bggrey,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(width: 35,),
              Expanded(
                child: SizedBox(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Pallete.headingFontColr),
                        ),
                        Text(
                          brand,
                          style: TextStyle(
                              color: Pallete.formFieldGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text('\$${price}', style: TextStyle(
                                color: Pallete.bgBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),),
                            SizedBox(width: 6,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFFEBF0)
                              ),
                              child: Text('${discount}% off',style:TextStyle(
                                  color: Pallete.orange,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
    ;
  }
}
