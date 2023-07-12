import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main/l10n/app_localizations.dart';
import '../custom_widgets/buttons/app_text_button.dart';
import '../custom_widgets/list_filter.dart';
import '../custom_widgets/responsive_padding.dart';
import 'business_logic/org_unit_item.dart';
import 'chips_row.widget.dart';
import 'ou_selector_dialog.presenter.dart';
import 'ou_selector_list.widget.dart';

enum OUSelectionType { CAPTURE, SEARCH }

class OuSelectorDialog extends StatefulWidget {
  OuSelectorDialog(
      {super.key,
      required this.title,
      required this.selectedOrgUnit,
      required this.textChangedConsumer,
      required this.onDialogCancelled,
      required this.onClear,
      // required this.initialData,
      required this.ouSelectionType});

  final String title;

  final void Function(String selectedOrgUnitUid, String selectedOrgUnitName)
      textChangedConsumer;
  final void Function() onDialogCancelled;
  final void Function() onClear;

  // private CompositeDisposable disposable;
  final String? selectedOrgUnit;
  final List<OrgUnitItem> initialData = [];
  final OUSelectionType ouSelectionType;

  @override
  State<OuSelectorDialog> createState() => _OuSelectorDialogState();
}

class _OuSelectorDialogState extends State<OuSelectorDialog> {
  final OuSelectorDialogPresenter presenter =
      Get.find<OuSelectorDialogPresenter>();
  // OuSelectorDialogPresenter.instance;

  @override
  Widget build(BuildContext context) {
    presenter.loadOrgUnitItems(widget.ouSelectionType);

    return ResponsivePadding(
      child: Material(
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title),
            const SizedBox(width: 10),
            ListFilter(
              filter: presenter.orgUnitSearchText.value,
              onFilterChanged: (String? value) {
                if (value != null) {
                  presenter.lookUpOrgUnits(value);
                }
              },
            ),
            const SizedBox(width: 10),
            const Divider(height: 1),
            StreamBuilder<List<OrganisationUnit>>(
                stream: presenter.orgUnitsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                        'orgUnitsStream snapshot Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }
                  return ChipsRow(
                      orgUnits: snapshot.data!,
                      clickedItem: (OrganisationUnit ou) {
                        widget.textChangedConsumer
                            .call(ou.id!, ou.displayName!);
                        dismiss();
                      });
                }),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: StreamBuilder<List<OrganisationUnit>>(
            //       stream: presenter.orgUnitsStream,
            //       builder: (context, snapshot) {
            //         if (snapshot.hasError) {
            //           return Text(
            //               'orgUnitsStream snapshot Error: ${snapshot.error}');
            //         }
            //         if (!snapshot.hasData) {
            //           return const SizedBox();
            //         }
            //         return ChipsRow(
            //             orgUnits: snapshot.data!,
            //             clickedItem: (OrganisationUnit ou) {
            //               widget.textChangedConsumer
            //                   .call(ou.id!, ou.displayName!);
            //               dismiss();
            //             });
            //       }),
            // ),
            const Divider(height: 1),
            const SizedBox(width: 10),
            Expanded(
              child: StreamBuilder<List<OrgUnitItem>>(
                  stream: presenter.orgUnitItemsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<OrgUnitItem>> snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                          'orgUnitItemsStream Error: ${snapshot.error}');
                    }
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    }
                    return OuSelectorList(
                      selectedOrgUnit: widget.selectedOrgUnit,
                      items: snapshot.data!,
                      selectionType: widget.ouSelectionType,
                      onNewLevelSelected: (bool canBeSelected) {
                        if (canBeSelected) {
                          presenter.acceptButtonEnabled.value = true;
                        } else {
                          presenter.acceptButtonEnabled.value = false;
                        }
                      },
                    );
                    // return OuSelectorList(
                    //   selectedOrgUnit: widget.selectedOrgUnit,
                    //   items: snapshot.data!,
                    //   selectionType: widget.ouSelectionType,
                    //   onNewLevelSelected: (bool canBeSelected) {
                    //     if (canBeSelected) {
                    //       presenter.acceptButtonEnabled.value = true;
                    //     } else {
                    //       presenter.acceptButtonEnabled.value = false;
                    //     }
                    //   },
                    // );
                  }),
            ),
            const SizedBox(width: 20),
            _bottomBtnsRow(context)
          ],
        ),
      ),
    );

    // return LayoutBuilder(
    //   // height: MediaQuery.of(context).size.height,
    //   // width: MediaQuery.of(context).size.width,
    //   builder: (BuildContext context, BoxConstraints constraints) {
    //     return Container(
    //       // height: constraints.maxHeight - 100,
    //       // width: constraints.maxWidth -100,
    //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
    //           .copyWith(right: 32),
    //       child: SingleChildScrollView(
    //         physics: const NeverScrollableScrollPhysics(),
    //         child: SizedBox(
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height * 0.9,
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(widget.title),
    //               const SizedBox(width: 10),
    //               ListFilter(
    //                 filter: presenter.orgUnitSearchText.value,
    //                 onFilterChanged: (String? value) {
    //                   if (value != null) {
    //                     presenter.lookUpOrgUnits(value);
    //                   }
    //                 },
    //               ),
    //               const SizedBox(width: 10),
    //               const Divider(height: 1),
    //               StreamBuilder<List<OrganisationUnit>>(
    //                   stream: presenter.orgUnitsStream,
    //                   builder: (context, snapshot) {
    //                     if (snapshot.hasError) {
    //                       return Text(
    //                           'orgUnitsStream snapshot Error: ${snapshot.error}');
    //                     }
    //                     if (!snapshot.hasData) {
    //                       return const SizedBox();
    //                     }
    //                     return ChipsRow(
    //                         orgUnits: snapshot.data!,
    //                         clickedItem: (OrganisationUnit ou) {
    //                           widget.textChangedConsumer
    //                               .call(ou.id!, ou.displayName!);
    //                           dismiss();
    //                         });
    //                   }),
    //               // SingleChildScrollView(
    //               //   scrollDirection: Axis.horizontal,
    //               //   child: StreamBuilder<List<OrganisationUnit>>(
    //               //       stream: presenter.orgUnitsStream,
    //               //       builder: (context, snapshot) {
    //               //         if (snapshot.hasError) {
    //               //           return Text(
    //               //               'orgUnitsStream snapshot Error: ${snapshot.error}');
    //               //         }
    //               //         if (!snapshot.hasData) {
    //               //           return const SizedBox();
    //               //         }
    //               //         return ChipsRow(
    //               //             orgUnits: snapshot.data!,
    //               //             clickedItem: (OrganisationUnit ou) {
    //               //               widget.textChangedConsumer
    //               //                   .call(ou.id!, ou.displayName!);
    //               //               dismiss();
    //               //             });
    //               //       }),
    //               // ),
    //               const Divider(height: 1),
    //               const SizedBox(width: 10),
    //               StreamBuilder<List<OrgUnitItem>>(
    //                   stream: presenter.orgUnitItemsStream,
    //                   builder: (BuildContext context,
    //                       AsyncSnapshot<List<OrgUnitItem>> snapshot) {
    //                     if (snapshot.hasError) {
    //                       return Text(
    //                           'orgUnitItemsStream Error: ${snapshot.error}');
    //                     }
    //                     if (!snapshot.hasData) {
    //                       return const SizedBox();
    //                     }
    //                     return Expanded(child: OuSelectorList(
    //                       selectedOrgUnit: widget.selectedOrgUnit,
    //                       items: snapshot.data!,
    //                       selectionType: widget.ouSelectionType,
    //                       onNewLevelSelected: (bool canBeSelected) {
    //                         if (canBeSelected) {
    //                           presenter.acceptButtonEnabled.value = true;
    //                         } else {
    //                           presenter.acceptButtonEnabled.value = false;
    //                         }
    //                       },
    //                     ));
    //                     // return OuSelectorList(
    //                     //   selectedOrgUnit: widget.selectedOrgUnit,
    //                     //   items: snapshot.data!,
    //                     //   selectionType: widget.ouSelectionType,
    //                     //   onNewLevelSelected: (bool canBeSelected) {
    //                     //     if (canBeSelected) {
    //                     //       presenter.acceptButtonEnabled.value = true;
    //                     //     } else {
    //                     //       presenter.acceptButtonEnabled.value = false;
    //                     //     }
    //                     //   },
    //                     // );
    //                   }),
    //               const SizedBox(width: 20),
    //               _bottomBtnsRow(context)
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _bottomBtnsRow(BuildContext context) {
    final AppLocalization localization = AppLocalization.of(context)!;
    return Expanded(
      child: Row(
        children: <Widget>[
          AppTextButton(
            label: localization.lookup('clear'),
            onPressed: () {
              // showChips([]);
              // setAdapter(initialData);
              presenter.orgUnitSearchText.value = null;
              presenter.orgUnits.assignAll([]);
              presenter.orgUnitItems.assignAll(widget.initialData);
              presenter.acceptButtonEnabled.value = false;
              widget.onClear();
              dismiss();
            },
          ),
          AppTextButton(
            label: localization.lookup('cancel'),
            onPressed: () {
              widget.onDialogCancelled();
              presenter.orgUnitSearchText.value = null;
              dismiss();
            },
          ),
          Obx(() => AppTextButton(
                label: localization.lookup('accept'),
                onPressed: presenter.acceptButtonEnabled.value
                    ? () async {
                        presenter.orgUnitSearchText.value = null;
                        // showChips([]);
                        final String? selectedOrgUnitUid =
                            presenter.getSelectedOrgUnit();
                        if (selectedOrgUnitUid != null) {
                          D2Remote.organisationUnitModule.organisationUnit
                              .getOne()
                              .then((OrganisationUnit? ou) {
                            widget.textChangedConsumer
                                .call(selectedOrgUnitUid, ou!.displayName!);
                            presenter.orgUnitSearchText.value = null;
                            dismiss();
                          });
                        }
                      }
                    : null,
              )),
        ],
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
    Get.delete<OuSelectorDialogPresenter>(force: true);
  }

  @override
  void didChangeDependencies() {
    /// This method is most used by subclasses in cases when network fetches
    /// need to take place following a dependancy change which would otherwise
    /// prove too expensive to do for every build.

    presenter.loadOrgUnitItems(widget.ouSelectionType).then((_) {
      widget.initialData.addAll(presenter.orgUnitItems.value);
    });
    super.didChangeDependencies();
  }
}
