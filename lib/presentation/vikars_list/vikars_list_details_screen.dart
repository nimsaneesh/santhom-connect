import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';

import 'models/vikars_list_model.dart';
import 'provider/vikars_list_provider.dart';

class VikarsListDetailScreen extends StatefulWidget {
  const VikarsListDetailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrganizationScreenState createState() => OrganizationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VikarsListProvider(),
      child: VikarsListDetailScreen(),
    );
  }
}

class OrganizationScreenState extends State<VikarsListDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VikarsListData? model =
          ModalRoute.of(context)!.settings.arguments as VikarsListData;
      Provider.of<VikarsListProvider>(context, listen: false)
          .getVikarsDetailsMessage(model.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Consumer<VikarsListProvider>(
                builder: (context, provider, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 21.v),
                    // _buildMonday(context, provider)
                  ],
                ),
              );
            }),
          ),
          Selector<VikarsListProvider, bool>(
            selector: (context, provider) => provider.isLoading,
            builder: (context, value, child) {
              return value ? CircularLoader() : SizedBox();
            },
          ),
        ],
      ),
      // bottomNavigationBar: _buildBottomBar(context),
    );
  }
}

// Widget _buildArrowLeft(BuildContext context, VikarsListProvider provider) {
//   return SizedBox(
//       height: 236.v,
//       width: double.maxFinite,
//       child: Stack(alignment: Alignment.bottomCenter, children: [
//         Align(
//             alignment: Alignment.topCenter,
//             child: SizedBox(
//                 height: 200.v,
//                 width: double.maxFinite,
//                 child: Stack(alignment: Alignment.topCenter, children: [
//                   CustomImageView(
//                       imagePath: ImageConstant.imgRectangle9932,
//                       height: 200.v,
//                       width: 414.h,
//                       alignment: Alignment.center),
//                   CustomAppBar(
//                       height: 55.v,
//                       leadingWidth: double.maxFinite,
//                       leading: AppbarLeadingIconbutton(
//                           imagePath: ImageConstant.imgArrowLeft,
//                           margin: EdgeInsets.only(left: 25.h, right: 363.h),
//                           onTap: () {
//                             onTapArrowLeft(context);
//                           }))
//                 ]))),
//         Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 height: 121.adaptSize,
//                 width: 121.adaptSize,
//                 padding: EdgeInsets.all(3.h),
//                 decoration: AppDecoration.outlineWhiteA.copyWith(
//                     color: Colors.white,
//                     borderRadius: BorderRadiusStyle.roundedBorder60),
//                 child: CustomImageView(
//                     personName: provider
//                         .detail_respo.data?.organization?.organizationName,
//                     textSize: 40,
//                     height: 110.adaptSize,
//                     width: 110.adaptSize,
//                     radius: BorderRadius.circular(55.h),
//                     alignment: Alignment.center)))
//       ]));
// }

// Widget _buildMonday(
//   BuildContext context,
//   VikarsListProvider provider,
// ) {
//   var data = provider.detail_respo.data;
//   if (data == null) {
//     return SizedBox();
//   }
//   return Column(
//     children: [
//       _buildArrowLeft(context, provider),
//       Container(
//           padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 4.v),
//           child: Column(children: [
//             Text(data.organization?.organizationName ?? "",
//                 style: CustomTextStyles.titleLargeBluegray90001),
//             SizedBox(height: 3.v),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(data?.organization?.coordinator ?? "",
//                       style: CustomTextStyles.titleMediumLightblue900
//                           .copyWith(decoration: TextDecoration.underline)),
//                 ]),
//             Text(data.organization?.coordinatorPhoneNumber ?? "",
//                 style: CustomTextStyles.titleMediumLightblue900
//                     .copyWith(decoration: TextDecoration.underline)),
//             SizedBox(height: 16.v),
//             Container(
//                 width: 368.h,
//                 margin: EdgeInsets.only(left: 4.h),
//                 padding: EdgeInsets.symmetric(horizontal: 21.h, vertical: 18.v),
//                 decoration: AppDecoration.fillWhiteA
//                     .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Members",
//                           style: CustomTextStyles.titleMediumBlack900),
//                       SizedBox(height: 10.v),
//                       // Align(
//                       //     alignment: Alignment.centerLeft,
//                       //     child: Padding(
//                       //       padding: EdgeInsets.only(left: 0.h),
//                       //       child: _buildListView(
//                       //           provider.detail_respo.data?.members),
//                       //     )),
//                     ])),
//             SizedBox(height: 5.v)
//           ]))
//     ],
//   );
// }

// Widget _buildListView(List<Members>? memebers) {
//   List<Widget> rows = [];

//   if (memebers != null) {
//     for (int i = 0; i < memebers.length; i++) {
//       Members? model = memebers[i];
//       rows.add(
//         Container(
//           decoration: AppDecoration.fillGray
//               .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
//           child: GestureDetector(
//             onTap: () {
//               NavigatorService.pushNamed(AppRoutes.directoryProfileScreen,
//                   arguments: model.id.toString());
//             },
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomImageView(
//                     personName: model.name,
//                     height: 40.adaptSize,
//                     width: 40.adaptSize,
//                     textSize: 22,
//                     radius: BorderRadius.circular(55.h),
//                     margin: EdgeInsets.only(bottom: 3.v),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 7.v),
//                     Text(
//                       model.name ?? " " + " : ",
//                       style: CustomTextStyles.titleMediumLightblue900,
//                     ),
//                     SizedBox(height: 2.v),
//                     Text(
//                       "Position :" + model.position! ?? "",
//                       style: CustomTextStyles.titleSmallSFProSecondaryContainer,
//                     ),
//                     SizedBox(height: 7.v),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   return Column(children: rows);
// }

/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
      height: 52.v,
      leadingWidth: 51.h,
      leading: AppbarLeadingIconbutton(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 13.v),
          onTap: () {
            onTapArrowLeft(context);
          }),
      title: AppbarTitle(
          text: "Organizations Details", margin: EdgeInsets.only(left: 14.h)),
      actions: [
        // AppbarSubtitleOne(
        //     text: "lbl_share".tr,
        //     margin: EdgeInsets.only(left: 22.h, top: 17.v, right: 16.h)),
        AppbarTrailingImage(
            imagePath: ImageConstant.imgSend,
            margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 38.h))
      ]);
}

/// Navigates to the previous screen.
onTapArrowLeft(BuildContext context) {
  NavigatorService.goBack();
}
