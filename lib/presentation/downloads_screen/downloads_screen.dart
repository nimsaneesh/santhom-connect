import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:santhom_connect/presentation/downloads_screen/models/downloads_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/circular_loader.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/downloads_provider.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  BulletinScreenState createState() => BulletinScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DownloadsProvider(), child: DownloadsScreen());
  }
}

class BulletinScreenState extends State<DownloadsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DownloadsProvider>(context, listen: false).getDownloads();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Stack(
              children: [
                Container(
                  child: Consumer<DownloadsProvider>(
                      builder: (context, provider, child) {
                    print("Consumer");
                    print(provider.respo.data.toString());
                    print(provider.respo.data?.length);

                    return _buildFortyFive(context, provider.respo.data);
                  }),
                ),
                Selector<DownloadsProvider, bool>(
                  selector: (context, provider) => provider.isLoading,
                  builder: (context, value, child) {
                    return value ? CircularLoader() : SizedBox();
                  },
                ),
              ],
            )));
  }

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
        title:
            AppbarTitle(text: "Downloads", margin: EdgeInsets.only(left: 14.h)),
        actions: [
          // AppbarSubtitleOne(
          //     text: "lbl_share".tr,
          //     margin: EdgeInsets.only(left: 22.h, top: 17.v, right: 16.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgSend,
              margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 38.h))
        ]);
  }

  void openPdfFromUrl(String url) {
    debugPrint('opening PDF url = $url');
    var googleDocsUrl =
        'https://docs.google.com/gview?embedded=true&url=${Uri.encodeQueryComponent(url)}';
    debugPrint('opening Google docs with PDF url = $googleDocsUrl');
    final Uri uri = Uri.parse(googleDocsUrl);
    launchUrl(uri);
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context, List<Data>? list) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 22.h,
      ),
      child: ListView.separated(
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
        itemCount: list?.length ?? 0,
        itemBuilder: (context, index) {
          Data? model = list?[index];
          return Padding(
            padding: EdgeInsets.only(left: 14.v, top: 8.v),
            child: InkWell(
              onTap: () => openPdfFromUrl(model?.file ?? ""),
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.whiteA70001,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appTheme.black900.withOpacity(0.03),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.pdf_icon,
                        height: 50.v,
                        width: 52.h,
                        radius: BorderRadius.circular(
                          12.h,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 3.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 9.adaptSize,
                                  width: 9.adaptSize,
                                  margin: EdgeInsets.only(
                                    top: 2.v,
                                    bottom: 6.v,
                                  ),
                                  decoration: BoxDecoration(
                                    color: appTheme.indigo300,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.9,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 9.h),
                                    child: Text(
                                      model?.title ?? "",
                                      style: CustomTextStyles
                                          .bodySmallBluegray600ab,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.9,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: SizedBox(
                                      width: SizeUtils.width / 3,
                                      child: Text(
                                        model?.type ?? "",
                                        style: CustomTextStyles
                                            .bodySmallPoppinsIndigo300,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.v),
                            SizedBox(
                              width: SizeUtils.width - 170,
                              child: Text(
                                model?.details ?? "",
                                style: CustomTextStyles
                                    .bodyMediumManropeBluegray600_1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
