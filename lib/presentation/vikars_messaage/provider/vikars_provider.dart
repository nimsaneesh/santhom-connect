import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/vikars_model.dart';
import '../repo/vikarsMessage_repo.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class VikarsMessageProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final VikarsMessageRepo _repo = VikarsMessageRepo();
  VikarsMessageRespo _respo = VikarsMessageRespo();
  VikarsMessageRespo get respo => _respo;
  getVikarsMessage() async {
    loader(true);
    _respo = await _repo.getVikarsMessage(
        per_page: per_page, page_no: "", search_word: searchController.text);
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
