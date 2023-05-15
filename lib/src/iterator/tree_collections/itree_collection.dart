import '../tree_iterators/itree_iterator.dart';

abstract class ITreeCollection {
  @Deprecated('Use asIterator')
  // ignore: use_to_and_as_if_applicable
  ITreeIterator createIterator();

  ITreeIterator asIterator();
  String getTitle();
}
