
import 'package:flutter/material.dart';

const Color kColorPrimary = Color(0xFFEF233C);
const Color kColorPrimaryDark = Color(0xFFB31A2D);

const Color kColorFocus = Color(0xFFD72036);

const Color kColorBack = Color(0xFF131518);
const Color kColorBackDark = Color(0xFF171A1D);

const Color kColorCardLight = Color(0xFF272B30);
const Color kColorCardDark = Color(0xFF1D2024);
const Color kColorCardDarkness = Color(0xFF131518);


const Color kColorHint = Color(0xFF555866);
const Color kColorHintGrey = Color(0xFFC40C0C);
const Color kColorFontLight = Color(0xFFFFFFFF);

BoxDecoration kDecorBackground = const BoxDecoration(
  gradient: LinearGradient(
    colors: [kColorBackDark, kColorBack],
  ),
);

BoxDecoration kDecorIconCircle = const BoxDecoration(
  shape: BoxShape.circle,
  gradient: LinearGradient(
    colors: [kColorPrimaryDark, kColorPrimary],
  ),
);
