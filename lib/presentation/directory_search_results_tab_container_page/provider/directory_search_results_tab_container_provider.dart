import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_search_results_tab_container_model.dart';

/// A provider class for the DirectorySearchResultsTabContainerPage.
///
/// This provider manages the state of the DirectorySearchResultsTabContainerPage, including the
/// current directorySearchResultsTabContainerModelObj
class DirectorySearchResultsTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  DirectorySearchResultsTabContainerModel
      directorySearchResultsTabContainerModelObj =
      DirectorySearchResultsTabContainerModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
