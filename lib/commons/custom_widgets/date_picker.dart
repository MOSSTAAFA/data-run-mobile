// Flutter imports:
// ignore_for_file: unnecessary_null_checks

import 'package:flutter/material.dart' hide DateUtils;

import '../../utils/mass_utils/formatting.dart';
import '../../utils/mass_utils/strings.dart';
import '../date/date_utils.dart';
import 'fields/decorated_form_field.dart';

// D:\Hamza\Learn\my-projects\Flutter\mass_pro\lib\commons\date\field_with_issue.dart
final navigatorKey = GlobalKey<NavigatorState>();

class DatePicker extends StatefulWidget {
  const DatePicker(
      {super.key,
      required this.onSelected,
      // this.selectedDate,
      this.initialDate,
      this.labelText,
      this.validator,
      this.autoValidate = false,
      this.allowClearing = true,
      this.message,
      this.firstDate,
      this.onIconPressed,

      /// newly added
      this.isFutureDatesAllowed = false,
      this.isFromOtherPeriods = false,
      this.scheduleInterval,
      this.maxDate,
      this.minDate,
      this.title});

  final String? labelText;

  // final String? selectedDate;
  final DateTime? initialDate;
  final Function(String, bool) onSelected;
  final String? Function(String?)? validator;
  final bool autoValidate;
  final bool allowClearing;
  final String? message;
  final DateTime? firstDate;
  final Function()? onIconPressed;

  final String? title;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool isFutureDatesAllowed;
  final bool isFromOtherPeriods;

  /// in number of days
  final int? scheduleInterval;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  String? _pendingValue;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFoucsChanged);
  }

  @override
  void didChangeDependencies() {
    if (widget.initialDate != null) {
      // _textController.text = formatDate(widget.selectedDate, context);
      // ignore: avoid_dynamic_calls
      _textController.text =
          DateUtils.oldUiDateFormat().format(widget.initialDate!);
    }

    super.didChangeDependencies();
  }

  void _onFoucsChanged() {
    if (!_focusNode.hasFocus) {
      // _textController.text = formatDate(widget.selectedDate, context);
      if (widget.initialDate != null) {
        // _textController.text = formatDate(widget.selectedDate, context);
        // ignore: avoid_dynamic_calls
        _textController.text =
            DateUtils.oldUiDateFormat().format(widget.initialDate!);
      }
      setState(() {
        _pendingValue = null;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.removeListener(_onFoucsChanged);
    _focusNode.dispose();

    super.dispose();
  }

  Future<void> _showDatePicker() async {
    DateTime firstDate = DateTime(DateTime.now().year - 50);
    DateTime lastDate = DateTime.now();
    final DateTime initialDate = widget.initialDate ?? DateTime.now();

    if (widget.minDate != null) {
      if (initialDate.isBefore(widget.minDate!) == true) {
        firstDate = initialDate;
      } else {
        firstDate = widget.minDate!;
      }
    } else {
      firstDate = DateTime(DateTime.now().year - 50);
    }

    if (widget.maxDate != null) {
      if (initialDate.isAfter(widget.maxDate!)) {
        lastDate = initialDate;
      } else {
        lastDate = widget.maxDate!;
      }
    }

    if (widget.isFutureDatesAllowed) {
      lastDate = DateTime(DateTime.now().year + 50);
    }

    // final store = StoreProvider.of<AppState>(context);
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        // locale: const Locale('en', 'US'),
        fieldLabelText: widget.title,
        fieldHintText: widget.title
        //initialEntryMode: DatePickerEntryMode.input,
        );

    if (selectedDate != null) {
      final date = convertDateTimeToSqlDate(selectedDate);
      _textController.text = formatDate(date, navigatorKey.currentContext);
      widget.onSelected(date, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var label = widget.labelText;
    if (widget.message != null && widget.initialDate == null) {
      label = '$label • ${widget.message}';
    }

    final field = DecoratedFormField(
      focusNode: _focusNode,
      validator: widget.validator,
      controller: _textController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: _pendingValue ?? label ?? '',
          suffixIcon: widget.allowClearing && widget.initialDate != null
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _textController.text = '';
                    widget.onSelected('', false);
                  },
                )
              : null),
      onChanged: (value) {
        if (value.isEmpty) {
          widget.onSelected('', false);
        } else {
          String? date = '';
          final dateAsNumber = value.replaceAll('/', '').replaceAll(r'\', '');
          if (isAllDigits(dateAsNumber) || value.length <= 5) {
            String firstPart = '01';
            String secondPart = '01';
            int? year = DateTime.now().year;
            if (value.contains('/')) {
              final parts = value.split('/');
              if (parts[0].length == 1) {
                firstPart = '0${parts[0]}';
              } else {
                firstPart = parts[0];
              }
              if (parts[1].length == 1) {
                secondPart = '0${parts[1]}';
              } else {
                secondPart = parts[1];
              }
              if (parts.length == 3) {
                year = parseInt(parts[2])!;
                if (year < 100) {
                  year += 2000;
                }
              }
            } else if (value.contains(r'\')) {
              final parts = value.split(r'\');
              if (parts[0].length == 1) {
                secondPart = '0${parts[0]}';
              } else {
                secondPart = parts[0];
              }
              if (parts[1].length == 1) {
                firstPart = '0${parts[1]}';
              } else {
                firstPart = parts[1];
              }
              if (parts.length == 3) {
                year = parseInt(parts[2])!;
                if (year < 100) {
                  year += 2000;
                }
              }
            } else {
              value = value.replaceAll(RegExp(r'[^0-9]'), '');

              if (value.length <= 2) {
                if (value.length == 1) {
                  value = '0$value';
                }

                firstPart = value;
              } else if (value.length == 3) {
                if (value.substring(0, 1) == '0') {
                  firstPart = value.substring(0, 2);
                  secondPart = '0${value.substring(2, 3)}';
                } else {
                  firstPart = '0${value.substring(0, 1)}';
                  secondPart = value.substring(1, 3);
                }
              } else {
                if (value.length == 5) {
                  value = '0$value';
                }

                firstPart = value.substring(0, 2);
                secondPart = value.substring(2, 4);

                if (value.length == 6) {
                  year = int.tryParse(value.substring(4, 6))!;
                  if (year < 30) {
                    year += 2000;
                  } else {
                    year += 1900;
                  }
                } else if (value.length == 8) {
                  year = int.tryParse(value.substring(4, 8));
                }
              }
            }

            final month = firstPart;
            final day = secondPart;

            value = '$day$month';

            if (value.length == 4) {
              value = '$year$value';
            }

            date = convertDateTimeToSqlDate(DateTime.tryParse(value));
          } else {
            try {
              date = parseDate(value, context);
            } catch (e) {
              return;
            }
          }

          if (widget.firstDate != null) {
            final firstDateSql = convertDateTimeToSqlDate(widget.firstDate);
            if (firstDateSql.compareTo(date) > 0) {
              date = firstDateSql;
            }
          }

          if (date.isNotEmpty) {
            widget.onSelected(date, true);
          }

          setState(() {
            _pendingValue = formatDate(date, context);
          });
        }
      },
    );
    return widget.onIconPressed != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: field),
              const SizedBox(
                height: 20.0,
              ),
              IconButton(
                onPressed: widget.onIconPressed,
                icon: const Icon(Icons.date_range),
              ),
            ],
          )
        : field;
  }
}
