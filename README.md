# Tree_Iterator

Provides simple operations for traversing a tree.

Works with any tree structure providing that you can return the set of children for a node when requested.



## FindInTree


Searches the tree for a child that satisfies a condition.

As soon as we find a child that satisfies the condition the tree traversal stops.


 ```dart
   /// search the tree for the 'theOne'.
   var theOne = findInTree<SMCState>(virtualRoot, (node) => node.children, (node) => node.isTheOne);
 ```


## traverseTree

Traverses the entire tree calling an function on each child.

Traversal continues until the entire tree has been traversed on the call to 'processChild' returns false.

```dart
   traverseTree<SMCState>(root, (node) => node.children, (node) {
     print(node);

     /// return false if you want to stop traversal
     return true;
   });

```


# TODO: 

* change algoritm to use iteration rather than recursion.

* add an iterator for us in a for loop.

* offer breadth first and depth first operations.

e.g.
```dart
 var theOne = findInTree<SMCState>(virtualRoot, (node) => node.children, (node) => node.isTheOne, method: TreeInterator.depthFirst);
```


# tree_iterator
