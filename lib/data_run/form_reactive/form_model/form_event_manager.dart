

class EventManager {
  final Map<String, List<void Function(dynamic)>> _eventListeners = {};

  void registerEventListener(String eventName, void Function(dynamic) listener) {
    if (_eventListeners[eventName] == null) {
      _eventListeners[eventName] = [];
    }
    _eventListeners[eventName]!.add(listener);
  }

  void dispatchEvent(String eventName, dynamic data) {
    if (_eventListeners[eventName] != null) {
      for (var listener in _eventListeners[eventName]!) {
        listener(data);
      }
    }
  }
}

class DependencyManager {
  final Map<String, List<String>> _dependencies = {};

  void registerDependency(String fieldName, List<String> dependentFields) {
    _dependencies[fieldName] = dependentFields;
  }

  void updateDependencies(String fieldName, dynamic newValue, EventManager eventManager) {
    if (_dependencies[fieldName] != null) {
      for (var dependentField in _dependencies[fieldName]!) {
        eventManager.dispatchEvent('${dependentField}Changed', newValue);
      }
    }
  }
}


class Field {
  final String name;
  final EventManager _eventManager;
  final DependencyManager _dependencyManager;

  Field(this.name, this._eventManager, this._dependencyManager);

  void onChange(dynamic newValue) {
    _eventManager.dispatchEvent('${name}Changed', newValue);
    _dependencyManager.updateDependencies(name, newValue, _eventManager);
  }
}

class TransactionTypeField extends Field {
  TransactionTypeField(EventManager eventManager, DependencyManager dependencyManager)
      : super('transactionType', eventManager, dependencyManager) {
    eventManager.registerEventListener('transactionTypeChanged', _handleTransactionTypeChange);
  }

  void _handleTransactionTypeChange(dynamic newValue) {
    print('Transaction type changed to $newValue');
  }
}

class QuantityField extends Field {
  final Field totalPriceField;

  QuantityField(EventManager eventManager, DependencyManager dependencyManager, this.totalPriceField)
      : super('quantity', eventManager, dependencyManager) {
    eventManager.registerEventListener('quantityChanged', _handleQuantityChange);
  }

  void _handleQuantityChange(dynamic newValue) {
    final totalPrice = newValue * 10; // Example calculation
    totalPriceField.onChange(totalPrice);
    print('Quantity changed to $newValue, Total Price updated to $totalPrice');
  }
}

class TotalPriceField extends Field {
  TotalPriceField(EventManager eventManager, DependencyManager dependencyManager)
      : super('totalPrice', eventManager, dependencyManager);

  @override
  void onChange(dynamic newValue) {
    super.onChange(newValue);
    print('Total Price updated to $newValue');
  }
}

void main() {
  final eventManager = EventManager();
  final dependencyManager = DependencyManager();

  final transactionTypeField = TransactionTypeField(eventManager, dependencyManager);
  final totalPriceField = TotalPriceField(eventManager, dependencyManager);
  final quantityField = QuantityField(eventManager, dependencyManager, totalPriceField);

  // Register dependencies
  dependencyManager.registerDependency('transactionType', ['voucherId']);
  dependencyManager.registerDependency('quantity', ['totalPrice']);

  // Simulate field changes
  transactionTypeField.onChange('supply');
  quantityField.onChange(5);
}
