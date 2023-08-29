// Colors.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 테마에 따라 바뀌지 않는 컬러
class CommonColors {

  // basic
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF2D2D2D);
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF707070);

  static const Color incomeColor = Color(0xFFFF6363);
  static const Color expenseColor = Color(0xFF4F97FF);
  static const Color transferColor = Color(0xFF4FCB46);
  static const Color sundayColor = Color(0xFFFF6363);
  static const Color saturdayColor = Color(0xFF4F97FF);

  static const Color primaryColor = Color(0xFF7D51CB);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);

  // red
  static const Color red = Color(0xFFFDA8AA);
  static const Color redBold = Color(0xFFD27476);
  // static const Color red3 = Color(0xFFFA3A3F);
  // blue
  static const Color blue = Color(0xFF9AC2FD);
  static const Color blueBold = Color(0xFF63A2FF);
  // static const Color blue3 = Color(0xFF0F70FF);
  // purple
  static const Color purple = Color(0xFFD6C5F2);
  static const Color purpleBold = Color(0xFFA586DB);
  // static const Color purple3 = Color(0xFF6034AC);

  static const List<Color> incomeColors = [
    Color(0xFFD3B2FF),
    Color(0xFFFF9FBB),
    Color(0xFFB4FFEE),
    Color(0xFFAAC6FF),
    Color(0xFFC8C0FF),
    Color(0xFFFFEFC1),
    Color(0xFFFFB0DA),
  ];

  static const List<Color> expenseColors = [
    Color(0xFF9EFFE7),
    Color(0xFFA1D6FF),
    Color(0xFFD6ABFF),
    Color(0xFFABD6FF),
    Color(0xFFBCB1FF),
    Color(0xFFFFF4D2),
    Color(0xFFF7C8E0),
  ];

  static const List<Color> typeColors = [
    Color(0xFF60DC9C),
    Color(0xFF43D3EA),
    Color(0xFF57A0E7),
    Color(0xFFAB6AEF),
    Color(0xFF7093DE),
    Color(0xFFDC9170),
    Color(0xFFECD181),
    Color(0xFFEA70AC),
  ];
}