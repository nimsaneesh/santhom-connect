import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../home_page/model/bulletin_model.dart';
import '../models/vikars_list_detail_model.dart';
import '../models/vikars_list_model.dart';
import '../repo/vikars_list_repo.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class VikarsListProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final VikarsListRepo _repo = VikarsListRepo();
  VikarsListRespo _respo = VikarsListRespo();
  VikarsListDetailsRespo __detail_respo = VikarsListDetailsRespo();
  VikarsListRespo get respo => _respo;
  VikarsListDetailsRespo get detail_respo => __detail_respo;
  getVikarsMessage() async {
    loader(true);
    _respo = await _repo.getVikarsListMessage(
        per_page: per_page, page_no: "", search_word: searchController.text);
    loader(false);
    notifyListeners();
  }

  getVikarsDetailsMessage(int? id) async {
    loader(true);
    __detail_respo = await _repo.getVikarsListDetailMessage(id: id.toString());
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
