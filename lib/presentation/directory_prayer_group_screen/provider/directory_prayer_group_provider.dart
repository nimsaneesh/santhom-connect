import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../directory_family_profile_screen/models/directory_family_profile_model.dart';
import '../models/directory_prayer_group_model.dart';
import '../models/directoryprayer_item_model.dart';
import '../repo/profile_parayer_group_repo.dart';

/// A provider class for the DirectoryPrayerGroupScreen.
///
/// This provider manages the state of the DirectoryPrayerGroupScreen, including the
/// current directoryPrayerGroupModelObj

// ignore_for_file: must_be_immutable
class DirectoryPrayerGroupProvider extends ChangeNotifier {
  TextEditingController teachingController = TextEditingController();

  DirectoryFamilyProfileModel directoryProfileModelObj =
      DirectoryFamilyProfileModel();
  bool _isLoading = false;
  final PrayerGroupProfileRepo _repo = PrayerGroupProfileRepo();
  bool get isLoading => _isLoading;
  DirectoryPrayerGroupModel _respo = DirectoryPrayerGroupModel();
  DirectoryPrayerGroupModel get respo => _respo;
  getPrayerGroup(String profile_id) async {
    loader(true);
    _respo = await _repo.getPrayerGroup(id: profile_id);
    notifyListeners();
    loader(false);
  }

  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
