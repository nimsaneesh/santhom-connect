import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';
import '../models/fortynine_item_model.dart';
import '../models/catogorychip_item_model.dart';
import '../models/fortyfive_item_model.dart';

/// A provider class for the HomePage.
///
/// This provider manages the state of the HomePage, including the
/// current homeModelObj
class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
