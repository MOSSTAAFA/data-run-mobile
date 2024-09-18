final Map<String, dynamic> formSampleData = {
  'status': 'ACTIVE',
  'form': 'form',
  'version': 1,
  'activity': 'this.activity',
  'team': 'this.team',
  'orgUnit': 'this.orgUnit!',
  'uid': 'abc123',
  'name': 'inventoryForm',
  'fields': [
    {
      'name': 'region',
      'type': 'SelectOne',
      'mandatory': true,
      'listName': 'regions',
      'path': 'region',
      'label': { 'en': 'Region', 'ar': 'المنطقة' }
    },
    {
      'name': 'country',
      'type': 'SelectOne',
      'mandatory': true,
      'listName': 'countries',
      'choiceFilter': 'regionFilter == region',
      'path': 'country',
      'label': { 'en': 'Country', 'ar': 'الدولة' }
    },
    {
      'name': 'warehouse',
      'type': 'SelectOne',
      'mandatory': true,
      'listName': 'warehouses',
      'choiceFilter': 'countryFilter == country',
      'path': 'warehouse',
      'label': { 'en': 'Warehouse', 'ar': 'المخزن' }
    },
    {
      'name': 'itemType',
      'type': 'SelectOne',
      'mandatory': true,
      'listName': 'itemTypes',
      'path': 'itemType',
      'label': { 'en': 'Item Type', 'ar': 'نوع العنصر' }
    },
    {
      'name': 'quantity',
      'type': 'Integer',
      'mandatory': true,
      'path': 'quantity',
      'label': { 'en': 'Quantity', 'ar': 'الكمية' },
      'rules': [
        {
          'expression': "itemType == 'fragile'",
          'action': 'Show',
          'dependencies': ['itemType']
        },
        {
          'expression': 'quantity < 10',
          'action': 'Error',
          'errorMessage': 'Quantity must be greater than or equal to 10',
          'dependencies': ['quantity']
        }
      ]
    }
  ],
  'options': [
    {
      'listName': 'regions',
      'name': 'northAmerica'
    },
    {
      'listName': 'regions',
      'name': 'europe'
    },
    {
      'listName': 'countries',
      'name': 'us',
      'regionFilter': 'northAmerica'
    },
    {
      'listName': 'countries',
      'name': 'ca',
      'regionFilter': 'northAmerica'
    },
    {
      'listName': 'countries',
      'name': 'de',
      'regionFilter': 'europe'
    },
    {
      'listName': 'countries',
      'name': 'fr',
      'regionFilter': 'europe'
    },
    {
      'listName': 'warehouses',
      'name': 'Warehouse A',
      'countryFilter': 'us'
    },
    {
      'listName': 'warehouses',
      'name': 'Warehouse B',
      'countryFilter': 'ca'
    },
    {
      'listName': 'warehouses',
      'name': 'Warehouse C',
      'countryFilter': 'de'
    },
    {
      'listName': 'warehouses',
      'name': 'Warehouse D',
      'countryFilter': 'fr'
    },
    {
      'listName': 'itemTypes',
      'name': 'fragile'
    },
    {
      'listName': 'itemTypes',
      'name': 'non-fragile'
    }
  ]
};