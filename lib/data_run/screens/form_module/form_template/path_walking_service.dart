import 'package:datarun/commons/extensions/list_extensions.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';

mixin TreeElement {
  String? get path;

  String? get name;
}

mixin TreeSectionElement<T> on TreeElement {
  List<T> get elements;
}

mixin PathWalkingService<T extends FormElementTemplate> {
  List<T> get fields;

  /// Get parent of a specific path
  T? getParent(String path) {
    final pathSegments = path.split('.');
    if (pathSegments.length > 1) {
      final parentPath =
          pathSegments.sublist(0, pathSegments.length - 1).join('.');
      return getElementByPath(parentPath);
    }
    return null;
  }

  /// Get ancestors of a specific path
  List<T> getAncestors(String path) {
    final ancestors = <T>[];
    while (path != '') {
      final parent = getParent(path);
      if (parent != null) {
        ancestors.add(parent);
        path = parent.path!;
      } else {
        break;
      }
    }
    return ancestors.reversed.toList();
  }

  /// Get descendants of a specific path
  T? getFirstByName(String name) {
    final element =
        fields.firstOrNullWhere((field) => field.path!.endsWith('$name'));
    return element;
  }

  /// Get element by path
  T? getElementByPath(String path) {
    return fields.firstOrNullWhere((element) => element.path == path);
  }

  /// Get descendants of a specific path
  List<T> getDescendants(String path) {
    return fields.where((field) => field.path!.startsWith('$path.')).toList();
  }

  /// Get siblings of a specific path, fixing the issue of differentiating
  /// siblings when the length of the path segments is different which should
  /// also match
  List<T> getSiblings2(String path) {
    final parentPath =
        path.split('.').sublist(0, path.split('.').length - 1).join('.');

    return fields
        .where((element) =>
            element.path!.startsWith(parentPath + '.') &&
            element.path != path &&
            element.path!.split('.').length ==
                path.split('.').length) // Same level
        .toList();
  }

  /// Get children of a specific path
  List<T> getChildren(String path) {
    final normalizedPath =
        path.endsWith('.') ? path.substring(0, path.length - 1) : path;

    return fields
        .where((field) =>
            field.path!.startsWith('$normalizedPath.') &&
            field.path!.split('.').length == path.split('.').length + 1)
        .toList();
  }

  /// Get descendants of a specific path
  List<T> getChildrenOfType<E extends T>(String path) {
    return fields.where((field) => field.path!.startsWith('$path.')).whereType<E>().toList();
  }

  // /// Get children of a specific path
  // List<T> getChildrenOfType<E extends T>(String path) {
  //   final normalizedPath =
  //   path.endsWith('.') ? path.substring(0, path.length - 1) : path;
  //
  //   return fields
  //       .where((field) =>
  //   field.path!.startsWith('$normalizedPath.') &&
  //       field.path!.split('.').length == path.split('.').length + 1).whereType<E>()
  //       .toList();
  // }

  T? getScopedDependencyByName(String name, String currentPath) {
    final pathSegments = currentPath.split('.');

    // upwards in the path
    for (int i = pathSegments.length - 1; i >= 0; i--) {
      final currentPathSegment = pathSegments.sublist(0, i + 1).join('.');

      // in the current scope
      final element = getElementByPath(currentPathSegment + '.' + name);
      if (element != null) {
        return element;
      }
    }

    // If not found, check the global scope
    final rootElements =
        fields.where((element) => element.path!.split('.').length == 1);

    for (final rootElement in rootElements) {
      final scopedElement = getScopedElement(rootElement, name);
      if (scopedElement != null) {
        return scopedElement;
      }
    }

    return null;
  }

  T? getScopedElement(T rootElement, String name) {
    if (rootElement.name == name) {
      return rootElement;
    }

    if (rootElement is SectionElementTemplate) {
      for (final child in getDescendants(rootElement.path!)) {
        final element = getScopedElement(child, name);
        if (element != null) {
          return element;
        }
      }
    }

    // // Check if it is a repeat section with children
    // if (rootElement is RepeatSectionElement) {
    //   for (final child in rootElement.fields) {
    //     final element = getScopedElement(child as T, name);
    //     if (element != null) {
    //       return element;
    //     }
    //   }
    // }

    return null;
  }

  /// Get element by name (nearest in scope)
  T? getScopedDependencyByName2(String name, String currentPath) {
    final pathSegments = currentPath.split('.');

    // Look for the element in the current hierarchy, moving up through ancestors
    for (int i = pathSegments.length - 1; i >= 0; i--) {
      final currentPathSegment = pathSegments.sublist(0, i + 1).join('.');
      final scopedElement = getElementByPath(currentPathSegment + '.' + name);

      if (scopedElement != null) {
        return scopedElement;
      }
    }

    // Check for siblings (elements sharing the same parent path)
    final parentPath = pathSegments.length > 1
        ? pathSegments.sublist(0, pathSegments.length - 1).join('.')
        : ''; // Root level has no parent path
    final siblingElement = fields.firstOrNullWhere((element) =>
        element.name == name &&
        element.path!.startsWith(parentPath) &&
        element.path != currentPath && // Not the same element
        element.path!.split('.').length ==
            currentPath.split('.').length); // Same level

    if (siblingElement != null) {
      return siblingElement;
    }

    // Check global scope (elements at the root level)
    return fields.firstOrNullWhere((element) =>
        element.name == name && element.path!.split('.').length == 1);
  }
}
