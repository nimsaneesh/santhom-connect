import 'package:flutter/widgets.dart';
import 'package:santhom_connect/presentation/profile_page/models/my_family_model.dart';
import 'package:santhom_connect/services/secure_storage.dart';
import 'package:santhom_connect/utils/extensions.dart';

import '../../../core/utils/navigator_service.dart';
import '../../../routes/app_routes.dart';
import '../models/profile_model.dart';
import '../repo/profile_repo.dart';

/// A provider class for the ProfilePage.
///
/// This provider manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileProvider extends ChangeNotifier {
  // TextEditingController thumbsupController = TextEditingController();

  // TextEditingController locationController = TextEditingController();

  // ProfileModel profileModelObj = ProfileModel();
  final ProfileRepo _repo = ProfileRepo();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProfileModel _respo = ProfileModel();
  MyFamilyModel _family_respo = MyFamilyModel();
  ProfileModel get respo => _respo;
  MyFamilyModel get family_respo => _family_respo;

  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  getProfile() async {
    loader(true);
    _respo = await _repo.getProfile();
    loader(false);
  }

  logout() {
    SecureStorage.deleteAll();
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
    );
  }

  getMyFamily() async {
    loader(true);
    _family_respo = await _repo.getMyFamily();
    notifyListeners();
    loader(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
