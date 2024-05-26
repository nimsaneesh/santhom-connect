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
    return Scaffold(
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
        ));
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
          // Text(
          //   "Share".tr,
          //   style: TextStyle(
          //     color: Color(0XFF000000),
          //     fontSize: 16.fSize,
          //     fontFamily: 'Roboto',
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          // SizedBox(width: 1.h),
          // AppbarTrailingImage(
          //     imagePath: ImageConstant.imgSend,
          //     margin: EdgeInsets.only(left: 5.h, top: 17.v, right: 38.h)),
          // SizedBox(width: 25.h)
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
            padding: EdgeInsets.only(left: 14.v, top: 0.v),
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
                  padding: const EdgeInsets.only(
                      bottom: 12.0, left: 12.0, top: 12.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFE46666),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12), // Adjust the radius as needed
                          ),
                        ),
                        padding: const EdgeInsets.all(6.0),
                        child: CustomImageView(
                          imagePath: ImageConstant.pdf_icon,
                          height: 50.v,
                          width: 52.h,
                          radius: BorderRadius.circular(
                            12.h,
                          ),
                          margin: EdgeInsets.symmetric(vertical: 3.v),
                        ),
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
                                CustomImageView(
                                    imagePath: ImageConstant.oval_download,
                                    height: 10.v,
                                    width: 10.h,
                                    margin: EdgeInsets.only(bottom: 2.v)),
                                Opacity(
                                  opacity: 0.9,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 9.h),
                                    child: Text(
                                      model?.date ?? "15 February 2024",
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
                                        "#Downloads",
                                        style: CustomTextStyles
                                            .bodySmallPoppinsIndigoDownload,
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
                                model?.title ?? "",
                                style: CustomTextStyles.titleMediumBlack,
                              ),
                            ),
                            SizedBox(height: 4.v),
                            Row(
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.download_icon,
                                    height: 14.v,
                                    width: 14.h,
                                    margin: EdgeInsets.only(bottom: 2.v)),
                                SizedBox(width: 4.v),
                                Text(
                                  "Download PDF Format",
                                  style: CustomTextStyles.bodyMediumBlack600ab,
                                ),
                              ],
                            )
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
