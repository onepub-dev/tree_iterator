import '../graph.dart';
import '../tree_iterators/breadth_first_iterator.dart';
import '../tree_iterators/itree_iterator.dart';
import 'itree_collection.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  const BreadthFirstTreeCollection(this.graph);
  final Graph graph;

  @override
  @Deprecated('Use asIterator')
  // ignore: use_to_and_as_if_applicable
  ITreeIterator createIterator() => BreadthFirstIterator(this);

  @override
  ITreeIterator asIterator() => BreadthFirstIterator(this);

  @override
  String getTitle() => 'Breadth-first';
}
