import 'package:grouped_list/grouped_list.dart';
import 'models/monday_item_model.dart';
import '../directory_search_results_page/widgets/monday_item_widget.dart';
import 'models/directory_search_results_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_search_results_provider.dart';

// ignore_for_file: must_be_immutable
class DirectorySearchResultsPage extends StatefulWidget {
  const DirectorySearchResultsPage({Key? key})
      : super(
          key: key,
        );

  @override
  DirectorySearchResultsPageState createState() =>
      DirectorySearchResultsPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DirectorySearchResultsProvider(),
      child: DirectorySearchResultsPage(),
    );
  }
}

class DirectorySearchResultsPageState extends State<DirectorySearchResultsPage>
    with AutomaticKeepAliveClientMixin<DirectorySearchResultsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

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
                _buildMonday(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMonday(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Consumer<DirectorySearchResultsProvider>(
        builder: (context, provider, child) {
          return GroupedListView<MondayItemModel, String>(
            shrinkWrap: true,
            stickyHeaderBackgroundColor: Colors.transparent,
            elements:
                provider.directorySearchResultsModelObj.mondayItemList ?? [],
            groupBy: (element) => element.groupBy!,
            sort: false,
            groupSeparatorBuilder: (String value) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 19.v,
                  bottom: 11.v,
                ),
                child: Column(
                  children: [
                    Text(
                      value,
                      style: CustomTextStyles.titleMediumMedium.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemBuilder: (context, model) {
              return MondayItemWidget(
                model,
              );
            },
            separator: SizedBox(
              height: 11.v,
            ),
          );
        },
      ),
    );
  }
}
