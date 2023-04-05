import 'package:steady_calendar/config/constants.dart';
import 'package:steady_calendar/models/calendar.dart';
import 'package:steady_calendar/repositories/cal_repo_interface.dart';

class MockCalendarRepo extends CalRepoInterface {
  List<Calendar> cals = [
    Calendar(
        id: 1,
        name: 'untitled1',
        colorHex: colors.first.hex,
        backgroundSlug: backgrounds.first),
    Calendar(
        id: 2,
        name: 'untitled2',
        colorHex: colors.last.hex,
        backgroundSlug: backgrounds.last),
  ];

  @override
  Future<List<Calendar>> refreshCalendars() async {
    return cals;
  }
}
