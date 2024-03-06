import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_tab_container_model.dart';

/// A provider class for the HomeTabContainerPage.
///
/// This provider manages the state of the HomeTabContainerPage, including the
/// current homeTabContainerModelObj
class HomeTabContainerProvider extends ChangeNotifier {
  HomeTabContainerModel homeTabContainerModelObj = HomeTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
