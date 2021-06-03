import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/utils/constants.dart';

class LanguageLabel extends StatelessWidget {
  final String color;
  final String language;
  const LanguageLabel({Key? key, required this.color, required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Constants.fromHex(language.isEmpty ? '#000000' : color),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        language.isEmpty ? 'Empty' : language,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
