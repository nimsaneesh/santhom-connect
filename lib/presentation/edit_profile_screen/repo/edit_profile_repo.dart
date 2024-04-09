import 'dart:convert';

import 'package:santhom_connect/presentation/edit_profile_screen/models/prayer_group_model.dart';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../directory_profile_screen/models/directory_profile_model.dart';
import '../../home_page/model/directory_model.dart';
import '../models/update_family_respo.dart';

class EditProfileRepo {
  Future<UpdateFamilyRespo> editProfile({
    required String family_name,
    required String prayer_group_id,
    required String address1,
    required String address2,
    required String post_office,
    required String pincode,
    required String map_location,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);

    final response = await dioBuilderResponse.dio.post(
      AppAPIs.update_family,
      options: dioBuilderResponse.dioOptions,
      data: jsonEncode(<String, String>{
        'family_name': family_name,
        'prayer_group_id': prayer_group_id,
        'address1': address1,
        'address2': address2,
        'post_office': post_office,
        'map_location': map_location,
      }),
    );

    if (response.statusCode == 200) {
      return UpdateFamilyRespo.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch directory');
    }
  }

  Future<PrayerGroupRespo> getPrayerGroup() async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = await dioBuilderResponse.dio.get(
      AppAPIs.prayer_groups,
      options: dioBuilderResponse.dioOptions,
    );
    if (response.statusCode == 200) {
      return PrayerGroupRespo.fromJson(response.data);
    } else {
      throw Exception('Failed to fetch directory');
    }
  }
}
