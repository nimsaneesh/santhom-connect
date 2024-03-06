import 'widgets/directory_item_widget.dart';
import 'models/directory_item_model.dart';
import 'models/directory_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/directory_provider.dart';

// ignore_for_file: must_be_immutable
class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key})
      : super(
          key: key,
        );

  @override
  DirectoryPageState createState() => DirectoryPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DirectoryProvider(),
      child: DirectoryPage(),
    );
  }
}

class DirectoryPageState extends State<DirectoryPage>
    with AutomaticKeepAliveClientMixin<DirectoryPage> {
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
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            children: [
              SizedBox(height: 21.v),
              _buildDirectory(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDirectory(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.h),
      child: Consumer<DirectoryProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.5.v),
                child: SizedBox(
                  width: 324.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.whiteA70001,
                  ),
                ),
              );
            },
            itemCount: provider.directoryModelObj.directoryItemList.length,
            itemBuilder: (context, index) {
              DirectoryItemModel model =
                  provider.directoryModelObj.directoryItemList[index];
              return DirectoryItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
