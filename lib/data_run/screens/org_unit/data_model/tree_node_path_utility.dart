// class TreeNodePathUtility {
//   // Split the path into a list of UIDs by trimming commas and splitting by comma
//   static List<String> _splitPath(String path) {
//     return path.trim().split(',').where((uid) => uid.isNotEmpty).toList();
//   }
//
//   // Get the root UID from the path
//   static String? getRoot(String path) {
//     final List<String> uids = _splitPath(path);
//     return uids.isNotEmpty ? uids.first : null;
//   }
//
//   // Get the leaf (last) UID from the path
//   static String? getLeaf(String path) {
//     final List<String> uids = _splitPath(path);
//     return uids.isNotEmpty ? uids.last : null;
//   }
//
//   // Get all ancestor UIDs for the given UID
//   static List<String> getAncestors(String path, String uid) {
//     final List<String> uids = _splitPath(path);
//     final int index = uids.indexOf(uid);
//     if (index == -1) return [];
//     return uids.sublist(0, index);
//   }
//
//   // // Get the first common ancestor UID among multiple paths
//   // static String? getFirstCommonAncestor(List<String> paths) {
//   //   if (paths.isEmpty) return null;
//   //   final List<List<String>> splitPaths = paths.map(_splitPath).toList();
//   //
//   //   // Find the common UIDs by iterating through each level
//   //   List<String> commonUids = splitPaths.first;
//   //   for (final path in splitPaths) {
//   //     commonUids = commonUids.takeWhile((uid) => path.contains(uid)).toList();
//   //   }
//   //
//   //   return commonUids.isNotEmpty ? commonUids.last : null;
//   // }
//
//   // Get immediate children UIDs of a given parent UID
//   static List<String> getChildren(List<String> paths, String parentUid) {
//     final Set<String> children = {};
//     for (final path in paths) {
//       final List<String> uids = _splitPath(path);
//       final int index = uids.indexOf(parentUid);
//       if (index != -1 && index + 1 < uids.length) {
//         children.add(uids[index + 1]);
//       }
//     }
//     return children.toList();
//   }
//
//   // Get all paths that belong to the subtree rooted at a given UID
//   static List<String> findSubtree(List<String> paths, String rootUid) {
//     return paths.where((path) => path.contains(rootUid)).toList();
//   }
//
//   // Check if a UID is an ancestor of another UID within a specific path
//   static bool isAncestor(String ancestorUid, String descendantUid, String path) {
//     final List<String> uids = _splitPath(path);
//     final int ancestorIndex = uids.indexOf(ancestorUid);
//     final int descendantIndex = uids.indexOf(descendantUid);
//     return ancestorIndex != -1 && descendantIndex != -1 && ancestorIndex < descendantIndex;
//   }
//
//   // // Get the common subtree root from a list of paths
//   // static String? findCommonSubtreeRoot(List<String> paths) {
//   //   return getFirstCommonAncestor(paths);
//   // }
//
//   // Get the depth (number of nodes) of a path
//   static int pathDepth(String path) {
//     return _splitPath(path).length;
//   }
//
//   // Get a subpath up to a certain level
//   static String getSubpath(String path, int level) {
//     final List<String> uids = _splitPath(path);
//     return ',${uids.take(level).join(',')},';
//   }
//
//   static String? getCommonAncestorUid(Iterable<String> paths) {
//     // Extract ancestors for each selected orgUnit
//     final ancestorPaths =
//     paths.map((path) => _splitPath(path)).toList();
//
//     // Find the common ancestor uid
//     return _findDeepestCommonAncestor(ancestorPaths);
//   }
//
//   static String? _findDeepestCommonAncestor(List<List<String>> ancestorPaths) {
//     if (ancestorPaths.isEmpty) return null;
//
//     // Get the shortest path length to avoid index errors
//     final minPathLength = ancestorPaths
//         .map((path) => path.length)
//         .reduce((a, b) => a < b ? a : b);
//
//     String? lastCommonAncestor;
//
//     // Iterate over each level
//     for (int i = 0; i < minPathLength; i++) {
//       final currentAncestor = ancestorPaths[0][i];
//
//       // Check if the current ancestor is common in all paths
//       final isCommon =
//       ancestorPaths.every((path) => path[i] == currentAncestor);
//
//       if (isCommon) {
//         lastCommonAncestor = currentAncestor;
//       } else {
//         break; // As soon as a mismatch is found, stop the loop
//       }
//     }
//
//     return lastCommonAncestor;
//   }
// }
//
// void main() {
//   final utility = TreeNodePathUtility();
//
//   final String path1 = ',gBsSQR1DZSU,Kt446cnu6Me,sXngQLzRhvX,11lpB5aKCcB,8o22NsJVLCL,';
//   final String path2 = ',gBsSQR1DZSU,Kt446cnu6Me,OzyNUU2aEWp,iFlpB5aKCcB,lobkNsJVLCL,';
//   final String path3 = ',gBsSQR1DZSU,Kt446cnu6Me,OzyNUU2aEWp,44lpB5aK11B,55kNsJVLCL,';
//
//   print('Root: ${TreeNodePathUtility.getRoot(path1)}'); // Output: gBsSQR1DZSU
//   print('Leaf: ${TreeNodePathUtility.getLeaf(path1)}'); // Output: lobkNsJVLCL
//   print("Ancestors of iFlpB5aKCcB: ${TreeNodePathUtility.getAncestors(path2, 'iFlpB5aKCcB')}"); // Output: [gBsSQR1DZSU, Kt3J6cnu6Me, OzyNUU2aEWp]
//   print('Common Ancestor: ${TreeNodePathUtility.getCommonAncestorUid([path1, path2, path3])}'); // Output: gBsSQR1DZSU
//   print("Children of OzyNUU2aEWp: ${TreeNodePathUtility.getChildren([path1, path2], 'OzyNUU2aEWp')}"); // Output: [iFlpB5aKCcB, 44lpB5aK11B]
//   print("Subtree paths of gBsSQR1DZSU: ${TreeNodePathUtility.findSubtree([path1, path2, path3], 'gBsSQR1DZSU')}"); // Output: [path1, path2, path3]
//   print("Is gBsSQR1DZSU an ancestor of lobkNsJVLCL? ${TreeNodePathUtility.isAncestor('gBsSQR1DZSU', 'lobkNsJVLCL', path1)}"); // Output: true
//   // print('Common Subtree Root: ${TreeNodePathUtility.findCommonSubtreeRoot([path1, path2, path3])}'); // Output: gBsSQR1DZSU
//   print('Path Depth: ${TreeNodePathUtility.pathDepth(path1)}'); // Output: 6
//   print('Subpath up to level 3: ${TreeNodePathUtility.getSubpath(path1, 3)}'); // Output: ,gBsSQR1DZSU,Kt3J6cnu6Me,OzyNUU2aEWp,
// }
//
