import 'package:flutter/material.dart';

import '../common/color_palette.dart';

class CustomTextTitle extends StatelessWidget {
  final double? fontsize;
  final String? text;
  final Color? color;
  final TextAlign? textAlign;

  // ignore: sort_constructors_first
  const CustomTextTitle({
    Key? key,
    this.text,
    this.textAlign,
    this.fontsize,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.justify,
      //overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color ?? Palette.black,
          fontWeight: FontWeight.bold,
          fontSize: fontsize,
        ),
      ),
    );
  }
}

//Modifible

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textoverflow;
  // ignore: sort_constructors_first
  const CustomText(
      {Key? key,
      this.color,
      this.textAlign,
      this.textoverflow = TextOverflow.visible,
      this.fontSize,
      this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.justify,
      //    overflow: textoverflow,
      text: TextSpan(
        text: text,
        style: TextStyle(color: color ?? Palette.black, fontSize: fontSize),
      ),
    );
  }
}
