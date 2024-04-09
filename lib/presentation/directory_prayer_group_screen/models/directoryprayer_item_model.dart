import '../../../core/app_export.dart';

/// This class is used in the [directoryprayer_item_widget] screen.
class DirectoryprayerItemModel {
  DirectoryprayerItemModel({
    this.aakashMathew,
    this.aakashMathew1,
    this.valiyaparambilHouse,
    this.id,
  }) {
    aakashMathew = aakashMathew ?? ImageConstant.imgEllipse6;
    aakashMathew1 = aakashMathew1 ?? "Aakash Mathew";
    valiyaparambilHouse = valiyaparambilHouse ?? "Valiyaparambil House";
    id = id ?? "";
  }

  String? aakashMathew;

  String? aakashMathew1;

  String? valiyaparambilHouse;

  String? id;
}
