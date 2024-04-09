import 'dart:convert';

import 'package:santhom_connect/presentation/downloads_screen/models/downloads_model.dart';

import '../../../services/dio_services/dio_builder.dart';
import '../../../values/app_apis.dart';
import '../../home_page/model/bulletin_model.dart';

class DownloadsRepo {
  Future<DownloadsModels> getDownloads({
    required String search_word,
    required String per_page,
    required String page_no,
  }) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: true);
    final response = (await dioBuilderResponse.dio.get(
      AppAPIs.downloads,
      options: dioBuilderResponse.dioOptions,
      queryParameters: {
        'search_word': search_word,
        'per_page': per_page,
        'page_no': page_no,
      },
    ));

    DownloadsModels model = DownloadsModels();
    if (response.statusCode == 200) {
      model = DownloadsModels.fromJson((response.data));
    } else {
      model = DownloadsModels.fromJson((response.data));
    }
    return model;
  }


}
