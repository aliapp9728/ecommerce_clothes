import 'package:e_commerce_clothing_ui/widgets/layout_builder/layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/sizes/med_qry.dart';
import '../widgets/auto_text_size.dart';

class DetailsClothes extends StatelessWidget {
  const DetailsClothes({super.key});

  @override
  Widget build(BuildContext context) {
    final medQryHieght = medQryHeight(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: medQryHieght * 0.9,
            child: InfoWidget(builder: (context, localSizesStack) {
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/image2.png'),
                      ),
                    ),
                    // child: SvgPicture.asset('asset/mansvg.svg'),
                  ),
                  buildAppBarOfStack(
                      heightStack: localSizesStack.localHeight,
                      widthStack: localSizesStack.localWidth,
                      context: context)
                ],
              );
            }),
          ),
          SizedBox(
            height: medQryHieght * 0.1,
            child: buildBottomScreen(),
          )
        ],
      ),
    );
  }

  buildBottomScreen() {
    return InfoWidget(builder: (context, localSizes) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        // color: Colors.red,
        child: Row(
          children: [
            SizedBox(
              height: localSizes.localHeight * 0.55,
              width: localSizes.localWidth * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AutoTextSizesClass(
                    textAuto: 'Sub total',
                    fonsSizeAuto: 12.0,
                    fontFamilyAuto: 'Inter',
                    stepGranialy: 2,
                    miniFontSize: 8,
                    colorAuto: Color(0xff4F5663),
                    fontWeightAuto: FontWeight.w400,
                  ),
                  Spacer(),
                  AutoTextSizesClass(
                    textAuto: '\$49.99',
                    fonsSizeAuto: 16,
                    stepGranialy: 2,
                    miniFontSize: 10,
                    fontFamilyAuto: 'Popines',
                    fontWeightAuto: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff061023),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AutoTextSizesClass(
                      textAuto: 'Continue',
                      fonsSizeAuto: 16,
                      stepGranialy: 2.0,
                      miniFontSize: 6,
                      colorAuto: Colors.white,
                      fontWeightAuto: FontWeight.w600,
                    ),
                    Icon(
                      Icons.arrow_right_alt_sharp,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  buildAppBarOfStack(
      {required double heightStack,
      required double widthStack,
      required BuildContext context}) {
    return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: heightStack * 0.07,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(),
                Container(
                  height: heightStack / 19,
                  width: widthStack / 10,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 8)
                      ]),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('asset/heart.svg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: heightStack / 19,
                  width: widthStack / 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade200, blurRadius: 5)
                      ]),
                  child: IconButton(
                    icon: SvgPicture.asset('asset/bag22.svg'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
