abstract class CalenderSelState {}

final class CalenderInitState extends CalenderSelState {}

final class CalenderSelectedState extends CalenderSelState {
  DateTime selDate;

  CalenderSelectedState(this.selDate);
}
/*final class CalenderEndSelectedState extends CalenderSelState{
  DateTime selEndDate;
  CalenderEndSelectedState(this.selEndDate);
}*/

final class SetControllerValue extends CalenderSelState {
  bool controllerType;
  String setDate;

  SetControllerValue(this.controllerType, this.setDate);
}
