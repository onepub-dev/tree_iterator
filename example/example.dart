import 'package:tree_iterator/tree_iterator.dart';

class Course {
  var prerequisites = <Course>[];
  String name;
  Course(this.name);

  void add(Course course) => prerequisites.add(course);

  @override
  String toString() => name;
}

class Degree extends Course {
  Degree(String name) : super(name);
}

/// Demonstrate traversing the prerequisities of a degree.
void main() {
  var degree = Degree('Computer Science');

  var se101 = Course('se101');
  var se102 = Course('se102');
  var se103 = Course('se103');
  var softwareEngineering = Course('Software Engineering');
  softwareEngineering.add(se101);
  softwareEngineering.add(se102);
  softwareEngineering.add(se103);

  degree.add(softwareEngineering);

  var net101 = Course('net101');
  var net102 = Course('net102');
  var net103 = Course('net103');
  var networking = Course('Networking');
  networking.add(net101);
  networking.add(net102);
  networking.add(net103);

  degree.add(networking);

  ///
  /// Traverse the tree printing each node
  ///
  traverseTree<Course>(degree, (course) => course.prerequisites, (course) {
    print(course);
    return true;
  });

  ///
  /// Traverse the tree looking for the 'net102' node.
  ///
  var found = findInTree<Course>(degree, (course) => course.prerequisites, (course) => course.name == 'net102');
  print('Found $found');
}
