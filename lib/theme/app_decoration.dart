import 'package:flutter/material.dart';
import 'package:santhom_connect/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );
  static BoxDecoration get fillGray200 => BoxDecoration(
        color: appTheme.gray200,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA70001,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToBlack => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.black900.withOpacity(0.69),
            appTheme.black900.withOpacity(0.69),
          ],
        ),
      );
  static BoxDecoration get gradientLightBlueToOnPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.15, 0),
          end: Alignment(0.94, 0.97),
          colors: [
            appTheme.lightBlue50,
            appTheme.deepPurple100,
            theme.colorScheme.onPrimaryContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        border: Border.all(
          color: appTheme.whiteA70001.withOpacity(0.6),
          width: 3.h,
          strokeAlign: strokeAlignCenter,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder26 => BorderRadius.circular(
        26.h,
      );
  static BorderRadius get circleBorder55 => BorderRadius.circular(
        55.h,
      );

  // Custom borders
  static BorderRadius get customBorderBL10 => BorderRadius.vertical(
        bottom: Radius.circular(10.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder60 => BorderRadius.circular(
        60.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
