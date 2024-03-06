import '../../../core/app_export.dart';
import 'fortynine_item_model.dart';
import 'catogorychip_item_model.dart';
import 'fortyfive_item_model.dart';

class HomeModel {
  List<FortynineItemModel> fortynineItemList = [
    FortynineItemModel(
        widget: ImageConstant.imgLove1,
        brainstormWith: "ഓർമ്മ",
        defineTheProblem: "വി  ഡോൺ ബോസ്കോ",
        widget1: ImageConstant.imgBook1,
        brainstormWith1: "വേദഭാഗങ്ങൾ",
        defineTheProblem1: "എഫെ.5:6-14, മർക്കോ.16:15-18")
  ];

  List<CatogorychipItemModel> catogorychipItemList = [
    CatogorychipItemModel(catogoryChip: "All "),
    CatogorychipItemModel(catogoryChip: "News & Events"),
    CatogorychipItemModel(catogoryChip: "Obituary"),
    CatogorychipItemModel(catogoryChip: "Spiritual Organizations")
  ];

  List<FortyfiveItemModel> fortyfiveItemList = [
    FortyfiveItemModel(
        february: ImageConstant.imgRectangle9555,
        date: "15 February 2024",
        obituary: "#Obituary",
        month: "May her soul rest in peace",
        defineTheProblem: "സെ മേരീസ്‌ പ്രാർത്ഥനാ ഗ്രൂപ്പ്.. "),
    FortyfiveItemModel(
        february: ImageConstant.imgRectangle955570x72,
        date: "15 February 2024",
        obituary: "#News",
        month: "Fr. Joseph Vadakkan Transfered",
        defineTheProblem: "Rev.Fr Joseph cadakkan transfered to.."),
    FortyfiveItemModel(
        february: ImageConstant.imgRectangle95551,
        date: "15 February 2024",
        obituary: "#Event",
        month: "കർത്താവിനാൽ ഏറ്റം അനുഗ്രഹി..",
        defineTheProblem: "St.George പ്രാർത്ഥന കൂട്ടായ്മയുടെ.."),
    FortyfiveItemModel(
        date: "15 February 2024",
        obituary: "#Downloads",
        month: "Jeevamozhikal ; Issue 34")
  ];
}
