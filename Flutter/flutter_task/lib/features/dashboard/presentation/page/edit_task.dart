import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task/core/constant/cm_text_style.dart';
import 'package:flutter_task/features/dashboard/data/model/task_details_model.dart';
import 'package:flutter_task/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:flutter_task/features/dashboard/presentation/widget/date_time_widget.dart';
import 'package:flutter_task/features/dashboard/presentation/widget/radio_button.dart';
import 'package:flutter_task/features/dashboard/presentation/widget/text_field_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class EditTask extends ConsumerWidget {
  final TaskDetailModel taskDetailModel;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  EditTask({super.key, required this.taskDetailModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    title.text = taskDetailModel.title;
    description.text = taskDetailModel.description;
    String dateValue = taskDetailModel.date;
    String timeValue = taskDetailModel.time;
    String categoryValue = taskDetailModel.category;

    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text('Update Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const Gap(10),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade300,
          ),
          const Gap(10),
          // Task Title
          const Text(
            'Task Title',
            style: CmTextStyle.addTaskTitleStyle,
          ),
          const Gap(10),
          TextFieldWidget(
            maxLines: 1,
            hintText: 'Add Task Name',
            txtEditingController: title,
          ),
          const Gap(20),
          // Description
          const Text(
            'Description',
            style: CmTextStyle.addTaskTitleStyle,
          ),
          const Gap(10),
          TextFieldWidget(
            maxLines: 5,
            hintText: 'Add Description',
            txtEditingController: description,
          ),
          const Gap(10),
          const Text(
            'Category',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          ),
          //Category Section
          Row(
            children: [
              Expanded(
                  child: RadioButtonWidget(
                text: 'LRN',
                radioColor: Colors.green,
                onChangeValue: () {
                  ref.read(radioProvider.notifier).update((state) => 1);
                },
                inputVal: 1,
              )),
              const Gap(10),
              Expanded(
                  child: RadioButtonWidget(
                text: 'WORK',
                radioColor: Colors.blue,
                inputVal: 2,
                onChangeValue: () {
                  ref.read(radioProvider.notifier).update((state) => 2);
                },
              )),
              const Gap(10),
              Expanded(
                  child: RadioButtonWidget(
                text: 'GEN',
                radioColor: Colors.orange,
                inputVal: 3,
                onChangeValue: () {
                  ref.read(radioProvider.notifier).update((state) => 3);
                },
              ))
            ],
          ),
          const Gap(10),
          // Date Time Section
          Row(
            children: [
              DateTimeWidget(
                textLable: 'Date',
                iconLable: dateValue,
                icons: const Icon(Icons.calendar_month),
                onTap: () async {
                  final getDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2026));
                  if (getDate != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getDate));
                  }
                },
              ),
              const Gap(10),
              DateTimeWidget(
                textLable: 'Time',
                iconLable: timeValue,
                icons: const Icon(Icons.access_time_outlined),
                onTap: () async {
                  final getTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
              ),
            ],
          ),
          const Gap(20),
          //Submit button Section
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: CmTextStyle.cancelButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 16),
                      ))),
              const Gap(20),
              Expanded(
                  child: ElevatedButton(
                      style: CmTextStyle.createButtonStyle,
                      onPressed: () {
                        if (title.text != "" && description.text != "") {
                          ref.read(serviceProvider).updateTask(taskDetailModel.docId, TaskDetailModel(
                              title: title.text,
                              description: description.text,
                              category: "Learning",
                              date: dateValue,
                              time: timeValue,
                              isDone: false));

                          title.clear();
                          description.clear();
                          Navigator.pop(context);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please Give Title and Description");
                        }
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
