import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../models/organization_detail_model.dart';
import '../models/organization_model.dart';

class OrganizationRepo {
  Future<OrganizationsRespo> getVikarsMessage({
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

    OrganizationsRespo model = OrganizationsRespo();
    if (response.statusCode == 200) {
      model = OrganizationsRespo.fromJson((response.data));
    } else {
      model = OrganizationsRespo.fromJson((response.data));
    }
    return model;
  }

    Future<OrganizationsDetailRespo> getVikarsDetailMessage({
    required String id,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.organization_details,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'id': id,
      },
    ));

    OrganizationsDetailRespo model = OrganizationsDetailRespo();
    if (response.statusCode == 200) {
      model = OrganizationsDetailRespo.fromJson((response.data));
    } else {
      model = OrganizationsDetailRespo.fromJson((response.data));
    }
    return model;
  }
}
