import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/calendar.dart';
import 'cal_repo_interface.dart';

final supabase = Supabase.instance.client;

class CalendarRepository implements CalRepoInterface {
  const CalendarRepository();

  @override
  Future<List<Calendar>> refreshCalendars() async {
    final response = await supabase
        .from('calendars')
        .select('id, name, color, background_slug, calendar_dates (date)');
    print(response);

    return response.map<Calendar>((e) => Calendar.fromJson(e)).toList();
  }
}
