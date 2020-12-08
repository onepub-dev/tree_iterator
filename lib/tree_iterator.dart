typedef GetChildren<N> = List<N> Function(N node);
typedef ChildMatches<N> = bool Function(N child);
typedef ProcessChild<N> = bool Function(N child);

/// Searches the tree for a child that satisfies [childMatches]
/// [root] the root of the tree
/// [getChildren] must return the set of children for the current node.
/// [childMatches] is called on each node in the tree. As soon as childMatches
/// returns true then the search is terminated and the current node is returned.
/// ```dart
///   /// search the tree for the 'theOne'.
///   var theOne = findInTree<SMCState>(virtualRoot, (node) => node.children, (node) => node.isTheOne);
/// ```
N findInTree<N>(
    N root, GetChildren<N> getChildren, ChildMatches<N> childMatches) {
  N matched;
  traverseTree<N>(root, getChildren, (node) {
    if (childMatches(node)) {
      matched = node;
      return false;
    }
    return true;
  });

  return matched;
}

/// Traverses the tree calling [processChild] for every node in the tree.
///
/// Tree treversal will continue until all nodes are visited or [processChild] returns
/// false.
///
/// We return true if the tree was fully traversed.
///
/// ```dart
///   traverseTree<SMCState>(virtualRoot, (node) => node.children, (node) {
///     print(node);
///
///     /// return false if you want to stop traversal
///     return true;
///   });
///
/// ```

bool traverseTree<N>(
    N root, GetChildren<N> getChildren, ProcessChild<N> processChild) {
  for (var child in getChildren(root)) {
    /// we terminate the traversal if [processChild] returns false.
    if (!processChild(child)) return false;

    if (!traverseTree(child, getChildren, processChild)) return false;
  }
  return true;
}
