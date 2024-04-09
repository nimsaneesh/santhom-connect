import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/directory_model.dart';

class DirectoryRepo {
  Future<DirectoryModel> getDirectory({
    required String searchWord,
    required String perPage,
    required String familyPageNo,
    required String memberPageNo,
    required String prayerGroupPageNo,
    required String organizationPageNo,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);

    final response = await dioBuilderResponse.dio.get(
      AppAPIs.directory,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'search_word': searchWord,
        'per_page': perPage,
        'family_page_no': familyPageNo,
        'member_page_no': memberPageNo,
        'prayer_group_page_no': prayerGroupPageNo,
        'organization_page_no': organizationPageNo,
      },
    );

    if (response.statusCode == 200) {
      return DirectoryModel.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch directory');
    }
  }
}
