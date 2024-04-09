import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../../home_page/model/directory_model.dart';
import '../models/updates_model.dart';

class HomeRepos {
  Future<UpdatesModel> getUpdates({
    required String search_word,
    required String per_page,
    required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.daily_digest,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'search_word': search_word,
        'per_page': per_page,
        'page_no': page_no,
      },
    ));

    UpdatesModel model = UpdatesModel();
    if (response.statusCode == 200) {
      model = UpdatesModel.fromJson((response.data));
    } else {
      model = UpdatesModel.fromJson((response.data));
    }
    return model;
  }

  Future<BulletinModel> getBulletin({
    required String search_word,
    required String per_page,
    required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.bulletin,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'search_word': search_word,
        'per_page': per_page,
        'page_no': page_no,
      },
    ));

    BulletinModel model = BulletinModel();
    if (response.statusCode == 200) {
      model = BulletinModel.fromJson((response.data));
    } else {
      model = BulletinModel.fromJson((response.data));
    }
    return model;
  }
}
