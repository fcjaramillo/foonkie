import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foonkie_monkey/core/dependencies/device_provider.dart';
import 'package:foonkie_monkey/ui/screen/user_list/users_list_screen.dart';
import 'package:foonkie_monkey/ui/utils/constants/constants.dart';
import 'package:foonkie_monkey/ui/utils/responsive.dart';
import 'package:foonkie_monkey/ui/widgets/buttons/my_icon_button.dart';
import 'package:foonkie_monkey/ui/widgets/buttons/principal_button.dart';
import 'package:foonkie_monkey/ui/widgets/others/detail_card.dart';
import 'package:foonkie_monkey/ui/widgets/others/my_divider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const SizedBox(height: kDimens2100),
              const Header(),
              const Positioned(
                top: kDimens700,
                child: Body(),
              ),
              const Positioned(
                top: kDimens1530,
                child: Footer(),
              ),
              Positioned(
                top: kDimens380,
                left: responsive.wp(kDimens20),
                child: const Image(
                  image: AssetImage(kMonkey1),
                ),
              ),
              const Positioned(
                top: kDimens1506,
                left: -kDimens54,
                child: Image(
                  image: AssetImage(kMonkey2),
                ),
              ),
              Positioned(
                right: kDimens16,
                top: kDimens678,
                child: MyIconButton(
                  icon: Icons.menu,
                  dimens: kDimens63,
                  onTap: () {
                    Navigator.push(context, UsersListScreen.goTo());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends ConsumerWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = Responsive(context);
    return Container(
      color: kLightGreen,
      width: responsive.width,
      height: kDimens700,
      child: Column(
        children: [
          const SizedBox(height: kDimens50),
          const Image(
            image: AssetImage(kPngLogo),
          ),
          const SizedBox(height: kDimens22),
          const MyDivider(
            width: kDimens54,
            height: kDimens03,
            color: kBlack20,
          ),
          const SizedBox(height: kDimens7),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'Experts Samurais\n on Develop Secure app\n with Sensitive data.',
              style: GoogleFonts.dmSerifDisplay(
                  fontWeight: FontWeight.w400,
                  fontSize: kDimens30,
                  color: kBlack100),
            ),
          ),
          const SizedBox(height: kDimens14),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'We are samurais code monkeys that masters the \n most recent data security protocols, encrypted \n methodologies and Blockchain development.',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w300,
                fontSize: kDimens12,
                color: kBlack100,
              ),
            ),
          ),
          const SizedBox(height: kDimens23),
          PrincipalButton(
            title: 'Get in Touch!',
            onPress: () {
              ref.read(emailProvider).sendEmail();
            },
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      color: kPurple,
      width: responsive.width,
      height: kDimens830,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kDimens110),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDimens54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Case studies',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: kDimens18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDimens5),
                  const MyDivider(
                    width: kDimens50,
                    height: kDimens1,
                    color: kWhite100,
                  ),
                  const SizedBox(height: kDimens10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                MyIconButton(icon: Icons.keyboard_arrow_left, dimens: kDimens24),
                DetailCard(),
                MyIconButton(icon: Icons.keyboard_arrow_right, dimens: kDimens24),
              ],
            ),
            const SizedBox(height: kDimens23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const MyDivider(
                      width: kDimens45,
                      height: kDimens03,
                      color: kBlack100,
                    ),
                    Text(
                      'Pfizer',
                      style: GoogleFonts.dmSerifDisplay(
                          fontWeight: FontWeight.w400, fontSize: kDimens14),
                    ),
                  ],
                ),
                Text(
                  'Takeda',
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.w400,
                    fontSize: kDimens14,
                    color: kBlack20,
                  ),
                ),
                Text(
                  'Boston Scientific \n Group',
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.w400,
                    fontSize: kDimens14,
                    color: kBlack20,
                  ),
                ),
                Text(
                  'BSJI',
                  style: GoogleFonts.dmSerifDisplay(
                    fontWeight: FontWeight.w400,
                    fontSize: kDimens14,
                    color: kBlack20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends ConsumerWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = Responsive(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDimens36, vertical: kDimens100),
      color: kBlue,
      width: responsive.width,
      height: kDimens830,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Let's work\n together!",
            style: GoogleFonts.dmSerifDisplay(
                fontWeight: FontWeight.w400,
                fontSize: kDimens24,
                color: kWhite100),
          ),
          const SizedBox(height: kDimens43),
          PrincipalButton(
            title: 'Get in Touch!',
            onPress: () {
              ref.read(emailProvider).sendEmail();
            },
          ),
          const SizedBox(height: kDimens54),
          const MyDivider(
            color: kWhite100,
            width: kDimens50,
            height: kDimens03,
          ),
          const SizedBox(height: kDimens22),
          const Image(image: AssetImage(kPngLogo)),
          const SizedBox(height: kDimens16),
          Text(
            "Bogotá:",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          Text(
            "Calle 106 # 54-15 of. 307/308",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w300,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          Text(
            "Harpenden,UK:",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          Text(
            "Harpenden Hall, Southdown Rd",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w300,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          Text(
            "Miami,USA:",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          Text(
            "990 Biscayne Blvd #501",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w300,
                fontSize: kDimens12,
                color: kWhite100),
          ),
          const SizedBox(height: kDimens20),
          const MyDivider(
            color: kWhite100,
            width: kDimens50,
            height: kDimens03,
          ),
          const SizedBox(height: kDimens20),
          Text(
            "Foonkie Monkey 2021",
            style: GoogleFonts.rubik(
                fontWeight: FontWeight.w300,
                fontSize: kDimens12,
                color: kWhite100),
          ),
        ],
      ),
    );
  }
}


