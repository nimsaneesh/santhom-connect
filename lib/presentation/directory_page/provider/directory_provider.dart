import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_model.dart';
import '../models/directory_item_model.dart';

/// A provider class for the DirectoryPage.
///
/// This provider manages the state of the DirectoryPage, including the
/// current directoryModelObj
class DirectoryProvider extends ChangeNotifier {
  DirectoryModel directoryModelObj = DirectoryModel();

  @override
  void dispose() {
    super.dispose();
  }
}
