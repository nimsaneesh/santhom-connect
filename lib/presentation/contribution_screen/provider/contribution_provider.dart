import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/contribution_model.dart';
import '../repo/contribution_repo.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class ContributionProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final ContributionRepo _repo = ContributionRepo();
  ContributionRespo _respo = ContributionRespo();
  ContributionRespo get respo => _respo;
  getContribution() async {
    loader(true);
    _respo = await _repo.getContribution(per_page: per_page, page_no: "");
    loader(false);
    notifyListeners();
  }

  String per_page = "";

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
