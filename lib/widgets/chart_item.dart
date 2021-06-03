import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/models/repository_model.dart';
import 'package:gittrend/utils/constants.dart';

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
                textAlign: TextAlign.center,
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
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Constants.fromHex(
                        data.language.isEmpty ? '#000000' : data.languageColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    data.language.isEmpty ? 'Empty' : data.language,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  data.name,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  data.author,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: ScreenUtil().setSp(15),
                    ),
                    Text(
                      '${data.stars}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(5)),
                    Icon(
                      Icons.share,
                      size: ScreenUtil().setSp(15),
                    ),
                    Text(
                      '${data.forks}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
              child: ClipOval(
                child: Image.network(
                  '${data.avatar}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
