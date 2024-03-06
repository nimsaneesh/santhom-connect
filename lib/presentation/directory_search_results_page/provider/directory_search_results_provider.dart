import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_search_results_model.dart';
import '../models/monday_item_model.dart';

/// A provider class for the DirectorySearchResultsPage.
///
/// This provider manages the state of the DirectorySearchResultsPage, including the
/// current directorySearchResultsModelObj
class DirectorySearchResultsProvider extends ChangeNotifier {
  DirectorySearchResultsModel directorySearchResultsModelObj =
      DirectorySearchResultsModel();

  @override
  void dispose() {
    super.dispose();
  }
}
