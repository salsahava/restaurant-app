import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultPadding = 20.0;
const cream = Color(0xFFF5F5F5);
const darkBlueGrey = Color(0xFF403B58);
const lightGrey = Color(0xFFE6E6E6);

final TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.poppins(
      fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.poppins(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.poppins(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.poppins(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.josefinSans(
      fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.josefinSans(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.josefinSans(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.josefinSans(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.josefinSans(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);