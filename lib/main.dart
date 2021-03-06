import 'package:flutter/material.dart';
import 'package:gittrend/blocs/repository_bloc.dart';
import 'package:gittrend/models/chart_model.dart';
import 'package:gittrend/screens/chart_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gitboard',
        home: MultiProvider(
          providers: [
            Provider(create: (context) => RepositoriesBloc()),
            Provider(create: (context) => ChartModel())
          ],
          child: ChartScreen(),
        ));
  }
}
