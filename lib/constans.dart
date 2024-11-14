import 'package:elegant_shop_app/main.dart';
import 'package:flutter/material.dart';

const String kFontFamily = 'Encode Sans';
const Color kPrimaryColor = Color(0xff8E6CEF);
const Color kLightBlackColor = Color(0xff292526);
const Color kSubTitleColor = Color(0xff787676);
const Color kHeaderColor = Color(0xff121111);
const Color kBorderColor = Color(0xffF2F2F2);
const Color kBackgroundColor = Color(0xffF9F9F9);
Color kLightGreyColor = const Color(0xffEDEDED).withOpacity(.35);
const double kMainPagePadding = 24;
const String kBaseUrl = 'https://quakstore.onrender.com/api/v1';
const String kPaginiationPageSize = '5';
var kCommonApiHeaders = {
  "Accept": 'application/json',
  'Authorization': "Token ${userInfo.getString('auth_token')}"
};
