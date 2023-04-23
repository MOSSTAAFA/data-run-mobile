import 'package:flutter/material.dart';
import '../../main.dart';
import '../../main/l10n/app_localizations.dart';
import '../../utils/mass_utils/colors.dart';
import '../extensions/standard_extensions.dart';

class ResourceManager {
  const ResourceManager();

  String getString(String stringResource) {
    return AppLocalization.of(navigatorKey.currentContext!)!
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

  String? parseD2Error(Exception throwable) {
    // D2ErrorUtils(getWrapperContext()).getErrorMessage(throwable)
    //
  }

  String defaultEventLabel() => getString('R.string.events');

  String defaultDataSetLabel() => getString('R.string.data_sets');

  String defaultTeiLabel() => getString('R.string.tei');

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
