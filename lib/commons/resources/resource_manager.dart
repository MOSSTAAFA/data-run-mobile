import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../utils/mass_utils/colors.dart';
import '../extensions/standard_extensions.dart';
import 'd2_error_utils.dart';

part 'resource_manager.g.dart';

@riverpod
ResourceManager resourceManager(ResourceManagerRef ref) {
  return ResourceManager(ref);
}

class ResourceManager {
  const ResourceManager(this.ref);

  final ResourceManagerRef ref;

  String getString(String stringResource) {
    return navigatorKey.localization
        .lookup(stringResource);
  }

  Icon getObjectStyleDrawableResource(
      IconData? icon, IconData defaultResource) {
    // TODO NMC
    return icon?.let((it) => Icon(icon)) ?? Icon(defaultResource);
    // return icon?.let {
    // val iconName = if (icon.startsWith("ic_")) icon else "ic_$icon"
    // val iconResource =
    // getWrapperContext().resources.getIdentifier(
    // iconName,
    // "drawable",
    // getWrapperContext().packageName
    // )
    // if (iconResource != 0 && iconResource != -1 && drawableExists(iconResource)
    // ) {
    // iconResource
    // } else {
    // R.drawable.ic_default_icon
    // }
    // } ?: defaultResource
  }

  bool drawableExists(String iconResource) {
    return true;
    // return try {
    // ContextCompat.getDrawable(getWrapperContext(), iconResource)
    // true
    // } catch (e: Exception) {
    // false
    // }
  }

  Color? getColorFrom(String? hexColor) {
    return convertHexStringToColor(hexColor);
    // return hexColor?.let {
    // ColorUtils.parseColor(it)
    // } ?: -1
  }

  Color getColorOrDefaultFrom(String? hexColor) {
    return convertHexStringToColor(hexColor) ??
        Theme.of(navigatorKey.currentContext!).colorScheme.primary;
  }

  String parseD2Error(Exception throwable) {
    return ref.read(d2ErrorUtilsProvider).getErrorMessage(throwable);
  }

  String defaultEventLabel() => getString('events');

  String defaultDataSetLabel() => getString('R.string.data_sets');

  String defaultTeiLabel() => getString('tei');

  String jiraIssueSentMessage() => getString('R.string.jira_issue_sent');

  String jiraIssueSentErrorMessage() =>
      getString('R.string.jira_issue_sent_error');

  String sectionFeedback() => getString('R.string.section_feedback');

  String sectionIndicators() => getString('R.string.section_indicators');

  String sectionCharts() => getString('R.string.section_charts');

  String sectionChartsAndIndicators() =>
      getString('R.string.section_charts_indicators');

  String defaultIndicatorLabel() => getString('R.string.info');
}
