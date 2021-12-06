import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;


Color primaryColor = Color(0xff00A9B6);
Color secondaryColor = Color(0xffFFD039);
Color alertColor = Color(0xffED6363);
Color backgroundColor1 = Color(0xffFFFFFF);
Color backgroundColor2 = Color(0xffF2FBFA);

Color primaryTextColor = Color(0xff090909);
Color secondaryTextColor = Color(0xff898989);
Color thirdTextColor = Color(0xffFFFFFF);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: thirdTextColor,
);

TextStyle blueTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w800;