import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get top => mediaQuery.padding.top;
  double get h => mediaQuery.size.height -mediaQuery.padding.top;
  double get w=> mediaQuery.size.width;

  double  dynamicHeight(double value) => (h /100)*value;
  double  dynamicWidht(double value) => (w /100)*value;

  double get verylowValue => h * 0.002;
  double get lowValue => h * 0.01;
  double get normalValue => h * 0.02;
  double get mediumValue => h * 0.04;
  double get highValue => h * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingVeryLow => EdgeInsets.all(verylowValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingVeryLowVertical => EdgeInsets.symmetric(vertical: verylowValue);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingVeryLowHorizontal => EdgeInsets.symmetric(horizontal: verylowValue);
  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension SizedBoxExtension on BuildContext {
  SizedBox get sizedBoxlow => SizedBox(
    width: dynamicWidht(1),
    height: dynamicHeight(1),
  );
  SizedBox get sizedBoxMedium => SizedBox(
    width: dynamicWidht(3),
    height: dynamicHeight(3),
  );
  SizedBox get sizedBoxHigh => SizedBox(
    width: dynamicWidht(5),
    height: dynamicHeight(5),
  );
  SizedBox get sizedBoxVeryHigh => SizedBox(
    width: dynamicWidht(10),
    height: dynamicHeight(10),
  );

  SizedBox get sizedBoxlowHorizontal => SizedBox(
    width: dynamicWidht(1),
  );
  SizedBox get sizedBoxMediumHorizontal => SizedBox(
    width: dynamicWidht(3),
  );
  SizedBox get sizedBoxHighHorizontal => SizedBox(
    width: dynamicWidht(5),
  );
  SizedBox get sizedBoxVeryHighHorizontal => SizedBox(
    width: dynamicWidht(10),
  );

  SizedBox get sizedBoxlowVertical => SizedBox(
    height: dynamicWidht(1),
  );
  SizedBox get sizedBoxMediumVertical => SizedBox(
    height: dynamicWidht(3),
  );
  SizedBox get sizedBoxHighVertical => SizedBox(
    height: dynamicWidht(5),
  );
  SizedBox get sizedBoxVeryHighVertical => SizedBox(
    height: dynamicWidht(10),
  );
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
  Duration get highDuration => const Duration(seconds: 2);
}
