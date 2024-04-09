import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/contribution_model.dart';

class ContributionRepo {
  Future<ContributionRespo> getContribution({
    required String per_page,
    required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.contributions,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'per_page': per_page,
        'page_no': page_no,
      },
    ));

    ContributionRespo model = ContributionRespo();
    if (response.statusCode == 200) {
      model = ContributionRespo.fromJson((response.data));
    } else {
      model = ContributionRespo.fromJson((response.data));
    }
    return model;
  }
}
