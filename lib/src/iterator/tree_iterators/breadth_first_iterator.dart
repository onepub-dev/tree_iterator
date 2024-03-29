import 'dart:collection';

import '../tree_collections/breadth_first_tree_collection.dart';
import 'itree_iterator.dart';

class BreadthFirstIterator implements ITreeIterator {
  BreadthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeQueue.add(_initialNode);
  }
  final BreadthFirstTreeCollection treeCollection;
  final Set<int?> visitedNodes = <int?>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  int? _currentNode;

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() => nodeQueue.isNotEmpty;

  @override
  int? getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      // ignore: prefer_foreach
      for (final node in adjacencyList[_currentNode!]!
          .where((n) => !visitedNodes.contains(n))) {
        nodeQueue.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue
      ..clear()
      ..add(_initialNode);
  }
}
