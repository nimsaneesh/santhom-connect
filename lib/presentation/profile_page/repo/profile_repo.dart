import 'dart:convert';

import 'package:santhom_connect/presentation/profile_page/models/profile_model.dart';

import '../../../../services/dio_services/dio_builder.dart';
import '../../../../values/app_apis.dart';
import '../models/my_family_model.dart';

class ProfileRepo {
  Future<ProfileModel> getProfile() async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.my_profile,
      options: dioBuilderResponse.dioOptions,
    ));

    ProfileModel registrationDetailsModel = ProfileModel();
    if (response.statusCode == 200) {
      registrationDetailsModel = ProfileModel.fromJson((response.data));
    } else {
      registrationDetailsModel = ProfileModel.fromJson((response.data));
    }
    return registrationDetailsModel;
  }

  Future<MyFamilyModel> getMyFamily() async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.my_family,
      options: dioBuilderResponse.dioOptions,
    ));

    MyFamilyModel registrationDetailsModel = MyFamilyModel();
    if (response.statusCode == 200) {
      registrationDetailsModel = MyFamilyModel.fromJson((response.data));
    } else {
      registrationDetailsModel = MyFamilyModel.fromJson((response.data));
    }
    return registrationDetailsModel;
  }
}
