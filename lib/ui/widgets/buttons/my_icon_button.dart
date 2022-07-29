import 'package:flutter/material.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';

class MyIconButton extends StatefulWidget {
  const MyIconButton({
    Key? key,
    required IconData icon,
    required double dimens,
    VoidCallback? onTap,
  })  : _icon = icon,
        _dimens = dimens,
        _onTap = onTap,
        super(key: key);

  final IconData _icon;
  final double _dimens;
  final VoidCallback? _onTap;

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onTap,
      child: Container(
        width: widget._dimens,
        height: widget._dimens,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kWhite100,
          boxShadow: [
            BoxShadow(
              color: kBlue.withOpacity(kDimens03),
              spreadRadius: kDimens1,
              blurRadius: kDimens2,
              offset: const Offset(kDimens01, kDimens02),
            ),
            const BoxShadow(
              color: kWhite50,
              spreadRadius: kDimens03,
              blurRadius: kDimens1,
              offset: Offset(-kDimens2, -kDimens1),
            ),
          ],
        ),
        child: Icon(
          widget._icon,
          color: kBlue,
        ),
      ),
    );
  }
}