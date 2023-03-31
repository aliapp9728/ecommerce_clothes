import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoTextSizesClass extends StatelessWidget {
  const AutoTextSizesClass({
    super.key,
    required this.textAuto,
    required this.fonsSizeAuto,
    required this.stepGranialy,
    this.colorAuto,
    required this.miniFontSize,
    this.fontFamilyAuto,
    this.maxLinesAuto,
    this.fontWeightAuto,
    this.wordSpaceAuto,
  });
  final String textAuto;
  final double fonsSizeAuto;
  final double stepGranialy;
  final double miniFontSize;
  final double? wordSpaceAuto;
  final Color? colorAuto;
  final int? maxLinesAuto;
  final String? fontFamilyAuto;
  final FontWeight? fontWeightAuto;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textAuto,
      minFontSize: miniFontSize,
      maxLines: maxLinesAuto,
      overflow: TextOverflow.ellipsis,
      stepGranularity: stepGranialy,
      style: TextStyle(
        fontFamily: fontFamilyAuto,
        fontSize: fonsSizeAuto,
        fontWeight: fontWeightAuto,
        wordSpacing: wordSpaceAuto,
        color: colorAuto,
      ),
    );
  }
}
