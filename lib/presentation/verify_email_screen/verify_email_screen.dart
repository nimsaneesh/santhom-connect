import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/circular_loader.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_pin_code_text_field.dart';
import 'provider/verify_email_provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key})
      : super(
          key: key,
        );

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerifyEmailProvider(),
      child: VerifyEmailScreen(),
    );
  }
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          color: appTheme.gray100,
          image: DecorationImage(
            image: AssetImage(
              ImageConstant.img_backgrond,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 35.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 23.v),
                  SizedBox(
                    height: 192.v,
                    width: 223.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Opacity(
                          opacity: 0.4,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 167.v,
                              width: 203.h,
                              margin: EdgeInsets.only(bottom: 5.v),
                              decoration: BoxDecoration(
                                color: appTheme.gray1007e,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.h),
                                  topRight: Radius.circular(20.h),
                                  bottomLeft: Radius.circular(20.h),
                                  bottomRight: Radius.circular(19.h),
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgGroup1626,
                          height: 150.v,
                          width: 111.h,
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 43.v),
                            child: Text(
                              "lbl".tr,
                              style: CustomTextStyles.displaySmallRobotoBlueA400,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "lbl".tr,
                            style: CustomTextStyles.displaySmallRobotoBlueA40038,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 52.v),
                  Text("msg_verify_your_email".tr,
                      style: CustomTextStyles.headingBlackMono),
                  SizedBox(height: 13.v),
                  Opacity(
                    opacity: 0.6,
                    child: SizedBox(
                      width: 341.h,
                      child: Text(
                        "msg_please_check_your".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.subHeadingBlackMono!.copyWith(
                          height: 1.23,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 39.v),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 17.h,
                      right: 36.h,
                    ),
                    child: Selector<VerifyEmailProvider, TextEditingController?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.otpController,
                      builder: (context, otpController, child) {
                        return CustomPinCodeTextField(
                          context: context,
                          controller: otpController,
                          onChanged: (value) {
                            otpController?.text = value;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 69.v),
                  CustomElevatedButton(
                    onPressed: (() => {
                          Provider.of<VerifyEmailProvider>(context, listen: false)
                              .verifyEmail(context)
                        }),
                    text: "lbl_submit".tr,
                    margin: EdgeInsets.only(
                      left: 15.h,
                      right: 25.h,
                    ),
                    buttonTextStyle: CustomTextStyles.titleMediumPoppinsWhiteA700,
                  ),
                ],
              ),
            ),
             Selector<VerifyEmailProvider, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (context, value, child) {
                  return value ? CircularLoader() : SizedBox();
                },
              ),
          ],
        ),
      ),
    );
  }
}
