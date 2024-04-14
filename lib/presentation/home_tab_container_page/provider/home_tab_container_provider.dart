import 'package:flutter/material.dart';
import 'package:santhom_connect/presentation/home_tab_container_page/repo/home_repos.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../../home_page/model/directory_model.dart';
import '../models/home_tab_container_model.dart';
import '../models/updates_model.dart';

/// A provider class for the HomeTabContainerPage.
///
/// This provider manages the state of the HomeTabContainerPage, including the
/// current homeTabContainerModelObj
class HomeTabContainerProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  UpdatesModel _directory_respo = UpdatesModel();
  UpdatesModel get directory_respo => _directory_respo;
  final HomeRepos _repo = HomeRepos();
  BulletinModel _bulletin_respo = BulletinModel();
  BulletinModel get bulletin_respo => _bulletin_respo;
  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  String personName = "";
  String image = "";
  String familyName = "";
  String familyHeadName = "";
  String search_word = "";
  String page_no = "";
  String per_page = "";
  String family_page_no = "";
  String member_page_no = "";
  String prayer_group_page_no = "";
  String organization_page_no = "";

  getHome() {
    personName = PrefUtils().getName();
    image = PrefUtils().getImage();
    familyName = PrefUtils().getfamilyName();
    familyHeadName = PrefUtils().getfamilyHeadName();
    getDirectory();
    getBulletin();
  }

  getDirectory() async {
    loader(true);
    _directory_respo = await _repo.getUpdates(
      search_word: search_word,
      per_page: per_page,
      page_no: page_no,
    );
    notifyListeners();
    loader(false);
  }

  getBulletin() async {
    loader(true);
    _bulletin_respo = await _repo.getBulletin(
        search_word: search_word, per_page: per_page, page_no: "");
    notifyListeners();
    loader(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
