import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/directory_profile_model.dart';

class DirProfileRepo {
  Future<DirectoryProfileModel> getProfile({
    required String id,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(AppAPIs.family_member,
        options: dioBuilderResponse.dioOptions,
        queryParameters: {
          'id': id,
        }));

    DirectoryProfileModel model = DirectoryProfileModel();
    if (response.statusCode == 200) {
      model = DirectoryProfileModel.fromJson((response.data));
    } else {
      model = DirectoryProfileModel.fromJson((response.data));
    }
    return model;
  }
}
