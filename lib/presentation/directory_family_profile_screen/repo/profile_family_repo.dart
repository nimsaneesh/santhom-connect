import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/directory_family_profile_model.dart';

class DirFamilyProfileRepo {
  Future<DirectoryFamilyProfileModel> getProfile({
    required String id,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(AppAPIs.family,
        options: dioBuilderResponse.dioOptions,
        queryParameters: {
          'id': id,
        }));

    DirectoryFamilyProfileModel model = DirectoryFamilyProfileModel();
    if (response.statusCode == 200) {
      model = DirectoryFamilyProfileModel.fromJson((response.data));
    } else {
      model = DirectoryFamilyProfileModel.fromJson((response.data));
    }
    return model;
  }
}
