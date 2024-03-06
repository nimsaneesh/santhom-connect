import 'widgets/fortynine_item_widget.dart';
import 'models/fortynine_item_model.dart';
import 'models/home_model.dart';
import 'widgets/catogorychip_item_widget.dart';
import 'models/catogorychip_item_model.dart';
import 'widgets/fortyfive_item_widget.dart';
import 'models/fortyfive_item_model.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import 'provider/home_provider.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
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
                SizedBox(height: 16.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 23.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSixtyFive(context),
                        SizedBox(height: 13.v),
                        _buildFortyNine(context),
                        SizedBox(height: 24.v),
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text(
                            "lbl_bulletin".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(height: 4.v),
                        _buildCatogoryChip(context),
                        SizedBox(height: 12.v),
                        _buildFortyFive(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyFive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl".tr,
            style: CustomTextStyles.titleMediumBluegray90002,
          ),
          Text(
            "lbl_31_1_24".tr,
            style: CustomTextStyles.titleSmallPrimary,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyNine(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 22.h,
      ),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0.v),
                child: SizedBox(
                  width: 368.h,
                  child: Divider(
                    height: 1.v,
                    thickness: 1.v,
                    color: appTheme.gray20002,
                  ),
                ),
              );
            },
            itemCount: provider.homeModelObj.fortynineItemList.length,
            itemBuilder: (context, index) {
              FortynineItemModel model =
                  provider.homeModelObj.fortynineItemList[index];
              return FortynineItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildCatogoryChip(BuildContext context) {
    return Container(
      height: 52.v,
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder26,
      ),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.only(left: 1.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 10.h,
              );
            },
            itemCount: provider.homeModelObj.catogorychipItemList.length,
            itemBuilder: (context, index) {
              CatogorychipItemModel model =
                  provider.homeModelObj.catogorychipItemList[index];
              return CatogorychipItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 22.h,
      ),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 12.v,
              );
            },
            itemCount: provider.homeModelObj.fortyfiveItemList.length,
            itemBuilder: (context, index) {
              FortyfiveItemModel model =
                  provider.homeModelObj.fortyfiveItemList[index];
              return FortyfiveItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
