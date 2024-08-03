import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/main_constants/main_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_appearance.g.dart';

@riverpod
class AppAppearanceNotifier extends _$AppAppearanceNotifier {
  @override
  AppAppearance build() {
    return AppAppearance();
  }

  void handleBrightnessChange(bool useLightMode) {
    themMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
  }

  void handleMaterialVersionChange() {
    useMaterial3 = !state.useMaterial3;
  }

  void handleColorSelect(int value) {
    colorSelectionMethod = ColorSelectionMethod.colorSeed;
    colorSelected = ColorSeed.values[value];
  }

  void handleImageSelect(int value) {
    final String url = ColorImageProvider.values[value].url;
    ColorScheme.fromImageProvider(provider: NetworkImage(url))
        .then((ColorScheme newScheme) {
      colorSelectionMethod = ColorSelectionMethod.image;
      imageSelected = ColorImageProvider.values[value];
      imageColorScheme = newScheme;
    });
  }

  set colorSelectionMethod(ColorSelectionMethod method) {
    state = state.copyWith(colorSelectionMethod: method);
  }

  set colorSelected(ColorSeed colorSelected) {
    state = state.copyWith(colorSelected: colorSelected);
  }

  set imageSelected(ColorImageProvider imageSelected) {
    state = state.copyWith(imageSelected: imageSelected);
  }

  set imageColorScheme(ColorScheme? imageColorScheme) {
    state = state.copyWith(imageColorScheme: imageColorScheme);
  }

  set themMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
  }

  set useMaterial3(bool useMaterial3) {
    state = state.copyWith(useMaterial3: useMaterial3);
  }
}

class AppAppearance with EquatableMixin {
  AppAppearance(
      {this.useMaterial3 = true,
      this.themeMode = ThemeMode.system,
      this.colorSelected = ColorSeed.baseColor,
      this.imageSelected = ColorImageProvider.leaves,
      this.imageColorScheme = const ColorScheme.light(),
      this.colorSelectionMethod = ColorSelectionMethod.colorSeed});

  final bool useMaterial3;
  final ThemeMode themeMode;
  final ColorSeed colorSelected;
  final ColorImageProvider imageSelected;
  final ColorScheme imageColorScheme;
  final ColorSelectionMethod colorSelectionMethod;

  AppAppearance copyWith(
      {bool? useMaterial3,
      ThemeMode? themeMode,
      ColorSeed? colorSelected,
      ColorImageProvider? imageSelected,
      ColorScheme? imageColorScheme,
      ColorSelectionMethod? colorSelectionMethod}) {
    return AppAppearance(
        useMaterial3: useMaterial3 ?? this.useMaterial3,
        themeMode: themeMode ?? this.themeMode,
        colorSelected: colorSelected ?? this.colorSelected,
        imageSelected: imageSelected ?? this.imageSelected,
        imageColorScheme: imageColorScheme ?? this.imageColorScheme,
        colorSelectionMethod:
            colorSelectionMethod ?? this.colorSelectionMethod);
  }

  @override
  List<Object?> get props => <Object?>[
        useMaterial3,
        themeMode,
        colorSelected,
        imageSelected,
        imageColorScheme,
        colorSelectionMethod
      ];
}
