import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Opacity(
          opacity: 0.94,
          child: CustomImageView(
            imagePath: imagePath,
            height: 19.v,
            width: 24.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
