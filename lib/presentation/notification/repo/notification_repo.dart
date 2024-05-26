import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../models/notification_model.dart';

class NotificationsRepo {
  Future<NotificationsResponse> getNotifications({
    required String per_page,
    required String page_no,
    required String search_word,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.organizations,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'per_page': per_page,
        'page_no': page_no,
        'search_word': search_word,
      },
    ));

    NotificationsResponse model = NotificationsResponse();
    if (response.statusCode == 200) {
      model = NotificationsResponse.fromJson((response.data));
    } else {
      model = NotificationsResponse.fromJson((response.data));
    }
    return model;
  }

  //   Future<NotificationsResponse> getVikarsDetailMessage({
  //   required String id,
  // }) async {
  //   DioBuilderResponse dioBuilderResponse =
  //       await DioBuilder().buildNonCachedDio(hasAuth: true);
  //   final response = (await dioBuilderResponse.dio.get(
  //     AppAPIs.organization_details,
  //     options: dioBuilderResponse.dioOptions,
  //     queryParameters: {
  //       'id': id,
  //     },
  //   ));
  //
  //   NotificationsResponse model = NotificationsResponse();
  //   if (response.statusCode == 200) {
  //     model = NotificationsResponse.fromJson((response.data));
  //   } else {
  //     model = NotificationsResponse.fromJson((response.data));
  //   }
  //   return model;
  // }
}
