import 'package:grouped_list/grouped_list.dart';
import 'package:santhom_connect/presentation/home_page/model/directory_model.dart';
import 'models/monday_item_model.dart';
import '../directory_search_results_page/widgets/monday_item_widget.dart';
import 'models/directory_search_results_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_search_results_provider.dart';

// ignore_for_file: must_be_immutable
class DirectorySearchResultsPage extends StatelessWidget {
  List<Lists>? list;

  DirectorySearchResultsPage(this.list);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24.v),
                _buildMonday(context, list),
              ],
            ),
          ),
        ),
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
