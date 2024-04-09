import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../model/bulletin_model.dart';
import '../model/directory_model.dart';

class HomeRepo {
  Future<DirectoryModel> getDirectory(
      {required String search_word,
      required String per_page,
      required String family_page_no,
      required String member_page_no,
      required String prayer_group_page_no,
      required String organization_page_no}) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: false);
    final response = (await dioBuilderResponse.dio.post(
      AppAPIs.daily_digest,
      options: dioBuilderResponse.dioOptions,
      data: jsonEncode(<String, String>{
        'search_word': search_word,
        'per_page': per_page,
        'family_page_no': family_page_no,
        'member_page_no': member_page_no,
        'prayer_group_page_no': prayer_group_page_no,
        'organization_page_no': organization_page_no
      }),
    ));

    DirectoryModel model = DirectoryModel();
    if (response.statusCode == 200) {
      model = DirectoryModel.fromJson((response.data));
    } else {
      model = DirectoryModel.fromJson((response.data));
    }
    return model;
  }

  Future<BulletinModel> getBulletin(
      {required String search_word,
      required String per_page,
      required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: false);
    final response = (await dioBuilderResponse.dio.post(
      AppAPIs.bulletin,
      options: dioBuilderResponse.dioOptions,
      data: jsonEncode(<String, String>{
        'search_word': search_word,
        'per_page': per_page,
        'page_no': page_no,

      }),
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
