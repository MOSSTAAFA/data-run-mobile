import 'package:flutter/material.dart';

class AppDialog extends Dialog {
  const AppDialog({
    Key? key,
    this.isDividedBtnFormat = false,
    this.description,
    this.subTitle,
    this.onLeftBtnClicked,
    this.leftBtnText,
    required this.btnText,
    required this.onBtnClicked,
    required this.title,
  }) : super(key: key);

  factory AppDialog.singleBtn({
    required String title,
    required VoidCallback onBtnClicked,
    String? subTitle,
    String? description,
    String? btnContent,
  }) =>
      AppDialog(
        title: title,
        subTitle: subTitle,
        onBtnClicked: onBtnClicked,
        description: description,
        btnText: btnContent,
      );

  factory AppDialog.dividedBtn({
    required String title,
    String? description,
    String? subTitle,
    required String leftBtnContent,
    required String rightBtnContent,
    required VoidCallback onRightBtnClicked,
    required VoidCallback onLeftBtnClicked,
  }) =>
      AppDialog(
        isDividedBtnFormat: true,
        title: title,
        subTitle: subTitle,
        onBtnClicked: onRightBtnClicked,
        onLeftBtnClicked: onLeftBtnClicked,
        description: description,
        leftBtnText: leftBtnContent,
        btnText: rightBtnContent,
      );

  final bool isDividedBtnFormat;
  final String title;
  final String? description;
  final VoidCallback onBtnClicked;
  final VoidCallback? onLeftBtnClicked;
  final String? btnText;
  final String? leftBtnText;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        // margin: AppInset.horizontal16,
        constraints: const BoxConstraints(minHeight: 120, maxWidth: 256),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // color: AppColor.strongGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34) +
                  const EdgeInsets.only(top: 18, bottom: 19),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      title,
                      // style: AppTextStyle.title3.copyWith(color: AppColor.main),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // AppSpace.size12,
                  if (subTitle?.isNotEmpty ?? false) ...[
                    Text(
                      subTitle!,
                      // style: AppTextStyle.alert1,
                      textAlign: TextAlign.center,
                    ),
                    // AppSpace.size2,
                  ],
                  if (description?.isNotEmpty ?? false) ...[
                    Center(
                      child: Text(
                        description!,
                        textAlign: TextAlign.center,
                        // style: AppTextStyle.desc
                        //     .copyWith(color: AppColor.lightGrey, height: 1.3),
                      ),
                    )
                  ]
                ],
              ),
            ),

            // If the dialog is in a format with a single button, return the widget below
            if (isDividedBtnFormat)
              Container(
                height: 44,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        onPressed: onLeftBtnClicked,
                        child: Center(
                          child: Text(
                            leftBtnText!,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 0.5,
                    ),
                    Expanded(
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        onPressed: onBtnClicked,
                        child: Center(
                          child: Text(
                            btnText ?? 'Confirm',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // If the dialog is in a format with a single button, return the widget below
            if (!isDividedBtnFormat)
              MaterialButton(
                padding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                onPressed: onBtnClicked,
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      btnText ?? 'Confirm',
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
