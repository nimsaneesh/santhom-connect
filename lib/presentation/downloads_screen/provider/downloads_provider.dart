import 'package:flutter/material.dart';
import '../models/downloads_model.dart';
import '../repo/downloads_repo.dart';

/// A provider class for the BulletinScreen.
///
/// This provider manages the state of the BulletinScreen, including the
/// current bulletinModelObj

// ignore_for_file: must_be_immutable
class DownloadsProvider extends ChangeNotifier {
  TextEditingController thirtyTwoController = TextEditingController();

  DownloadsModels bulletinModelObj = DownloadsModels();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final DownloadsRepo _repo = DownloadsRepo();
  DownloadsModels _downlods_respo = DownloadsModels();
  DownloadsModels get respo => _downlods_respo;
  getDownloads() async {
    loader(true);
    _downlods_respo = await _repo.getDownloads(
        search_word: search_word, per_page: per_page, page_no: "");
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
    thirtyTwoController.dispose();
  }
}
