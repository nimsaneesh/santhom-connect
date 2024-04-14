import '../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'provider/splash_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SplashProvider(), child: SplashScreen());
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeNavigation();
  }

  void initializeNavigation() async {
    String token = await PrefUtils().getToken();
    print("token: $token");
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (token != null && token.isNotEmpty) {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeContainerScreen);
      } else {
        NavigatorService.pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        backgroundColor: appTheme.black900.withOpacity(0.2),
        body: Container(
            width: SizeUtils.width,
            height: SizeUtils.height,
            decoration: BoxDecoration(
                color: appTheme.black900.withOpacity(0.2),
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgSplash),
                    fit: BoxFit.cover)),
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 58.v),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Spacer(),
                  Text("lbl_santhom_connect".tr,
                      style: CustomTextStyles.splashtext),
                  SizedBox(height: 98.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgWhatsappImage,
                      height: 107.adaptSize,
                      width: 107.adaptSize)
                ]))));
  }
}
