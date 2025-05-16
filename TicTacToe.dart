
import 'dart:io';

List<String> grid = List.filled(9, ' ');
String mark1 = 'X';
String mark2 = 'O';
String turn = '';

void main() {
  while (true) {
    setup();
    runGame();

    print("Do you want to play again? (y/n):");
    String? ans = stdin.readLineSync();
    if (ans == null || ans.toLowerCase() != 'y') break;
  }
}

void setup() {
  for (int i = 0; i < 9; i++) {
    grid[i] = ' ';
  }

  print("Player 1, choose your marker (X/O):");
  String? sel = stdin.readLineSync();

  if (sel != null && sel.toUpperCase() == 'O') {
    mark1 = 'O';
    mark2 = 'X';
  } else {
    mark1 = 'X';
    mark2 = 'O';
  }

  turn = mark1;
}

void runGame() {
  while (true) {
    printBoard();
    int spot = getMove();
    grid[spot] = turn;

    if (checkWin()) {
      printBoard();
      print("Player ${turn == mark1 ? '1' : '2'} wins!");
      break;
    } else if (!grid.contains(' ')) {
      printBoard();
      print("It's a draw!");
      break;
    }

    turn = (turn == mark1) ? mark2 : mark1;
  }
}

void printBoard() {
  print("\n ${grid[0]} | ${grid[1]} | ${grid[2]}");
  print("--------");
  print(" ${grid[3]} | ${grid[4]} | ${grid[5]}");
  print("--------");
  print(" ${grid[6]} | ${grid[7]} | ${grid[8]}\n");
}

int getMove() {
  while (true) {
    print("Player ${turn == mark1 ? '1' : '2'} ($turn), enter your move (1-9):");
    String? inp = stdin.readLineSync();
    int? pos = int.tryParse(inp ?? '');

    if (pos == null || pos < 1 || pos > 9) {
      print("Error . Enter a number between 1 and 9.");
      continue;
    }

    if (grid[pos - 1] != ' ') {
      print(" Choose another cell.");
      continue;
    }

    return pos - 1;
  }
}

bool checkWin() {
  List<List<int>> wins = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  for (var w in wins) {
    if (grid[w[0]] == turn && grid[w[1]] == turn && grid[w[2]] == turn) {
      return true;
    }
  }
  return false;
}
