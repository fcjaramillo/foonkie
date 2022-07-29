
import 'package:flutter/material.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
    double? height,
    double? margin,
    double? width,
    Color? color,
  })  : _height = height,
        _margin = margin,
        _width = width,
        _color = color,
        super(key: key);

  final double? _height;
  final double? _margin;
  final double? _width;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height ?? kDimens01,
      width: _width,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: _margin ?? kDimens0),
        color: _color ?? kBlack100,
      ),
    );
  }
}