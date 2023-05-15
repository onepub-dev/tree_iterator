import 'dart:collection';

import '../tree_collections/depth_first_tree_collection.dart';
import 'itree_iterator.dart';

class DepthFirstIterator implements ITreeIterator {
  DepthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }
  final DepthFirstTreeCollection treeCollection;
  final Set<int?> visitedNodes = <int?>{};
  final ListQueue<int> nodeStack = ListQueue<int>();

  final int _initialNode = 1;
  int? _currentNode;

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() => nodeStack.isNotEmpty;

  @override
  int? getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeStack.removeLast();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode!]!
          .where((n) => !visitedNodes.contains(n))) {
        nodeStack.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeStack
      ..clear()
      ..add(_initialNode);
  }
}
