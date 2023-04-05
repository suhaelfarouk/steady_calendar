import 'package:flutter/material.dart';
import 'package:steady_calendar/repositories/cal_repo_interface.dart';

import '../models/calendar.dart';

class SessionProvider extends ChangeNotifier {
  List<Calendar> _cals = [];
  List<Calendar> get cals => _cals;
  CalRepoInterface calRepo;

  SessionProvider(this.calRepo);

  refreshCalendars() async {
    _cals = await calRepo.refreshCalendars();
    notifyListeners();
  }
}
