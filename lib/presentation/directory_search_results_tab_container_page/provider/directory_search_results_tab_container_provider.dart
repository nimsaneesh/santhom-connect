import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/directory_model.dart';
import '../models/directory_search_results_tab_container_model.dart';
import '../repo/directory_repo.dart';

/// A provider class for the DirectorySearchResultsTabContainerPage.
///
/// This provider manages the state of the DirectorySearchResultsTabContainerPage, including the
/// current directorySearchResultsTabContainerModelObj
class DirectorySearchResultsTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  int _index = 0;
  int get index => _index;
  DirectorySearchResultsTabContainerModel
      directorySearchResultsTabContainerModelObj =
      DirectorySearchResultsTabContainerModel();

  DirectoryModel _directory_respo = DirectoryModel();
  DirectoryModel get directory_respo => _directory_respo;
  final DirectoryRepo _repo = DirectoryRepo();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
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

  getDirectory() async {
    loader(true);
    _directory_respo = await _repo.getDirectory(
        searchWord: searchController.text,
        perPage: per_page,
        familyPageNo: family_page_no,
        memberPageNo: member_page_no,
        prayerGroupPageNo: prayer_group_page_no,
        organizationPageNo: organization_page_no);
        notifyListeners();
    loader(false);
  }

  searchItem() async {
    _directory_respo = await _repo.getDirectory(
        searchWord: searchController.text,
        perPage: per_page,
        familyPageNo: family_page_no,
        memberPageNo: member_page_no,
        prayerGroupPageNo: prayer_group_page_no,
        organizationPageNo: organization_page_no);
        notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
