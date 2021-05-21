import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/blocs/repository_bloc.dart';
import 'package:gittrend/models/chart_model.dart';
import 'package:gittrend/models/repository_model.dart';
import 'package:gittrend/widgets/chart_item.dart';
import 'package:gittrend/widgets/group_button.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late RepositoriesBloc bloc;
  late ChartModel chartModel;

  @override
  void initState() {
    super.initState();
    chartModel = Provider.of<ChartModel>(context, listen: false);
    bloc = Provider.of<RepositoriesBloc>(context, listen: false);
    bloc.fetchTrendingRepositories(chartModel);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

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
                chartModel.since = since;
                bloc.fetchTrendingRepositories(chartModel);
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.trendingRepositories,
              builder: (BuildContext context,
                  AsyncSnapshot<Future<List<RepositoryModel>>> snapshot1) {
                if (snapshot1.hasData) {
                  return FutureBuilder(
                    future: snapshot1.data,
                    builder: (context,
                        AsyncSnapshot<List<RepositoryModel>> snapshot2) {
                      if (snapshot2.connectionState == ConnectionState.done) {
                        if (snapshot2.hasData) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return ChartItem(
                                rank: index + 1,
                                data: snapshot2.data![index],
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text('Empty'),
                          );
                        }
                      } else {
                        return _loadingWidget();
                      }
                    },
                  );
                } else {
                  return _loadingWidget();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
