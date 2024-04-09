import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/bulletin_tab_container_model.dart';
import '../repo/bulletin_repo.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class BulletinTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  BulletinTabContainerModel bulletinTabContainerModelObj =
      BulletinTabContainerModel();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final BulletinRepo _repo = BulletinRepo();
  BulletinModel _bulletin_respo = BulletinModel();
  BulletinModel get bulletin_respo => _bulletin_respo;
  getBulletin() async {
    loader(true);
    _bulletin_respo = await _repo.getBulletin(
        search_word: searchController.text, per_page: per_page, page_no: "");
    notifyListeners();
    loader(false);
  }

  String search_word = "";
  String per_page = "";
  String family_page_no = "";
  String member_page_no = "";
  String prayer_group_page_no = "";
  String organization_page_no = "";

  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
