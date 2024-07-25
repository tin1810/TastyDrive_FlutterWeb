import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/home/widget/best_in_town.dart';
import 'package:tasty_drive_website/presentation/home/widget/footer_section.dart';
import 'package:tasty_drive_website/presentation/home/widget/header_banner.dart';
import 'package:tasty_drive_website/presentation/home/widget/service_section.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Positioned(
                child: Image.asset("assets/icons/deli_girl.jpg"),
              ),
              const HeaderBannerSection(),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
          ServiceSection(),
          BestInTownSection(),
          const FooterSection(),
        ],
      ),
    );
  }
}

class TitleHeaderWidget extends StatelessWidget {
  const TitleHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fastest Food Ordering Servie \nTo Your Place",
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700),
    );
  }
}
