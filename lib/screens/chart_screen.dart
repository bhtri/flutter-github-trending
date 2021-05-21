import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/widgets/group_button.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: Color(0xfff6f7fa),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
            height: ScreenUtil().setHeight(80),
            alignment: Alignment.center,
            child: Text(
              'Gitboard',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(310),
            height: ScreenUtil().setHeight(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xfff6f7fa),
              borderRadius: BorderRadius.circular(20),
            ),
            child: GroupButton(
              onPressed: (since) {
                print(since.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
