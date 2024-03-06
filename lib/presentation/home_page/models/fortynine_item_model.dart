import '../../../core/app_export.dart';

/// This class is used in the [fortynine_item_widget] screen.
class FortynineItemModel {
  FortynineItemModel({
    this.widget,
    this.brainstormWith,
    this.defineTheProblem,
    this.widget1,
    this.brainstormWith1,
    this.defineTheProblem1,
    this.id,
  }) {
    widget = widget ?? ImageConstant.imgLove1;
    brainstormWith = brainstormWith ?? "ഓർമ്മ";
    defineTheProblem = defineTheProblem ?? "വി  ഡോൺ ബോസ്കോ";
    widget1 = widget1 ?? ImageConstant.imgBook1;
    brainstormWith1 = brainstormWith1 ?? "വേദഭാഗങ്ങൾ";
    defineTheProblem1 = defineTheProblem1 ?? "എഫെ.5:6-14, മർക്കോ.16:15-18";
    id = id ?? "";
  }

  String? widget;

  String? brainstormWith;

  String? defineTheProblem;

  String? widget1;

  String? brainstormWith1;

  String? defineTheProblem1;

  String? id;
}
