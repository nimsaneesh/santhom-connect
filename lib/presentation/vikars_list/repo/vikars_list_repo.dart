import 'dart:convert';

import 'package:santhom_connect/presentation/vikars_list/models/vikars_list_detail_model.dart';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/vikars_list_model.dart';

class VikarsListRepo {
  Future<VikarsListRespo> getVikarsListMessage({
    required String per_page,
    required String page_no,
    required String search_word,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.vicars_list,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'per_page': per_page,
        'page_no': page_no,
        'search_word': search_word,
      },
    ));

    VikarsListRespo model = VikarsListRespo();
    if (response.statusCode == 200) {
      model = VikarsListRespo.fromJson((response.data));
    } else {
      model = VikarsListRespo.fromJson((response.data));
    }
    return model;
  }

  Future<VikarsListDetailsRespo> getVikarsListDetailMessage({
    required String id,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.vicar_details,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'id': id,
      },
    ));

    VikarsListDetailsRespo model = VikarsListDetailsRespo();
    if (response.statusCode == 200) {
      model = VikarsListDetailsRespo.fromJson((response.data));
    } else {
      model = VikarsListDetailsRespo.fromJson((response.data));
    }
    return model;
  }
}
