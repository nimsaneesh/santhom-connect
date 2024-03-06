import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_tab_container_model.dart';

/// A provider class for the DirectoryTabContainerScreen.
///
/// This provider manages the state of the DirectoryTabContainerScreen, including the
/// current directoryTabContainerModelObj
class DirectoryTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  DirectoryTabContainerModel directoryTabContainerModelObj =
      DirectoryTabContainerModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
