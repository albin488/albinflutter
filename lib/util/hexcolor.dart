import 'package:flutter/material.dart';

const primaryIndigo200=const Color(0xFF9FA8DA);
const primaryIndigoLight=const Color(0xFFd1d9ff);
const primaryIndigoDark=const Color(0xff6f79a8);

const secondaryDeepPurple=const Color(0xff673ab7);
const secondaryPurpleLight=const Color(0xff9a67ea);
const secondaryPurpleDark=const Color(0xff320b86);

const textOnPrimaryBlack=const Color(0xff000000);
const textOnSecondaryWhite=const Color(0xffffffff);
const secondaryBackgroundWhite=const Color(0xffffffff);

class HexColor extends Color{
  static int _getColorFromHex(String hexColor){
    hexColor=hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length==6){
      hexColor="FF"+hexColor;
    }
    return int.parse(hexColor,radix: 16);
  }
  HexColor(final String hexColor):super(_getColorFromHex(hexColor));
}