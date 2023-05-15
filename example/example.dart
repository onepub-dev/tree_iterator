import 'package:tree_iterator/tree_iterator.dart';

class Course {
  Course(this.name);
  List<Course> prerequisites = <Course>[];
  String name;

  void add(Course course) => prerequisites.add(course);

  @override
  String toString() => name;
}

class Degree extends Course {
  Degree(super.name);
}

/// Demonstrate traversing the prerequisities of a degree.
void main() {
  final degree = Degree('Computer Science');

  final se101 = Course('se101');
  final se102 = Course('se102');
  final se103 = Course('se103');
  final softwareEngineering = Course('Software Engineering')
    ..add(se101)
    ..add(se102)
    ..add(se103);

  degree.add(softwareEngineering);

  final net101 = Course('net101');
  final net102 = Course('net102');
  final net103 = Course('net103');
  final networking = Course('Networking')
    ..add(net101)
    ..add(net102)
    ..add(net103);

  degree.add(networking);

  ///
  /// Traverse the tree printing each node
  ///
  traverseTree<Course>(degree, (course) => course.prerequisites, (course) {
    // ignore: avoid_print
    print(course);
    return true;
  });

  ///
  /// Traverse the tree looking for the 'net102' node.
  ///
  final found = findInTree<Course>(degree, (course) => course.prerequisites,
      (course) => course.name == 'net102');
  // ignore: avoid_print
  print('Found $found');
}
