
/*
 assuming the existence of Node, LinkedList, and main classes.
 
 */

// Stack Challenge 1: reverse list 
void revList(List l) {
  for (int i = l.length - 1; i >= 0; i--) {
    print(l[i]);
  }
}

// Stack Challenge 2: balanced parentheses
bool balanced(String s) {
  List stack = [];
  for (int i = 0; i < s.length; i++) {
    if (s[i] == '(') {
      stack.add('(');
    } else if (s[i] == ')') {
      if (stack.isEmpty) return false;
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

// Linked List Challenge 1: print in reverse
void printRev(Node? n) {
  if (n == null) return;
  printRev(n.next);
  print(n.val);
}

// Linked List Challenge 2: find middle node
Node? midNode(Node? head) {
  if (head == null) return null;
  Node? slow = head;
  Node? fast = head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  return slow;
}

// Linked List Challenge 3: reverse linked list
Node? revListNode(Node? head) {
  Node? prev;
  Node? curr = head;
  while (curr != null) {
    Node? nxt = curr.next;
    curr.next = prev;
    prev = curr;
    curr = nxt;
  }
  return prev;
}

// Linked List Challenge 4: remove all occurrences 
Node? removeAll(Node? head, dynamic val) {
  while (head != null && head.val == val) {
    head = head.next;
  }
  Node? cur = head;
  while (cur != null && cur.next != null) {
    if (cur.next!.val == val) {
      cur.next = cur.next!.next;
    } else {
      cur = cur.next;
    }
  }
  return head;
}