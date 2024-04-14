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

  List<Event> getEventsForDay(DateTime day) {
    List<Event> eventList = [];
    if (null != event_respo.data) {
      var itemList = event_respo.data?.where((element) {
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(DateFormat('dd-MM-yyyy').parse(element.date.toString()));
        DateTime itemDay = DateTime.parse(formattedDate);
        return isSameDay(itemDay, day);
      });
      if (itemList!.isNotEmpty) {
        eventList.clear();
        for (var item in itemList) {
          if (item.birthdayEvents != 0)
            eventList.add(Event(item.birthdayEvents.toString() ?? ""));
        }
      }
    }

    return eventList;
  }
}
