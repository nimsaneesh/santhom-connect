import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../directory_family_profile_screen/models/directory_family_profile_model.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/directory_prayer_group_model.dart';

class PrayerGroupProfileRepo {
  Future<DirectoryPrayerGroupModel> getPrayerGroup({
    required String id,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(AppAPIs.prayer_group,
        options: dioBuilderResponse.dioOptions,
        queryParameters: {
          'id': id,
        }));

    DirectoryPrayerGroupModel model = DirectoryPrayerGroupModel();
    if (response.statusCode == 200) {
      model = DirectoryPrayerGroupModel.fromJson((response.data));
    } else {
      model = DirectoryPrayerGroupModel.fromJson((response.data));
    }
    return model;
  }
}
