import 'package:flutter/material.dart';

final primaryColor = Color(0xFF0C2B7E);
final greyColor = Color(0xFF9AA2AC);
final darkGreyColor = Color(0xFF33465A);

final h1TextStyle = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontSize: 50.0,
  color: primaryColor,
  letterSpacing: -1.5,
);

final ih1TextStyle = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontSize: 50.0,
  color: Colors.white,
  letterSpacing: -1.5,
);

final h3TextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w200,
  fontSize: 20.0,
  color: primaryColor.withAlpha(255 ~/ 1.3),
);

final ih3TextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w200,
  fontSize: 20.0,
  color: Colors.white.withAlpha(255 ~/ 1.8),
);

final h6TextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  letterSpacing: 2.4,
  fontSize: 14,
  color: primaryColor,
);

final ih6TextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  letterSpacing: 2.4,
  fontSize: 14,
  color: Colors.white,
);

final bTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: primaryColor,
);

final pTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 12,
  letterSpacing: 1.1,
  color: greyColor,
);

final pEmphTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 12,
  color: darkGreyColor,
  letterSpacing: 1.2,
);

final sidebarItemTextStyle = TextStyle(
  fontFamily: 'PlayfairDisplay',
  fontSize: 24.0,
  color: Colors.white,
  letterSpacing: -1,
);

final navigationItemTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 12.0,
  color: Colors.black54,
);

final overEasyBorderRadius = BorderRadius.circular(20);