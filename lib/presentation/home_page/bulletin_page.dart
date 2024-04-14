import 'package:santhom_connect/presentation/home_page/model/bulletin_model.dart';

import 'widgets/fortynine_item_widget.dart';
import 'models/fortynine_item_model.dart';
import 'widgets/catogorychip_item_widget.dart';
import 'models/catogorychip_item_model.dart';
import 'widgets/fortyfive_item_widget.dart';
import 'models/fortyfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/home_provider.dart';

// ignore_for_file: must_be_immutable
class BulletinPage extends StatelessWidget {
  List<Lists>? list;

  BulletinPage(this.list);

  @override
  Widget build(BuildContext context) {
    return _buildFortyFive(context, list);
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context, List<Lists>? list) {
    int itemCount = list?.length ?? 0;
    if (itemCount > 4) {
      itemCount = 4;
    }
    return Padding(
      padding: EdgeInsets.only(
        left: 22.h,
        right: 22.h,
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          Lists? model = list?[index];
          return FortyfiveItemWidget(
            model,
          );
        },
      ),
    );
  }
}
