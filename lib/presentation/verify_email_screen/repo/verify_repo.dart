import 'dart:convert';

import 'package:santhom_connect/presentation/verify_email_screen/models/verify_email_model.dart';

import '../../../../services/dio_services/dio_builder.dart';
import '../../../../values/app_apis.dart';

class VerifyRepo {
  Future<VerifyModel> verify(
      {required String email, required String otp}) async {
    DioBuilderResponse dioBuilderResponse =
        await DioBuilder().buildNonCachedDio(hasAuth: false);
    final response = (await dioBuilderResponse.dio.post(
      AppAPIs.verify,
      options: dioBuilderResponse.dioOptions,
      data:
          jsonEncode(<String, String>{'email': email, 'otp': otp}),
    ));

    VerifyModel registrationDetailsModel = VerifyModel();
    if (response.statusCode == 200) {
      registrationDetailsModel = VerifyModel.fromJson((response.data));
    } else {
      registrationDetailsModel = VerifyModel.fromJson((response.data));
    }
    return registrationDetailsModel;
  }
}
