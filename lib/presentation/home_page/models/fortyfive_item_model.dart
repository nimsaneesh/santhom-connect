import '../../../core/app_export.dart';

/// This class is used in the [fortyfive_item_widget] screen.
class FortyfiveItemModel {
  FortyfiveItemModel({
    this.february,
    this.date,
    this.obituary,
    this.month,
    this.defineTheProblem,
    this.id,
  }) {
    february = february ?? ImageConstant.imgRectangle9555;
    date = date ?? "15 February 2024";
    obituary = obituary ?? "#Obituary";
    month = month ?? "May her soul rest in peace";
    defineTheProblem = defineTheProblem ?? "സെ മേരീസ്‌ പ്രാർത്ഥനാ ഗ്രൂപ്പ്.. ";
    id = id ?? "";
  }

  String? february;

  String? date;

  String? obituary;

  String? month;

  String? defineTheProblem;

  String? id;
}
