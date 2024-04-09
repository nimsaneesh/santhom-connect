import 'package:flutter/material.dart';
import 'package:santhom_connect/presentation/directory_search_results_tab_container_page/repo/directory_repo.dart';
import 'package:santhom_connect/presentation/profile_page/repo/profile_repo.dart';
import '../../../core/app_export.dart';
import '../models/directory_profile_model.dart';
import '../repo/profile_repo.dart';

/// A provider class for the DirectoryProfileScreen.
///
/// This provider manages the state of the DirectoryProfileScreen, including the
/// current directoryProfileModelObj

// ignore_for_file: must_be_immutable
class DirectoryProfileProvider extends ChangeNotifier {
  TextEditingController teachingController = TextEditingController();

  DirectoryProfileModel directoryProfileModelObj = DirectoryProfileModel();
  bool _isLoading = false;
  final DirProfileRepo _repo = DirProfileRepo();
  bool get isLoading => _isLoading;
  DirectoryProfileModel _bulletin_respo = DirectoryProfileModel();
  DirectoryProfileModel get bulletin_respo => _bulletin_respo;
  getProfile() async {
    loader(true);
    _bulletin_respo = await _repo.getProfile(id: '204');
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
    teachingController.dispose();
  }
}
