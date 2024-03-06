import '../../../core/app_export.dart';

/// This class is used in the [monday_item_widget] screen.
class MondayItemModel {
  MondayItemModel({
    this.groupBy,
    this.id,
  }) {
    groupBy = groupBy ?? "";
    id = id ?? "";
  }

  String? groupBy;

  String? id;
}
