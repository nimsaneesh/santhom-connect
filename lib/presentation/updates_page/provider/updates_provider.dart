import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/updates_model.dart';

/// A provider class for the UpdatesPage.
///
/// This provider manages the state of the UpdatesPage, including the
/// current updatesModelObj
class UpdatesProvider extends ChangeNotifier {
  UpdatesModel updatesModelObj = UpdatesModel();

  @override
  void dispose() {
    super.dispose();
  }
}
