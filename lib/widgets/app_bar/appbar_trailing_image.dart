import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

// ignore: must_be_immutable
class AppbarTrailingImage extends StatelessWidget {
  AppbarTrailingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
    this.text,
  }) : super(
          key: key,
        );

  String? imagePath;
  String? text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 21.h,
            width: 24.h,
            fit: BoxFit.contain,
          ),
          // SizedBox(
          //   width: 5,
          // ),
          // Text(
          //   text ?? "",
          //   style: theme.textTheme.titleMedium,
          // ),
          // SizedBox(
          //   width: 25,
          // )
        ],
      ),
    );
  }
}
