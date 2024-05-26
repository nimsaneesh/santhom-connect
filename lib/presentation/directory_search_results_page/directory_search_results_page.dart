import 'package:santhom_connect/presentation/home_page/model/directory_model.dart';
import '../directory_search_results_page/widgets/monday_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore_for_file: must_be_immutable
class DirectorySearchResultsPage extends StatelessWidget {
  List<Lists>? list;

  DirectorySearchResultsPage(this.list);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMonday(context, list),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMonday(BuildContext context, List<Lists>? list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list?.length,
      itemBuilder: (context, index) {
        Lists item = list![index];
        return MondayItemWidget(item);
      },
    );
  }
}
