import 'package:e_commerce_clothing_ui/core/sizes/intro_screen.dart';
import 'package:e_commerce_clothing_ui/core/sizes/med_qry.dart';
import 'package:e_commerce_clothing_ui/screens/home_screen.dart';
import 'package:e_commerce_clothing_ui/widgets/auto_text_size.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer(
      {super.key, required this.controller, required this.showColor});
  final PageController controller;
  final bool showColor;

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      width: double.infinity,
      height: medQryHeight(context) * IntroScreenSizes.bottomContainerHeight,
      decoration: BoxDecoration(
        // color: Color(1F2839)
        // color: Colors.black87.withOpacity(0.4),
        // color: Color.fromARGB(25, 32, 46, 255),
        color: widget.showColor
            ? const Color.fromARGB(192, 2, 28, 46)
            :
            // color: Color.fromARGB(255, 29, 51, 66),
            const Color.fromARGB(255, 12, 36, 53),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: widget.controller,
            count: 2,
            effect: const ScaleEffect(
                activeDotColor: Colors.white,
                activeStrokeWidth: 1.5,
                dotColor: Colors.grey,
                dotHeight: 10.0,
                dotWidth: 10.0,
                strokeWidth: 1.5),
          ),
          buildContinueBtn()
        ],
      ),
    );
  }

  Widget buildContinueBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const HomeScreen();
            },
          ),
        );
      },
      child: Container(
        height: 50,
        width: 130,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AutoTextSizesClass(
              textAuto: 'Continue',
              fonsSizeAuto: 16,
              stepGranialy: 2.0,
              miniFontSize: 6,
              fontWeightAuto: FontWeight.w600,
            ),
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
