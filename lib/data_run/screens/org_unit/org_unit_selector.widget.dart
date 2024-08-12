import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a simple OrgUnit model
class OrgUnit {
  final String id;
  final String name;
  final int level;

  OrgUnit({required this.id, required this.name, required this.level});
}

// Define the providers
final orgUnitsProvider = StateNotifierProvider<OrgUnitsNotifier, List<OrgUnit>>(
      (ref) => OrgUnitsNotifier(),
);

final orgUnitFilterProvider = StateProvider<String?>((ref) => null);

class OrgUnitsNotifier extends StateNotifier<List<OrgUnit>> {
  OrgUnitsNotifier() : super([]);

  // Simulate loading org units
  void loadOrgUnits() {
    // Replace with actual data fetching
    state = [
      OrgUnit(id: '1', name: 'OrgUnit 1', level: 1),
      OrgUnit(id: '2', name: 'OrgUnit 2', level: 2),
      // Add more OrgUnits here
    ];
  }

  void filterOrgUnits(String? filter) {
    if (filter == null || filter.isEmpty) {
      loadOrgUnits();
    } else {
      state = state
          .where((orgUnit) => orgUnit.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }
}

// OrgUnit Selector Dialog
class OrgUnitSelectorDialog extends ConsumerWidget {
  final String title;
  final void Function(String selectedOrgUnitId, String selectedOrgUnitName)
  onOrgUnitSelected;
  final void Function() onDialogCancelled;

  const OrgUnitSelectorDialog({
    super.key,
    required this.title,
    required this.onOrgUnitSelected,
    required this.onDialogCancelled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgUnits = ref.watch(orgUnitsProvider);
    final filter = ref.watch(orgUnitFilterProvider);

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 10),
          _OrgUnitFilter(),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: orgUnits.length,
              itemBuilder: (context, index) {
                final orgUnit = orgUnits[index];
                return ListTile(
                  title: Text(orgUnit.name),
                  onTap: () {
                    onOrgUnitSelected(orgUnit.id, orgUnit.name);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(orgUnitFilterProvider.notifier).state = null;
                  ref.read(orgUnitsProvider.notifier).loadOrgUnits();
                },
                child: const Text('Clear'),
              ),
              TextButton(
                onPressed: () {
                  onDialogCancelled();
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// OrgUnit Filter Widget
class _OrgUnitFilter extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterController = TextEditingController(
      text: ref.read(orgUnitFilterProvider),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: filterController,
        decoration: InputDecoration(
          labelText: 'Search Org Units',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              filterController.clear();
              ref.read(orgUnitFilterProvider.notifier).state = null;
              ref.read(orgUnitsProvider.notifier).loadOrgUnits();
            },
          ),
        ),
        onChanged: (value) {
          ref.read(orgUnitFilterProvider.notifier).state = value;
          ref.read(orgUnitsProvider.notifier).filterOrgUnits(value);
        },
      ),
    );
  }
}

