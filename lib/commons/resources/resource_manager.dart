import 'package:flutter/material.dart';
import '../../main/l10n/app_localizations.dart';

class ResourceManager {
  BuildContext context;

  ResourceManager(this.context);

  String getString(String stringResource) {
    return AppLocalization.of(context)!.lookup(stringResource);
  }

  IconData getObjectStyleDrawableResource(
      String? icon, String defaultResource) {
    // TODO NMC
    return Icons.date_range_outlined;
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
    // return hexColor?.let {
    // ColorUtils.parseColor(it)
    // } ?: -1
  }

  // Color getColorOrDefaultFrom(String? hexColor) {

  // return ColorUtils.getColorFrom(
  // hexColor,
  // ColorUtils.getPrimaryColor(context, ColorUtils.ColorType.PRIMARY_LIGHT)
  // )
  // }

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
