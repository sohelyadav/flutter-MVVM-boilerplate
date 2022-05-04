import 'package:flutter/material.dart';

//main colors
const Color kPrimaryColor = const Color(0xFF28D8A1);
const Color kSecondaryColor = const Color(0xFF41991F);

const kPrimaryDarkColor = const Color(0xFF00A572);
const kPrimaryTrasparent = const Color(0xFF28d8a148);

const kPrimaryLightColor = const Color(0xFF6EFFD2);

const kScaffoldColor = Color.fromRGBO(246, 245, 251, 1);
const kGreen = Color(0xFF46D57B);
const kGrey = const Color(0xFFEBEBEB);
const kDarkGrey = const Color(0xFF5D5C5C);

const kInfoColor = const Color(0xFF2196F3);

//snackbar color
const kSuccessColor = const Color(0xFF2f6131);
const kErrorColor = const Color(0xFFAF1313);
const kWarningColor = const Color(0xFFFFC107);

//common color
const kWhite = Colors.white;
const kBlack = Colors.black;


const kDividerColor = const Color(0xFF6d6f72);

const kLinearGradient = const LinearGradient(
  colors: const [kPrimaryDarkColor, kPrimaryLightColor],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const kWhiteButtonGradient = const LinearGradient(
  colors: const [kWhite, kWhite],
  stops: const [0.0, 1.0],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kBoxShadow = [BoxShadow(color: kGrey, blurRadius: 10, spreadRadius: 5)];
