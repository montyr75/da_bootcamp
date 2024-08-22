import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'theme_state.dart';

part 'theme_service.g.dart';

// color palette
const darkTextColor = Color(0xFF100000);

// image sizes
const maxPageWidth = 640.0;

@riverpod
class ThemeService extends _$ThemeService {
  static const colorScheme = FlexScheme.blueM3;

// ignore: avoid_public_notifier_properties
  FlexSchemeData get schemeData => FlexColor.schemes[colorScheme]!;

  @override
  ThemeState build() {
    return ThemeState(
      light: FlexThemeData.light(scheme: colorScheme),
      dark: FlexThemeData.dark(
        scheme: colorScheme,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useM2StyleDividerInM3: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
    );
  }

  /// Use this to customize the color scheme (current code is an example).
  ThemeData _modTheme(ThemeData data) {
    final textTheme = _buildTextTheme(data.textTheme);

    return data.copyWith(
      // primaryColorDark: primaryColor,
      // dividerColor: Colors.white12,
      appBarTheme: data.appBarTheme.copyWith(
        titleTextStyle: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontFamily: 'MedievalSharp',
        ),
      ),
      inputDecorationTheme: data.inputDecorationTheme.copyWith(
        filled: false,
      ),
      // popupMenuTheme: data.popupMenuTheme.copyWith(
      //   color: Colors.black87,
      // ),
      // dialogTheme: data.dialogTheme.copyWith(
      //   // titleTextStyle: const TextStyle(fontFamily: 'Apocalypse'),
      //   backgroundColor: Colors.black87,
      //   shape: const BeveledRectangleBorder(
      //     side: BorderSide(width: 2, color: Colors.white30),
      //     borderRadius: BorderRadius.all(Radius.circular(med)),
      //   ),
      // ),
      textTheme: textTheme,
    );
  }

  /// Use this to customize the text theme (current code is an example).
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(
        fontSize: 28,
        fontFamily: 'Grange',
      ),
      displayMedium: base.displayMedium!.copyWith(
        fontSize: 18,
        fontFamily: 'MedievalSharp',
      ),
      displaySmall: base.displaySmall!.copyWith(
        fontSize: 14,
        fontFamily: 'MedievalSharp',
      ),
      headlineLarge: base.headlineLarge!.copyWith(
        fontSize: 28,
        fontFamily: 'MedievalSharp',
      ),
      headlineMedium: base.headlineMedium!.copyWith(
        fontSize: 18,
        fontFamily: 'Dystopia',
      ),
      headlineSmall: base.headlineSmall!.copyWith(
        fontSize: 16,
        fontFamily: 'Dystopia',
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontSize: 18,
        fontFamily: 'HeavyMetal2',
      ),
      // TextField default
      titleMedium: base.titleMedium!.copyWith(
        fontSize: 16,
        fontFamily: 'HeavyMetal2',
      ),
      titleSmall: base.titleSmall!.copyWith(
        fontSize: 14,
        fontFamily: 'HeavyMetal2',
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        fontSize: 18,
        fontFamily: 'FiraCodeMed',
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        fontSize: 12,
        fontFamily: 'FiraCodeMed',
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontSize: 10,
        fontFamily: 'FiraCodeMed',
      ),
    );
  }

  void onModeChange(ThemeMode value) {
    state = state.copyWith(mode: value);
  }
}
