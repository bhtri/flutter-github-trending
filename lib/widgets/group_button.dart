import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittrend/models/chart_model.dart';

class GroupButton extends StatefulWidget {
  final void Function(Since) onPressed;

  const GroupButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _GroupButtonState createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  int _selected = 0;
  Color _selectedColor = Color(0xff1d2440);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: ElevatedButton(
              autofocus: true,
              child: Text(
                'Daily',
                style: TextStyle(
                  color: _selected == 0 ? Colors.white : Colors.grey,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selected = 0;
                  widget.onPressed(Since.daily);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: _selected == 0 ? _selectedColor : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: ScreenUtil().setWidth(105),
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: ElevatedButton(
              child: Text(
                'Weekly',
                style: TextStyle(
                  color: _selected == 1 ? Colors.white : Colors.grey,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selected = 1;
                  widget.onPressed(Since.weekly);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: _selected == 1 ? _selectedColor : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: ElevatedButton(
              child: Text(
                'Monthly',
                style: TextStyle(
                  color: _selected == 2 ? Colors.white : Colors.grey,
                ),
              ),
              onPressed: () {
                setState(() {
                  _selected = 2;
                  widget.onPressed(Since.monthly);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: _selected == 2 ? _selectedColor : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
