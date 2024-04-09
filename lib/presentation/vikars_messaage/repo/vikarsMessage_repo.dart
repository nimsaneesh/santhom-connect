import 'dart:convert';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/vikars_model.dart';

class VikarsMessageRepo {
  Future<VikarsMessageRespo> getVikarsMessage({
    required String per_page,
    required String page_no,
    required String search_word,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.vicar_messages,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'per_page': per_page,
        'page_no': page_no,
        'search_word': search_word,
      },
    ));

    VikarsMessageRespo model = VikarsMessageRespo();
    if (response.statusCode == 200) {
      model = VikarsMessageRespo.fromJson((response.data));
    } else {
      model = VikarsMessageRespo.fromJson((response.data));
    }
    return model;
  }
}
