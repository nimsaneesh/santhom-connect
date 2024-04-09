import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:santhom_connect/presentation/updates_tab_container_page/repo/updates_repo.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/utils.dart';
import '../models/calendar_event_respo.dart';
import '../models/updates_tab_container_model.dart';

class UpdatesTabContainerProvider extends ChangeNotifier {
  List<DateTime?>? selectedDatesFromCalendar1;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final UpdatesRepo _repo = UpdatesRepo();
  CalendarEventsRespo _events_respo = CalendarEventsRespo();
  UpdatesTabContainerModel _bulletin_respo = UpdatesTabContainerModel();
  UpdatesTabContainerModel get bulletin_respo => _bulletin_respo;
  CalendarEventsRespo get event_respo => _events_respo;
  String date = DateFormat('yyyy-MM-dd')
      .format(DateTime.now()); // Getting current date initially

  void selectedDates(List<DateTime?> dates) {
    if (dates.isNotEmpty && dates[0] != null) {
      date = DateFormat('yyyy-MM-dd').format(dates[0]!);
      getUpdates();
    }
  }

  void selectedDate(DateTime? dates) {
    if (dates != null) {
      date = DateFormat('yyyy-MM-dd').format(dates);
      getUpdates();
    }
  }

  getUpdates() async {
    loader(true);
    _bulletin_respo =
        await _repo.getUpdates(date: date, per_page: per_page, page_no: "");
    _events_respo = await _repo.getCalendarEvents(year: "2024");
    notifyListeners();
    loader(false);
  }

  String per_page = "";
  String family_page_no = "";
  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getEvents() {
    final _kEventSource = <DateTime, List<Event>>{};
    final LinkedHashMap<DateTime, List<Event>> kEvents =
        LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_kEventSource);

    if (event_respo.data != null) {
      event_respo.data!.forEach((element) {
          DateTime date = DateTime.parse(element.date!);
        // List<Event> events = event_respo.data!.map((e) => Event(e.l)).toList();
        // _kEventSource[date] = events;
      });
    }

    return kEvents;
  }
}
