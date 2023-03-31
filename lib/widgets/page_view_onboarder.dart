import 'package:e_commerce_clothing_ui/core/sizes/intro_screen.dart';
import 'package:e_commerce_clothing_ui/core/sizes/med_qry.dart';
import 'package:e_commerce_clothing_ui/widgets/auto_text_size.dart';
import 'package:flutter/material.dart';

class OnBoarderPage extends StatefulWidget {
  const OnBoarderPage(
      {super.key,
      required this.image,
      required this.textTitle,
      required this.textSubTitle,
      required this.showShader});
  final String image;
  final String textTitle;
  final String textSubTitle;
  final bool showShader;

  @override
  State<OnBoarderPage> createState() => _OnBoarderPageState();
}

class _OnBoarderPageState extends State<OnBoarderPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.showShader
            ? ShaderMask(
                blendMode: BlendMode.dstOut,
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.9),
                      Colors.black,
                    ],
                  ).createShader(rect);
                },
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    )),
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                )),
        Positioned(
          bottom:
              medQryHeight(context) * IntroScreenSizes.textBoxPositionBottom,
          left: medQryWidth(context) * IntroScreenSizes.textBoxPositionLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 14),
                  height:
                      medQryHeight(context) * IntroScreenSizes.mainTitleHeight,
                  width: medQryWidth(context) * IntroScreenSizes.mainTitleWidth,
                  child: AutoTextSizesClass(
                    textAuto: widget.textTitle,
                    fonsSizeAuto: 28.0,
                    stepGranialy: 4.0,
                    miniFontSize: 12,
                    colorAuto: Colors.white,
                    fontFamilyAuto: 'Zen',
                    maxLinesAuto: 2,
                    wordSpaceAuto: 5,
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 13),
                  height:
                      medQryHeight(context) * IntroScreenSizes.subTitleeHeight,
                  width: medQryWidth(context) * IntroScreenSizes.subTitleeWidth,
                  child: AutoTextSizesClass(
                    textAuto: widget.textSubTitle,
                    fonsSizeAuto: 11.5,
                    stepGranialy: 0.5,
                    miniFontSize: 5,
                    colorAuto: Colors.white,
                    maxLinesAuto: 2,
                    fontFamilyAuto: 'Grotks',
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
