import 'package:flutter/material.dart';
import '../models/updates_model.dart';

/// A provider class for the BulletinScreen.
///
/// This provider manages the state of the BulletinScreen, including the
/// current bulletinModelObj

// ignore_for_file: must_be_immutable
class VicarsProvider extends ChangeNotifier {
  TextEditingController thirtyTwoController = TextEditingController();

  UpdatesModels bulletinModelObj = UpdatesModels();

  @override
  void dispose() {
    super.dispose();
    thirtyTwoController.dispose();
  }
}
