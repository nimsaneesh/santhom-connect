import 'package:flutter/material.dart';
import '../models/bulletin_model.dart';

/// A provider class for the BulletinScreen.
///
/// This provider manages the state of the BulletinScreen, including the
/// current bulletinModelObj

// ignore_for_file: must_be_immutable
class BulletinProvider extends ChangeNotifier {
  TextEditingController thirtyTwoController = TextEditingController();

  BulletinModels bulletinModelObj = BulletinModels();

  @override
  void dispose() {
    super.dispose();
    thirtyTwoController.dispose();
  }


}
