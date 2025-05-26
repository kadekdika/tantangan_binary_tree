import 'dart:io';
import 'dart:collection';

class Node<T> {
  T key;
  Node? left, right;

  Node(this.key);
}

class BinaryTree {
  Node? root;

  BinaryTree() {
    root = null;
  }

  void insertLevelOrder(dynamic key) {
    Node newNode = Node(key);

    if (root == null) {
      root = newNode;
      return;
    }

    Queue<Node> queue = Queue<Node>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();

      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  void printLevelOrder() {
    if (root == null) return;

    Queue<Node> queue = Queue<Node>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();
      stdout.write('${current.key} ');

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }

  // root → left → right
  void printPreorder(Node? node) {
    if (node != null) {
      stdout.write('${node.key} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  void printPreorderFromRoot() {
    printPreorder(root);
  }

  // left → root → right
  void printInOrder(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.key} ');
      printInOrder(node.right);
    }
  }

  void printInOrderFromRoot() {
    printInOrder(root);
  }

  // left → right → root
  void printPostorder(Node? node) {
    if (node != null) {
      printPostorder(node.left);
      printPostorder(node.right);
      stdout.write('${node.key} ');
    }
  }

  void printPostorderFromRoot() {
    printPostorder(root);
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insertLevelOrder(10);
  tree.insertLevelOrder(5);
  tree.insertLevelOrder(15);
  tree.insertLevelOrder(3);
  tree.insertLevelOrder(7);
  tree.insertLevelOrder(13);
  tree.insertLevelOrder(20);

  print('Data Yang Belum Di Traversal:');
  tree.printLevelOrder();

  print('\nSetelah Di Traversal');

  print('Preorder Traversal:');
  tree.printPreorderFromRoot();

  print('\nInorder Traversal:');
  tree.printInOrderFromRoot();

  print('\nPostorder Traversal:');
  tree.printPostorderFromRoot();
}
