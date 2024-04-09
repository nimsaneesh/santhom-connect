import 'package:flutter/material.dart';
import 'package:santhom_connect/presentation/home_page/model/bulletin_model.dart';
import 'package:santhom_connect/presentation/home_page/repo/home_repo.dart';
import '../model/directory_model.dart';
import '../models/home_model.dart';

class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  DirectoryModel _directory_respo = DirectoryModel();
  DirectoryModel get directory_respo => _directory_respo;

  final HomeRepo _repo = HomeRepo();
  BulletinModel _bulletin_respo = BulletinModel();
  BulletinModel get bulletin_respo => _bulletin_respo;
  loader(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  String search_word = "";
  String per_page = "";
  String family_page_no = "";
  String member_page_no = "";
  String prayer_group_page_no = "";
  String organization_page_no = "";

  getHome() {
    // getDirectory();
    // getBulletin();
  }

  getDirectory() async {
    loader(true);
    _directory_respo = await _repo.getDirectory(
        search_word: search_word,
        per_page: per_page,
        family_page_no: family_page_no,
        member_page_no: member_page_no,
        prayer_group_page_no: prayer_group_page_no,
        organization_page_no: organization_page_no);
    loader(false);
  }

  getBulletin() async {
    loader(true);
    _bulletin_respo = await _repo.getBulletin(
        search_word: search_word, per_page: per_page, page_no: "10");

    loader(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
