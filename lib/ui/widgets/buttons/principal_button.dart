import 'package:flutter/material.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincipalButton extends StatelessWidget {
  const PrincipalButton({
    Key? key,
    VoidCallback? onPress,
    required String title,
  })  : _onPress = onPress,
        _title = title,
        super(key: key);

  final VoidCallback? _onPress;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPress,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kWhite100,
          borderRadius: BorderRadius.circular(kDimens20),
          boxShadow: [
            BoxShadow(
              color: kBlue.withOpacity(kDimens03),
              spreadRadius: kDimens1,
              blurRadius: kDimens2,
              offset: const Offset(kDimens01, kDimens02),
            ),
            const BoxShadow(
              color: kWhite50,
              spreadRadius: kDimens01,
              blurRadius: kDimens1,
              offset: Offset(-kDimens3, -kDimens1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kDimens8, horizontal: kDimens12,),
          child: Text(
            _title,
            style: GoogleFonts.dmSerifDisplay(
                fontWeight: FontWeight.w400,
                fontSize: kDimens15,
                color: kBlue),
          ),
        ),
      ),
    );
  }
}
