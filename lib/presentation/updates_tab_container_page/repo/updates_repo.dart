import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/calendar_event_respo.dart';
import '../models/updates_tab_container_model.dart';

class UpdatesRepo {
  Future<UpdatesTabContainerModel> getUpdates({
    required String date,
    required String per_page,
    required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.daily_calender_events,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'page_no': page_no,
        'per_page': per_page,
        'date': date,
      },
    ));

    UpdatesTabContainerModel model = UpdatesTabContainerModel();
    if (response.statusCode == 200) {
      model = UpdatesTabContainerModel.fromJson((response.data));
    } else {
      model = UpdatesTabContainerModel.fromJson((response.data));
    }
    return model;
  }

  Future<CalendarEventsRespo> getCalendarEvents({
    required String year,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.yearly_calender_events,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'year': year,
      },
    ));

    CalendarEventsRespo model = CalendarEventsRespo();
    if (response.statusCode == 200) {
      model = CalendarEventsRespo.fromJson((response.data));
    } else {
      model = CalendarEventsRespo.fromJson((response.data));
    }
    return model;
  }
}
