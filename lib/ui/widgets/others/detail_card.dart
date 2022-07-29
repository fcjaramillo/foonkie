import 'package:flutter/widgets.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';
import 'package:foonkie_monkey/ui/widgets/buttons/principal_button.dart';
import 'package:foonkie_monkey/ui/widgets/others/my_divider.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    VoidCallback? onPress,
  })  : _onPress = onPress,
        super(key: key);

  final VoidCallback? _onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightPurple,
        borderRadius: BorderRadius.circular(kDimens20),
        boxShadow: const [
          BoxShadow(
            color: kBlack10,
            spreadRadius: kDimens2,
            blurRadius: kDimens2,
          ),
        ],
      ),
      width: kDimens266,
      child: Column(
        children: [
          Container(
            height: kDimens266,
            width: kDimens266,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage(kPfizerMotion)),
              borderRadius: BorderRadius.circular(kDimens20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDimens20,
              horizontal: kDimens15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Digital Plataform for Pfizer',
                    style: GoogleFonts.dmSerifDisplay(
                        fontWeight: FontWeight.w400,
                        fontSize: kDimens30,
                        color: kBlack100),
                  ),
                ),
                const SizedBox(height: kDimens20),
                const MyDivider(
                  width: kDimens35,
                  height: kDimens03,
                  color: kBlack50,
                ),
                const SizedBox(height: kDimens20),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                        'Give the Hability to the content administrator to create, edit, and delete the desired commercial content in a technological solution, and allow the users to download and work online or offline with the content, were the two main challenges we had.',
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w300,
                        fontSize: kDimens10,
                        color: kBlack100),
                  ),
                ),
                const SizedBox(height: kDimens20),
                PrincipalButton(
                  title: 'View Project',
                  onPress: _onPress,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
