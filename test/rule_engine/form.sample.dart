final List<Map<String, dynamic>> formSample = [
  {
    'createdBy': null,
    'createdDate': '2024-09-27T17:38:17.510Z',
    'lastModifiedBy': 'admin',
    'lastModifiedDate': '2024-09-27T17:38:17.555Z',
    'id': '66f6ebb160a4fb56d7c477af',
    'uid': 'H111PfAo8kh',
    'code': 'inventoryForm',
    'name': 'inventoryForm',
    'description': 'inventoryForm description',
    'disabled': false,
    'activity': 'HZS0PfAo8kh',
    'version': 2,
    'defaultLocal': 'en',
    'fields': [
      {
        'order': 1,
        'name': 'regionInfo',
        'description': 'regionInfo section description',
        'type': 'Section',
        'mandatory': true,
        'mainField': null,
        'rules': [],
        'listName': null,
        'referenceInfo': null,
        'choiceFilter': null,
        'label': {'en': 'Main Info', 'ar': 'بيانات الحركة'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'regionInfo',
        'fields': [
          {
            'order': 1,
            'name': 'region',
            'description': 'region description',
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': null,
            'rules': [],
            'listName': 'regions',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'Region', 'ar': 'المنطقة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'regionInfo',
            'path': 'regionInfo.region',
            'fields': []
          },
          {
            'order': 2,
            'name': 'country',
            'description': 'country',
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': null,
            'rules': [],
            'listName': 'countries',
            'referenceInfo': null,
            'choiceFilter': 'regionFilter == #{region}',
            'label': {'en': 'Country', 'ar': 'الدولة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'regionInfo',
            'path': 'regionInfo.country',
            'fields': []
          }
        ]
      },
      {
        'order': 2,
        'name': 'warehouse',
        'description': null,
        'type': 'SelectOne',
        'mandatory': true,
        'mainField': null,
        'rules': [],
        'listName': 'warehouses',
        'referenceInfo': null,
        'choiceFilter': 'countryFilter == #{country}',
        'label': {'en': 'Warehouse', 'ar': 'المخزن'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'warehouse',
        'fields': []
      },
      {
        'order': 3,
        'name': 'transactionInfo',
        'description': 'transaction Info description',
        'type': 'Section',
        'mandatory': true,
        'mainField': null,
        'rules': [],
        'listName': null,
        'referenceInfo': null,
        'choiceFilter': null,
        'label': {'en': 'Transaction Info', 'ar': 'معلومات الحركة'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'transactionInfo',
        'fields': [
          {
            'order': 1,
            'name': 'transaction',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': true,
            'rules': [],
            'listName': 'transactions',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'transactions', 'ar': 'نوع الحركة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.transaction',
            'fields': []
          },
          {
            'order': 2,
            'name': 'transactionDate',
            'description': null,
            'type': 'Date',
            'mandatory': true,
            'mainField': true,
            'rules': [],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'transaction Date', 'ar': 'تاريخ الحركة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.transactionDate',
            'fields': []
          },
          {
            'order': 3,
            'name': 'voucherId',
            'description': null,
            'type': 'Integer',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'supply' || #{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'voucherId', 'ar': 'رقم الفاتورة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.voucherId',
            'fields': []
          },
          {
            'order': 4,
            'name': 'voucherDate',
            'description': null,
            'type': 'Date',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'supply' || #{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'voucherDate', 'ar': 'تاريخ الفاتورة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.voucherDate',
            'fields': []
          },
          {
            'order': 5,
            'name': 'supplier',
            'description': null,
            'type': 'Text',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'supplier', 'ar': 'المورد'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.supplier',
            'fields': []
          },
          {
            'order': 6,
            'name': 'distinationWarehouse',
            'description': null,
            'type': 'OrganisationUnit',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'distinationWarehouse', 'ar': 'الجهة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'transactionInfo',
            'path': 'transactionInfo.distinationWarehouse',
            'fields': []
          }
        ]
      },
      {
        'order': 4,
        'name': 'stockItems',
        'description': 'RepeatableSection description',
        'type': 'RepeatableSection',
        'mandatory': null,
        'mainField': null,
        'rules': [],
        'listName': null,
        'referenceInfo': null,
        'choiceFilter': null,
        'label': {'en': 'Stock Items Data', 'ar': 'عناصر الحركة'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'stockItems',
        'fields': [
          {
            'order': 1,
            'name': 'itemType',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': null,
            'rules': [],
            'listName': 'stockItems',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'Item Type', 'ar': 'نوع العنصر'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.itemType',
            'fields': []
          },
          {
            'order': 2,
            'name': 'quantityReceived',
            'description': null,
            'type': 'Integer',
            'mandatory': true,
            'mainField': null,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              },
              {
                'expression': '#{transaction} >= 10',
                'action': 'Error',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'Quantity Received', 'ar': 'الكمية المستلمة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.quantityReceived',
            'fields': []
          },
          {
            'order': 3,
            'name': 'quantityDispensed',
            'description': null,
            'type': 'Integer',
            'mandatory': true,
            'mainField': null,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              },
              {
                'expression': '#{transaction} >= 10',
                'action': 'Error',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {
              'en': 'Quantity Dispensed/Returned',
              'ar': 'الكمية المصروفة أو المرتجعة'
            },
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.quantityDispensed',
            'fields': []
          },
          {
            'order': 4,
            'name': 'uom',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': null,
            'rules': [],
            'listName': 'uoms',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'UOM', 'ar': 'الوحدة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.uom',
            'fields': []
          }
        ]
      }
    ],
    'options': [
      {
        'listName': 'regions',
        'name': 'northAmerica',
        'order': null,
        'label': {'en': 'northAmerica'},
        'properties': {}
      },
      {
        'listName': 'regions',
        'name': 'europe',
        'order': null,
        'label': {'en': 'europe'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'cassette',
        'order': 3,
        'label': {'en': 'cassette', 'ar': 'كاست'},
        'properties': {
          'stockItemFilter': 'DRDT',
          'transactionFilter': ['dispense', 'return', 'expiry']
        }
      },
      {
        'listName': 'uoms',
        'name': 'Tape6Tablets',
        'order': 6,
        'label': {'en': 'Tape 6 Tablets', 'ar': 'شريط 6 اقراص'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'PMQ7.5MG',
        'order': 8,
        'label': {'en': 'PMQ7.5MG', 'ar': 'بريماكوين 7.5 مجم'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'Tape10Tablets',
        'order': 5,
        'label': {'en': 'Tape10Tablets', 'ar': 'شريط 10 اقراص'},
        'properties': {'stockItemFilter': 'PMQ7.5MG'}
      },
      {
        'listName': 'stockItems',
        'name': 'PMQ15MG',
        'order': 9,
        'label': {'en': 'PMQ15MG', 'ar': 'بريماكوين 15 مجم'},
        'properties': {}
      },
      {
        'listName': 'countries',
        'name': 'us',
        'order': null,
        'label': {'en': 'us'},
        'properties': {'regionFilter': 'northAmerica'}
      },
      {
        'listName': 'countries',
        'name': 'ca',
        'order': null,
        'label': {'en': 'ca'},
        'properties': {'regionFilter': 'northAmerica'}
      },
      {
        'listName': 'uoms',
        'name': 'Kit10Test',
        'order': 2,
        'label': {'en': 'Kit10Test', 'ar': 'كت 10 اشرطة'},
        'properties': {'stockItemFilter': 'DRDT', 'transactionFilter': 'supply'}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT20MG',
        'order': 4,
        'label': {'en': 'ACT20MG', 'ar': 'كوارتم 20'},
        'properties': {}
      },
      {
        'listName': 'countries',
        'name': 'de',
        'order': null,
        'label': {'en': 'de'},
        'properties': {'regionFilter': 'europe'}
      },
      {
        'listName': 'countries',
        'name': 'fr',
        'order': null,
        'label': {'en': 'fr'},
        'properties': {'regionFilter': 'europe'}
      },
      {
        'listName': 'uoms',
        'name': 'Ampoule',
        'order': 4,
        'label': {'en': 'Ampoule', 'ar': 'امبولة'},
        'properties': {'stockItemFilter': 'ARTING60MG'}
      },
      {
        'listName': 'transactions',
        'name': 'supply',
        'order': 2,
        'label': {'en': 'Supply', 'ar': 'توريد'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'uoms',
        'name': 'Tablet',
        'order': 7,
        'label': {'en': 'Tablet', 'ar': 'قرص'},
        'properties': {}
      },
      {
        'listName': 'warehouses',
        'name': 'Warehouse A',
        'order': null,
        'label': {'en': 'Warehouse A'},
        'properties': {'countryFilter': 'us'}
      },
      {
        'listName': 'warehouses',
        'name': 'Warehouse B',
        'order': null,
        'label': {'en': 'Warehouse B'},
        'properties': {'countryFilter': 'ca'}
      },
      {
        'listName': 'warehouses',
        'name': 'Warehouse C',
        'order': null,
        'label': {'en': 'Warehouse C'},
        'properties': {'countryFilter': 'de'}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT40MG',
        'order': 3,
        'label': {'en': 'ACT40MG', 'ar': 'كوارتم 40'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'MRDT',
        'order': 5,
        'label': {'en': 'MRDT', 'ar': 'الفحص السريع للملاريا'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT60MG',
        'order': 2,
        'label': {'en': 'ACT60MG', 'ar': 'كوارتم 60'},
        'properties': {}
      },
      {
        'listName': 'warehouses',
        'name': 'Warehouse D',
        'order': null,
        'label': {'en': 'Warehouse D'},
        'properties': {'countryFilter': 'fr'}
      },
      {
        'listName': 'stockItems',
        'name': 'ARTING60MG',
        'order': 7,
        'label': {'en': 'ARTING60MG', 'ar': 'ارتيسونات 60 مجم امبول'},
        'properties': {}
      },
      {
        'listName': 'transactions',
        'name': 'return',
        'order': 4,
        'label': {'en': 'return', 'ar': 'مرتجع'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'transactions',
        'name': 'expiry',
        'order': 5,
        'label': {'en': 'expiry', 'ar': 'منتهي'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT80MG',
        'order': 1,
        'label': {'en': 'ACT80MG', 'ar': 'كوارتم 80'},
        'properties': {}
      },
      {
        'listName': 'transactions',
        'name': 'inventory',
        'order': 1,
        'label': {'en': 'Inventory', 'ar': 'جرد'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'uoms',
        'name': 'Kit25Test',
        'order': 1,
        'label': {'en': 'Kit25Test', 'ar': 'كت 25 شريط'},
        'properties': {'stockItemFilter': 'DRDT'}
      },
      {
        'listName': 'transactions',
        'name': 'dispense',
        'order': 3,
        'label': {'en': 'dispense', 'ar': 'صرف'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'transactions',
        'name': 'consumption',
        'order': 6,
        'label': {'en': 'consumption', 'ar': 'استهلاك'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'stockItems',
        'name': 'DRDT',
        'order': 6,
        'label': {'en': 'DRDT', 'ar': 'الفحص السريع للضنك'},
        'properties': {}
      }
    ],
    'optionSets': [
      {
        'listName': 'regions',
        'options': [
          {
            'listName': 'regions',
            'name': 'northAmerica',
            'order': null,
            'label': {'en': 'northAmerica'},
            'properties': {}
          },
          {
            'listName': 'regions',
            'name': 'europe',
            'order': null,
            'label': {'en': 'europe'},
            'properties': {}
          }
        ]
      },
      {
        'listName': 'countries',
        'options': [
          {
            'listName': 'countries',
            'name': 'us',
            'order': null,
            'label': {'en': 'us'},
            'properties': {'regionFilter': 'northAmerica'}
          },
          {
            'listName': 'countries',
            'name': 'ca',
            'order': null,
            'label': {'en': 'ca'},
            'properties': {'regionFilter': 'northAmerica'}
          },
          {
            'listName': 'countries',
            'name': 'de',
            'order': null,
            'label': {'en': 'de'},
            'properties': {'regionFilter': 'europe'}
          },
          {
            'listName': 'countries',
            'name': 'fr',
            'order': null,
            'label': {'en': 'fr'},
            'properties': {'regionFilter': 'europe'}
          }
        ]
      },
      {
        'listName': 'transactions',
        'options': [
          {
            'listName': 'transactions',
            'name': 'inventory',
            'order': 1,
            'label': {'en': 'Inventory', 'ar': 'جرد'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          },
          {
            'listName': 'transactions',
            'name': 'supply',
            'order': 2,
            'label': {'en': 'Supply', 'ar': 'توريد'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          },
          {
            'listName': 'transactions',
            'name': 'dispense',
            'order': 3,
            'label': {'en': 'dispense', 'ar': 'صرف'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          },
          {
            'listName': 'transactions',
            'name': 'return',
            'order': 4,
            'label': {'en': 'return', 'ar': 'مرتجع'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          },
          {
            'listName': 'transactions',
            'name': 'expiry',
            'order': 5,
            'label': {'en': 'expiry', 'ar': 'منتهي'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          },
          {
            'listName': 'transactions',
            'name': 'consumption',
            'order': 6,
            'label': {'en': 'consumption', 'ar': 'استهلاك'},
            'properties': {'age': 0, 'phone': '', 'code': ''}
          }
        ]
      },
      {
        'listName': 'uoms',
        'options': [
          {
            'listName': 'uoms',
            'name': 'Kit25Test',
            'order': 1,
            'label': {'en': 'Kit25Test', 'ar': 'كت 25 شريط'},
            'properties': {'stockItemFilter': 'DRDT'}
          },
          {
            'listName': 'uoms',
            'name': 'Kit10Test',
            'order': 2,
            'label': {'en': 'Kit10Test', 'ar': 'كت 10 اشرطة'},
            'properties': {
              'stockItemFilter': 'DRDT',
              'transactionFilter': 'supply'
            }
          },
          {
            'listName': 'uoms',
            'name': 'cassette',
            'order': 3,
            'label': {'en': 'cassette', 'ar': 'كاست'},
            'properties': {
              'stockItemFilter': 'DRDT',
              'transactionFilter': ['dispense', 'return', 'expiry']
            }
          },
          {
            'listName': 'uoms',
            'name': 'Ampoule',
            'order': 4,
            'label': {'en': 'Ampoule', 'ar': 'امبولة'},
            'properties': {'stockItemFilter': 'ARTING60MG'}
          },
          {
            'listName': 'uoms',
            'name': 'Tape10Tablets',
            'order': 5,
            'label': {'en': 'Tape10Tablets', 'ar': 'شريط 10 اقراص'},
            'properties': {'stockItemFilter': 'PMQ7.5MG'}
          },
          {
            'listName': 'uoms',
            'name': 'Tape6Tablets',
            'order': 6,
            'label': {'en': 'Tape 6 Tablets', 'ar': 'شريط 6 اقراص'},
            'properties': {}
          },
          {
            'listName': 'uoms',
            'name': 'Tablet',
            'order': 7,
            'label': {'en': 'Tablet', 'ar': 'قرص'},
            'properties': {}
          }
        ]
      },
      {
        'listName': 'stockItems',
        'options': [
          {
            'listName': 'stockItems',
            'name': 'ACT80MG',
            'order': 1,
            'label': {'en': 'ACT80MG', 'ar': 'كوارتم 80'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'ACT60MG',
            'order': 2,
            'label': {'en': 'ACT60MG', 'ar': 'كوارتم 60'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'ACT40MG',
            'order': 3,
            'label': {'en': 'ACT40MG', 'ar': 'كوارتم 40'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'ACT20MG',
            'order': 4,
            'label': {'en': 'ACT20MG', 'ar': 'كوارتم 20'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'MRDT',
            'order': 5,
            'label': {'en': 'MRDT', 'ar': 'الفحص السريع للملاريا'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'DRDT',
            'order': 6,
            'label': {'en': 'DRDT', 'ar': 'الفحص السريع للضنك'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'ARTING60MG',
            'order': 7,
            'label': {'en': 'ARTING60MG', 'ar': 'ارتيسونات 60 مجم امبول'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'PMQ7.5MG',
            'order': 8,
            'label': {'en': 'PMQ7.5MG', 'ar': 'بريماكوين 7.5 مجم'},
            'properties': {}
          },
          {
            'listName': 'stockItems',
            'name': 'PMQ15MG',
            'order': 9,
            'label': {'en': 'PMQ15MG', 'ar': 'بريماكوين 15 مجم'},
            'properties': {}
          }
        ]
      },
      {
        'listName': 'warehouses',
        'options': [
          {
            'listName': 'warehouses',
            'name': 'Warehouse A',
            'order': null,
            'label': {'en': 'Warehouse A'},
            'properties': {'countryFilter': 'us'}
          },
          {
            'listName': 'warehouses',
            'name': 'Warehouse B',
            'order': null,
            'label': {'en': 'Warehouse B'},
            'properties': {'countryFilter': 'ca'}
          },
          {
            'listName': 'warehouses',
            'name': 'Warehouse C',
            'order': null,
            'label': {'en': 'Warehouse C'},
            'properties': {'countryFilter': 'de'}
          },
          {
            'listName': 'warehouses',
            'name': 'Warehouse D',
            'order': null,
            'label': {'en': 'Warehouse D'},
            'properties': {'countryFilter': 'fr'}
          }
        ]
      }
    ],
    'orgUnits': [],
    'label': {'en': 'Malaria Drugs Supply', 'ar': 'توزيع أدوية الملاريا'},
    'displayName': 'inventoryForm',
    'translations': []
  },
  {
    'createdBy': null,
    'createdDate': '2024-08-29T23:12:06.258Z',
    'lastModifiedBy': 'admin',
    'lastModifiedDate': '2024-08-29T23:13:07.886Z',
    'id': '66cfb1604ece1975029b7797',
    'uid': 'bo9rJr1TNg1',
    'code': null,
    'name': 'bookkeeping',
    'description': null,
    'disabled': false,
    'activity': 'U42up6b3mbG',
    'version': 1,
    'defaultLocal': 'en',
    'fields': [
      {
        'order': 1,
        'name': 'mainSection',
        'description': null,
        'type': 'Section',
        'mandatory': null,
        'mainField': null,
        'rules': [],
        'listName': null,
        'referenceInfo': null,
        'choiceFilter': null,
        'label': {'en': 'Main Info', 'ar': 'بيانات الحركة'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'mainSection',
        'fields': [
          {
            'order': 1,
            'name': 'transaction',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': true,
            'rules': [],
            'listName': 'transactions',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'transactions', 'ar': 'نوع الحركة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.transaction',
            'fields': []
          },
          {
            'order': 2,
            'name': 'transactionDate',
            'description': null,
            'type': 'Date',
            'mandatory': true,
            'mainField': true,
            'rules': [],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'transaction Date', 'ar': 'تاريخ الحركة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.transactionDate',
            'fields': []
          },
          {
            'order': 3,
            'name': 'voucherId',
            'description': null,
            'type': 'Integer',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'supply' || #{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'voucherId', 'ar': 'رقم الفاتورة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.voucherId',
            'fields': []
          },
          {
            'order': 4,
            'name': 'voucherDate',
            'description': null,
            'type': 'Date',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'supply' || #{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'voucherDate', 'ar': 'تاريخ الفاتورة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.voucherDate',
            'fields': []
          },
          {
            'order': 5,
            'name': 'supplier',
            'description': null,
            'type': 'Text',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression': "transaction == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'supplier', 'ar': 'المورد'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.supplier',
            'fields': []
          },
          {
            'order': 6,
            'name': 'distinationWarehouse',
            'description': null,
            'type': 'OrganisationUnit',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression':
                    "#{transaction} == 'dispense' || #{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'distinationWarehouse', 'ar': 'الجهة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.distinationWarehouse',
            'fields': []
          },
          {
            'order': 7,
            'name': 'recievedBy',
            'description': null,
            'type': 'FullName',
            'mandatory': true,
            'mainField': true,
            'rules': [
              {
                'expression': "#{transaction} == 'dispense'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'recievedBy', 'ar': 'مستلم الكمية'},
            'calculation': null,
            'defaultValue': null,
            'section': 'mainSection',
            'path': 'mainSection.recievedBy',
            'fields': []
          }
        ]
      },
      {
        'order': 2,
        'name': 'stockItems',
        'description': null,
        'type': 'RepeatableSection',
        'mandatory': null,
        'mainField': null,
        'rules': [],
        'listName': null,
        'referenceInfo': null,
        'choiceFilter': null,
        'label': {'en': 'Stock Items Data', 'ar': 'عناصر الحركة'},
        'calculation': null,
        'defaultValue': null,
        'section': null,
        'path': 'stockItems',
        'fields': [
          {
            'order': 9,
            'name': 'batchNumber',
            'description': null,
            'type': 'Text',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'batchNumber', 'ar': 'رقم التشغيلة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.batchNumber',
            'fields': []
          },
          {
            'order': 8,
            'name': 'stockItem',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': true,
            'rules': [],
            'listName': 'stockItems',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'stockItem', 'ar': 'الصنف'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.stockItem',
            'fields': []
          },
          {
            'order': 10,
            'name': 'barcode',
            'description': null,
            'type': 'Text',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'barcode', 'ar': 'الباركود'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.barcode',
            'fields': []
          },
          {
            'order': 19,
            'name': 'currency',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': '#{amount} > 0',
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': 'currencies',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'currency', 'ar': 'العملة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.currency',
            'fields': []
          },
          {
            'order': 11,
            'name': 'inventoryQuantity',
            'description': null,
            'type': 'IntegerPositive',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'inventory'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'inventoryQuantity', 'ar': 'كمية الجرد'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.inventoryQuantity',
            'fields': []
          },
          {
            'order': 12,
            'name': 'recievedQuantity',
            'description': null,
            'type': 'IntegerPositive',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {
              'en': 'recievedQuantity',
              'ar': 'الكمية المستلمة (الموردة)'
            },
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.recievedQuantity',
            'fields': []
          },
          {
            'order': 13,
            'name': 'deliveredQuantity',
            'description': null,
            'type': 'IntegerPositive',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'dispense'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'deliveredQuantity', 'ar': 'الكمية المصروفة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.deliveredQuantity',
            'fields': []
          },
          {
            'order': 20,
            'name': 'expiryDate',
            'description': null,
            'type': 'Date',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'expiryDate', 'ar': 'تاريخ الانتهاء'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.expiryDate',
            'fields': []
          },
          {
            'order': 14,
            'name': 'returnedQuantity',
            'description': null,
            'type': 'IntegerPositive',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'return'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'returnedQuantity', 'ar': 'الكمية المرتجعة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.returnedQuantity',
            'fields': []
          },
          {
            'order': 15,
            'name': 'expiredQuantity',
            'description': null,
            'type': 'IntegerPositive',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'expiry'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'expiredQuantity', 'ar': 'الكمية المنتهية'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.expiredQuantity',
            'fields': []
          },
          {
            'order': 16,
            'name': 'uom',
            'description': null,
            'type': 'SelectOne',
            'mandatory': true,
            'mainField': false,
            'rules': [],
            'listName': 'uoms',
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'uom', 'ar': 'وحدة القياس'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.uom',
            'fields': []
          },
          {
            'order': 17,
            'name': 'unitPrice',
            'description': null,
            'type': 'Number',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': '#{amount} > 0',
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'unitPrice', 'ar': 'سعر الوحدة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.unitPrice',
            'fields': []
          },
          {
            'order': 18,
            'name': 'amount',
            'description': null,
            'type': 'Number',
            'mandatory': true,
            'mainField': false,
            'rules': [
              {
                'expression': "#{transaction} == 'supply'",
                'action': 'Show',
                'message': null,
                'filterInfo': null
              }
            ],
            'listName': null,
            'referenceInfo': null,
            'choiceFilter': null,
            'label': {'en': 'amount', 'ar': 'القيمة'},
            'calculation': null,
            'defaultValue': null,
            'section': 'stockItems',
            'path': 'stockItems.amount',
            'fields': []
          }
        ]
      }
    ],
    'options': [
      {
        'listName': 'warehouselevel',
        'name': 'CHV',
        'order': 7,
        'label': {'en': 'CHV', 'ar': 'متطوعات'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'warehouselevel',
        'name': 'healthFacility',
        'order': 6,
        'label': {'en': 'Health Facility', 'ar': 'مرافق صحية'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'warehouselevel',
        'name': 'NMCPCentral',
        'order': 1,
        'label': {'en': 'Central', 'ar': 'المركز الرئيسي'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'warehouselevel',
        'name': 'NMCPRegion',
        'order': 2,
        'label': {'en': 'NMCP Region', 'ar': 'محاور'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'warehouselevel',
        'name': 'NMCPBranch',
        'order': 3,
        'label': {'en': 'NMCP Branch', 'ar': 'فروع البرنامج'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'uoms',
        'name': 'Ampoule',
        'order': 0,
        'label': {'en': 'Ampoule', 'ar': 'امبولة'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT60MG',
        'order': 0,
        'label': {'en': 'ACT60MG', 'ar': 'كوارتم 60'},
        'properties': {}
      },
      {
        'listName': 'transactions',
        'name': 'supply',
        'order': 0,
        'label': {'en': 'Supply', 'ar': 'توريد'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'transactions',
        'name': 'inventory',
        'order': 0,
        'label': {'en': 'Inventory', 'ar': 'جرد'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'stockItems',
        'name': 'PMQ7.5MG',
        'order': 0,
        'label': {'en': 'PMQ7.5MG', 'ar': 'بريماكوين 7.5 مجم'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'Tape6Tablets',
        'order': 0,
        'label': {'en': 'Tape 6 Tablets', 'ar': 'شريط 6 اقراص'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'DRDT',
        'order': 0,
        'label': {'en': 'DRDT', 'ar': 'الفحص السريع للضنك'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'Tape10Tablets',
        'order': 0,
        'label': {'en': 'Tape10Tablets', 'ar': 'شريط 10 اقراص'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'Kit25Test',
        'order': 0,
        'label': {'en': 'Kit25Test', 'ar': 'كت 25 شريط'},
        'properties': {}
      },
      {
        'listName': 'currencies',
        'name': 'USD',
        'order': 0,
        'label': {'en': 'USD', 'ar': 'دولار'},
        'properties': {}
      },
      {
        'listName': 'warehouselevel',
        'name': 'Districts',
        'order': 5,
        'label': {'en': 'District', 'ar': 'مكاتب الصحة في المديريات'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'transactions',
        'name': 'dispense',
        'order': 0,
        'label': {'en': 'dispense', 'ar': 'صرف'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'currencies',
        'name': 'YER',
        'order': 0,
        'label': {'en': 'YER', 'ar': 'ريال يمني'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT40MG',
        'order': 0,
        'label': {'en': 'ACT40MG', 'ar': 'كوارتم 40'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'cassette',
        'order': 0,
        'label': {'en': 'cassette', 'ar': 'كاست'},
        'properties': {}
      },
      {
        'listName': 'warehouselevel',
        'name': 'NMCPUnit',
        'order': 4,
        'label': {'en': 'NMCP Unit', 'ar': 'وحدات محافحة الملاريا'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'stockItems',
        'name': 'MRDT',
        'order': 0,
        'label': {'en': 'MRDT', 'ar': 'الفحص السريع للملاريا'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'PMQ15MG',
        'order': 0,
        'label': {'en': 'PMQ15MG', 'ar': 'بريماكوين 15 مجم'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'ARTING60MG',
        'order': 0,
        'label': {'en': 'ARTING60MG', 'ar': 'ارتيسونات 60 مجم امبول'},
        'properties': {}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT80MG',
        'order': 0,
        'label': {'en': 'ACT80MG', 'ar': 'كوارتم 80'},
        'properties': {}
      },
      {
        'listName': 'transactions',
        'name': 'return',
        'order': 0,
        'label': {'en': 'return', 'ar': 'مرتجع'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'uoms',
        'name': 'Tablet',
        'order': 0,
        'label': {'en': 'Tablet', 'ar': 'قرص'},
        'properties': {}
      },
      {
        'listName': 'uoms',
        'name': 'Kit10Test',
        'order': 0,
        'label': {'en': 'Kit10Test', 'ar': 'كت 10 اشرطة'},
        'properties': {}
      },
      {
        'listName': 'transactions',
        'name': 'expiry',
        'order': 0,
        'label': {'en': 'expiry', 'ar': 'منتهي'},
        'properties': {'age': 0, 'phone': '', 'code': ''}
      },
      {
        'listName': 'stockItems',
        'name': 'ACT20MG',
        'order': 0,
        'label': {'en': 'ACT20MG', 'ar': 'كوارتم 20'},
        'properties': {}
      }
    ],
    'orgUnits': ['awgKZaDoWLA', 'YCEyRUYxMTo'],
    'label': {},
    'displayName': 'bookkeeping',
    'translations': []
  }
];
