import 'package:flutter/material.dart';
import 'package:santhom_connect/core/utils/size_utils.dart';
import 'package:santhom_connect/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumGray60002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60002,
      );
  static get bodyMediumLatoGray60002 =>
      theme.textTheme.bodyMedium!.lato.copyWith(
        color: appTheme.gray60002,
      );
  static get bodyMediumManropeBluegray600 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: appTheme.blueGray600,
        fontSize: 13.fSize,
      );
  static get bodyMediumManropeBluegray600_1 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: appTheme.blueGray600,
      );
  static get bodyMediumManropeBluegray600ab =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: appTheme.blueGray600Ab,
        fontSize: 13.fSize,
      );
  static get bodyMediumManropeGray80090 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: appTheme.gray80090,
        fontSize: 13.fSize,
      );
  static get bodyMediumManropeff000000 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: Color(0XFF000000),
      );
  static get bodyMediumManropeff0095ff =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: Color(0XFF0095FF),
      );
  static get bodyMediumManropeff767676 =>
      theme.textTheme.bodyMedium!.manrope.copyWith(
        color: Color(0XFF767676),
      );
  static get bodyMediumWhiteA70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA70001,
      );
  static get bodySmallBluegray600ab => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray600Ab,
      );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray400,
        fontSize: 11.fSize,
      );
  static get bodySmallGray60001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray60001,
        fontSize: 11.fSize,
      );
  static get bodySmallPoppinsDeeppurpleA400 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.deepPurpleA400.withOpacity(0.67),
      );
  static get bodySmallPoppinsIndigo300 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.indigo300.withOpacity(0.67),
      );
  static get bodySmallPoppinsOrangeA400 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.orangeA400.withOpacity(0.67),
      );
  static get bodySmallPoppinsTeal500 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.teal500.withOpacity(0.67),
      );
  static get bodySmallWhiteA70001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA70001,
      );
  // Title text style
  static get titleLargeBluegray90001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray90001,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900.withOpacity(0.64),
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray90002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 16.fSize,
      );
  static get titleMediumBluegray90002Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray90002,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray900Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumLightblue900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightBlue900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumWhiteA70001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA70001Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleSmallPoppins => theme.textTheme.titleSmall!.poppins;
  static get titleSmallPoppinsWhiteA70001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 14.fSize,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSFProSecondaryContainer =>
      theme.textTheme.titleSmall!.sFPro.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 14.fSize,
      );
  static get titleSmallff1f6291 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF1F6291),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }

  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }

  TextStyle get canela {
    return copyWith(
      fontFamily: 'Canela',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
