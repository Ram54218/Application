import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CmTextStyle {
  static const themeColor = Color(0xff1DA1F2);
  static final saveButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: CmTextStyle.themeColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static final cancelButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffEDF8FF),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  static const calenderHeaderStyle = HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      leftChevronMargin: EdgeInsets.only(left: 50.0),
      rightChevronMargin: EdgeInsets.only(right: 50.0),
      leftChevronIcon:
          Icon(Icons.arrow_left, size: 35, color: Color(0xff949C9E)),
      rightChevronIcon:
          Icon(Icons.arrow_right, size: 35, color: Color(0xff949C9E)));
  static final textFieldBorderStyle = OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),);
  static const textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE5E5E5)),
  );
}
