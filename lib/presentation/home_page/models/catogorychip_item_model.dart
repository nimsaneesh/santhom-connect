import '../../../core/app_export.dart';

/// This class is used in the [catogorychip_item_widget] screen.
class CatogorychipItemModel {
  CatogorychipItemModel({
    this.catogoryChip,
    this.id,
  }) {
    catogoryChip = catogoryChip ?? "All ";
    id = id ?? "";
  }

  String? catogoryChip;

  String? id;
}
