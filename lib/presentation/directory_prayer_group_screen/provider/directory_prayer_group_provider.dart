import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_prayer_group_model.dart';
import '../models/directoryprayer_item_model.dart';

/// A provider class for the DirectoryPrayerGroupScreen.
///
/// This provider manages the state of the DirectoryPrayerGroupScreen, including the
/// current directoryPrayerGroupModelObj

// ignore_for_file: must_be_immutable
class DirectoryPrayerGroupProvider extends ChangeNotifier {
  DirectoryPrayerGroupModel directoryPrayerGroupModelObj =
      DirectoryPrayerGroupModel();

  @override
  void dispose() {
    super.dispose();
  }
}
