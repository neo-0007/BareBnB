import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreSearchbar extends StatelessWidget {
  const ExploreSearchbar({super.key, required this.onTap, this.height = 45});

  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,0,20,0
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(
                  0xFF3B3B3B,
                ).withAlpha(12),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: Color(0xFFDEDEDE),
              width: 0.2,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: BorderRadius.circular(
              999999,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/bnav-explore.svg',
                colorFilter: ColorFilter.mode(
                  Color(0xFF252525),
                  BlendMode.srcIn,
                ),
                height: 15,
                width: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Start your search',
                style: GoogleFonts.nunito(
                  color: Color(0xFF252525),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
