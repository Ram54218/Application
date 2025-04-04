import 'package:employee_data/constant/style/cm_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../bloc/calender_bloc/calender_sel_bloc.dart';
import '../bloc/calender_bloc/calender_sel_state.dart';

class CalenderWidget extends StatelessWidget {
  final bool isEndDateCalenderView;

  const CalenderWidget({super.key, required this.isEndDateCalenderView});

  @override
  Widget build(BuildContext context) {
    DateTime focusDate = DateTime.now();
    return BlocBuilder<CalenderSelBloc, CalenderSelState>(
      builder: (context, state) {
        if (state is CalenderInitState) {}
        if (state is CalenderSelectedState) {
          focusDate = state.selDate;
        }
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.70,
            child: Column(
              children: [
                isEndDateCalenderView
                    ? Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.cancelButtonStyle,
                                onPressed: () {
                                  // context.read<CalenderSelBloc>().selTodayDate();
                                },
                                child: const Text('No date',
                                    style: TextStyle(
                                        color: CmTextStyle.themeColor))),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.saveButtonStyle,
                                onPressed: () {
                                  context.read<CalenderSelBloc>().selTodayDate();
                                },
                                child: const Text('Today',
                                    style: TextStyle(color: Colors.white))),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.cancelButtonStyle,
                                onPressed: () {
                                  context.read<CalenderSelBloc>().selTodayDate();
                                },
                                child: const Text('Today',
                                    style: TextStyle(
                                        color: CmTextStyle.themeColor))),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.saveButtonStyle,
                                onPressed: () {
                                  context
                                      .read<CalenderSelBloc>()
                                      .selNextDay('Mon');
                                },
                                child: const Text('Next Monday',
                                    style: TextStyle(color: Colors.white))),
                          )
                        ],
                      ),
                !isEndDateCalenderView
                    ? Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.cancelButtonStyle,
                                onPressed: () {
                                  context
                                      .read<CalenderSelBloc>()
                                      .selNextDay('Tue');
                                },
                                child: const Text('Next Tuesday',
                                    style: TextStyle(
                                        color: CmTextStyle.themeColor))),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: ElevatedButton(
                                style: CmTextStyle.saveButtonStyle,
                                onPressed: () {
                                  context.read<CalenderSelBloc>().selNextWeek();
                                },
                                child: const Text('Next week',
                                    style: TextStyle(color: Colors.white))),
                          )
                        ],
                      )
                    : Container(),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 1, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: focusDate,
                  headerStyle: CmTextStyle.calenderHeaderStyle,
                  onDaySelected: (selectedDay, focusDay) {
                    context.read<CalenderSelBloc>().selectedDate(selectedDay);
                  },
                  selectedDayPredicate: (day) => isSameDay(day, focusDate),
                ),
                const Divider(thickness: 1.4, color: Color(0xffF2F2F2)),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      const ImageIcon(
                          color: CmTextStyle.themeColor,
                          AssetImage('assets/images/calender.png')),
                      const SizedBox(width: 5.0),
                      Text(DateFormat('d MMM y').format(focusDate).toString()),
                      const Spacer(),
                      ElevatedButton(
                          style: CmTextStyle.cancelButtonStyle,
                          onPressed: () {
                            context.read<CalenderSelBloc>().sendToTextField(
                                isEndDateCalenderView, focusDate);
                            //context.read<CalenderSelBloc>().selInitState('Cancel');
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(color: CmTextStyle.themeColor))),
                      const SizedBox(width: 12.0),
                      ElevatedButton(
                          style: CmTextStyle.saveButtonStyle,
                          onPressed: () {
                            context.read<CalenderSelBloc>().sendToTextField(
                                isEndDateCalenderView, focusDate);
                            Navigator.pop(context);
                          },
                          child: const Text('Save',
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
