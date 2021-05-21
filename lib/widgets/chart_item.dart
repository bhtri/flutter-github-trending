import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/models/repository_model.dart';

class ChartItem extends StatelessWidget {
  final int rank;
  final RepositoryModel data;

  const ChartItem({
    Key? key,
    required this.rank,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                '$rank',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3b3647),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(data.language), // 17:59
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
