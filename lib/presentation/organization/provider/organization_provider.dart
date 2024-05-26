import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/organization_detail_model.dart';
import '../models/organization_model.dart';
import '../repo/organization_repo.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class OrganizationProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final OrganizationRepo _repo = OrganizationRepo();
  OrganizationsRespo _respo = OrganizationsRespo();
  OrganizationsDetailRespo __detail_respo = OrganizationsDetailRespo();
  OrganizationsRespo get respo => _respo;
  OrganizationsDetailRespo get detail_respo => __detail_respo;
  getVikarsMessage() async {
    loader(true);
    _respo = await _repo.getVikarsMessage(
        per_page: per_page, page_no: "", search_word: searchController.text);
    loader(false);
    notifyListeners();
  }

  getVikarsDetailsMessage(int? id) async {
    loader(true);
    __detail_respo = await _repo.getVikarsDetailMessage(id: id.toString());
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
