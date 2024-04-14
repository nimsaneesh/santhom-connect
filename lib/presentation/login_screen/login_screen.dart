import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import '../../core/utils/validation_functions.dart';
import '../../widgets/circular_loader.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  LoginScreenState createState() => LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: LoginScreen(),
    );
  }
}

class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: SizeUtils.height,
          width: SizeUtils.width,
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
              SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.h,
                      vertical: 31.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Spacer(),
                        SizedBox(height: 100.v),
                        Text(
                          "lbl_welcome_to".tr,
                          style: CustomTextStyles.titleMediumBluegray900,
                        ),
                        SizedBox(height: 1.v),
                        Text(
                          "lbl_santhom_connect".tr,
                          style: theme.textTheme.displaySmall,
                        ),
                        SizedBox(height: 13.v),
                        SizedBox(
                          width: 347.h,
                          child: Text(
                            "msg_app_by_st_thomas".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleSmallBluegray900,
                          ),
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "lbl_sign_in".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: 19.v),
                        Text(
                          "lbl_email".tr,
                          style: CustomTextStyles.titleMediumGray600,
                        ),
                        SizedBox(height: 8.v),

                        Selector<LoginProvider, TextEditingController?>(
                          selector: (
                            context,
                            providers,
                          ) =>
                              providers.emailController,
                          builder: (context, emailController, child) {
                            return CustomTextFormField(
                              controller: emailController,
                              hintText: "lbl_email".tr,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "err_msg_please_enter_valid_email".tr;
                                }
                                return null;
                              },
                              prefix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(25.h, 19.v, 15.h, 18.v),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 26.adaptSize,
                                  width: 26.adaptSize,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: 64.v,
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 21.v,
                                right: 30.h,
                                bottom: 21.v,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 17.v),
                        Text(
                          "lbl_family_code".tr,
                          style: CustomTextStyles.titleMediumGray600,
                        ),
                        SizedBox(height: 10.v),
                        Selector<LoginProvider, TextEditingController?>(
                          selector: (
                            context,
                            provider,
                          ) =>
                              provider.passwordController,
                          builder: (context, passwordController, child) {
                            return CustomTextFormField(
                              controller: passwordController,
                              hintText: "lbl_family_code".tr,
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                margin:
                                    EdgeInsets.fromLTRB(25.h, 19.v, 15.h, 18.v),
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgFamily21,
                                  height: 26.adaptSize,
                                  width: 26.adaptSize,
                                ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: 64.v,
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 21.v,
                                right: 30.h,
                                bottom: 21.v,
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 46.v),
                        CustomElevatedButton(
                          text: "lbl_sign_in".tr,
                          onPressed: () => {
                            Provider.of<LoginProvider>(context, listen: false)
                                .login(context)
                          },
                        ),
                        SizedBox(height: 39.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgWhatsappImage,
                          height: 122.adaptSize,
                          width: 122.adaptSize,
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 14.v),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "msg_major_archieparchy".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Selector<LoginProvider, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (context, value, child) {
                  return value ? CircularLoader() : SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyEight(BuildContext context) {
    return SizedBox(
      height: 64.v,
      width: 348.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Selector<LoginProvider, TextEditingController?>(
            selector: (
              context,
              provider,
            ) =>
                provider.emailController,
            builder: (context, emailController, child) {
              return CustomTextFormField(
                width: 348.h,
                controller: emailController,
                hintText: "msg_jacobthomas_gmail_com".tr,
                textInputType: TextInputType.emailAddress,
                alignment: Alignment.center,
                validator: (value) {
                  if (value == null ||
                      (!isValidEmail(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 21.v,
                ),
              );
            },
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowDown,
            height: 16.v,
            width: 22.h,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 27.h),
          ),
        ],
      ),
    );
  }
}
