import 'package:e_commerce_clothing_ui/core/model/details_cart_order.dart';
import 'package:e_commerce_clothing_ui/widgets/auto_text_size.dart';
import 'package:e_commerce_clothing_ui/widgets/layout_builder/layout_builder.dart';
import 'package:flutter/material.dart';

import '../core/sizes/med_qry.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBarVariable = AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xff061023),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: const AutoTextSizesClass(
        textAuto: 'Cart',
        fonsSizeAuto: 18,
        stepGranialy: 2,
        miniFontSize: 10,
        fontFamilyAuto: 'Popines',
        colorAuto: Color(0xff061023),
      ),
      centerTitle: true,
      shadowColor: Colors.transparent,
    );

    final mediaQuery = MediaQuery.of(context);
    final medQryHieght = medQryHeight(context) -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        mediaQuery.viewPadding.top -
        mediaQuery.viewPadding.bottom -
        appBarVariable.preferredSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarVariable,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: medQryHieght * 0.77,
              child: builListCardOrderd(context),
            ),
            SizedBox(
              height: medQryHieght * 0.16,
              child: buildBillDetails(context),
            ),
            SizedBox(
              height: medQryHieght * 0.07,
              child: buildBtnCheckOut(context),
            ),
          ],
        ),
      )),
    );
  }

  builListCardOrderd(BuildContext context) {
    List<DetailOrderCart> imageGroups = [
      DetailOrderCart(image: 'asset/shirt.png', sizeShirt: 'L'),
      DetailOrderCart(image: 'asset/black_suit.png', sizeShirt: 'M'),
      DetailOrderCart(image: 'asset/blue_shirt.png', sizeShirt: 'XL'),
      // DetailOrderCart(image: 'asset/blue_shirt.png', sizeShirt: 'XL'),
    ];
    return InfoWidget(builder: (context, localSizes) {
      return ListView.builder(
          itemCount: imageGroups.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              height: localSizes.localHeight * 0.22,
              width: localSizes.localWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.white, blurRadius: 4)
                  ],
                  border: Border.all(color: Colors.grey.shade100, width: 0.3)),
              child: Row(
                children: [
                  Container(
                    height: localSizes.localHeight * 0.20,
                    width: localSizes.localWidth * 0.20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(imageGroups[index].image)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    width: localSizes.localWidth * 0.35,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoTextSizesClass(
                          textAuto: 'Bomber Jackets',
                          fonsSizeAuto: 12,
                          stepGranialy: 2,
                          miniFontSize: 6,
                          fontWeightAuto: FontWeight.w500,
                        ),
                        const AutoTextSizesClass(
                          textAuto: '\$49.99',
                          fonsSizeAuto: 14,
                          stepGranialy: 2,
                          miniFontSize: 10,
                          fontFamilyAuto: 'Popines',
                          fontWeightAuto: FontWeight.w600,
                        ),
                        SizedBox(
                          width: localSizes.localWidth * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: localSizes.localHeight * 0.06,
                                width: localSizes.localWidth * 0.06,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)),
                                child: const Icon(
                                  Icons.add_outlined,
                                  color: Colors.grey,
                                  size: 10,
                                  weight: 10,
                                  // fill: 1,
                                ),
                              ),
                              const Spacer(),
                              const AutoTextSizesClass(
                                textAuto: '1',
                                fonsSizeAuto: 12,
                                stepGranialy: 2,
                                miniFontSize: 8,
                                fontFamilyAuto: 'Popines',
                              ),
                              const Spacer(),
                              Container(
                                height: localSizes.localHeight * 0.06,
                                width: localSizes.localWidth * 0.06,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                  size: 10,
                                  weight: 10,
                                  // fill: 1,
                                ),
                              ),
                              SizedBox(
                                width: localSizes.localWidth * 0.05,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoTextSizesClass(
                        textAuto: imageGroups[index].sizeShirt,
                        fonsSizeAuto: 14,
                        stepGranialy: 2,
                        miniFontSize: 10,
                        fontFamilyAuto: 'Popines',
                        fontWeightAuto: FontWeight.w600,
                      ),
                      const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            );
          });
    });
  }

  buildBillDetails(BuildContext context) {
    return InfoWidget(builder: (ctx, localSizes) {
      return Column(
        children: [
          Row(
            children: const [
              AutoTextSizesClass(
                textAuto: 'Sub total',
                fonsSizeAuto: 14.0,
                fontFamilyAuto: 'Inter',
                stepGranialy: 2,
                miniFontSize: 8,
                colorAuto: Color(0xff4F5663),
                fontWeightAuto: FontWeight.w400,
              ),
              Spacer(),
              AutoTextSizesClass(
                textAuto: '\$49.99',
                fonsSizeAuto: 14,
                stepGranialy: 2,
                miniFontSize: 10,
                fontFamilyAuto: 'Popines',
                fontWeightAuto: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(
            height: localSizes.localHeight * 0.07,
          ),
          Row(
            children: const [
              AutoTextSizesClass(
                textAuto: 'Shipping',
                fonsSizeAuto: 14.0,
                stepGranialy: 2,
                miniFontSize: 8,
                fontFamilyAuto: 'Inter',
                colorAuto: Color(0xff4F5663),
                fontWeightAuto: FontWeight.w400,
              ),
              Spacer(),
              AutoTextSizesClass(
                textAuto: '\$5.00',
                fonsSizeAuto: 14,
                stepGranialy: 2,
                miniFontSize: 10,
                fontFamilyAuto: 'Popines',
                fontWeightAuto: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(
            height: localSizes.localHeight * 0.15,
          ),
          const Spacer(),
          Row(
            children: const [
              AutoTextSizesClass(
                textAuto: 'Total',
                fontFamilyAuto: 'Inter',
                fonsSizeAuto: 14.0,
                stepGranialy: 2,
                miniFontSize: 8,
                colorAuto: Color(0xff4F5663),
                fontWeightAuto: FontWeight.w400,
              ),
              Spacer(),
              AutoTextSizesClass(
                textAuto: '\$44.99',
                fonsSizeAuto: 14,
                stepGranialy: 2,
                miniFontSize: 10,
                fontFamilyAuto: 'Popines',
                fontWeightAuto: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(
            height: localSizes.localHeight * 0.1,
          )
        ],
      );
    });
  }

  buildBtnCheckOut(BuildContext context) {
    return InfoWidget(builder: (ctx, localSiz) {
      return Container(
        // height: 50,
        height: localSiz.localHeight,
        width: localSiz.localWidth * 0.97,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xff061023),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AutoTextSizesClass(
              textAuto: 'Continue',
              colorAuto: Colors.white,
              fonsSizeAuto: 16,
              stepGranialy: 2.0,
              miniFontSize: 6,
              fontWeightAuto: FontWeight.w600,
            ),
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      );
    });
  }
}
