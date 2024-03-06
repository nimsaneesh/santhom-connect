import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/directory_profile_model.dart';

/// A provider class for the DirectoryProfileScreen.
///
/// This provider manages the state of the DirectoryProfileScreen, including the
/// current directoryProfileModelObj

// ignore_for_file: must_be_immutable
class DirectoryProfileProvider extends ChangeNotifier {
  TextEditingController teachingController = TextEditingController();

  DirectoryProfileModel directoryProfileModelObj = DirectoryProfileModel();

  @override
  void dispose() {
    super.dispose();
    teachingController.dispose();
  }
}
