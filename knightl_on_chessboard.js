process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function main() {
    var n = parseInt(readLine());
    // your code goes here
    printBoard(buildWholeGrid(n));
}

function printBoard(board) {
  console.log(board.map(function(a) { return a.join(' ') }).join('\n'))
}

function Knight(a, b) {
  this.posQueue = [[0,0]];  //row, col
  this.queueIdx = 0;
  this.a = a;
  this.b = b;
  this.addNextSquares = function (board, n) {
    var startPos = this.posQueue[this.queueIdx].slice();
    var row = startPos[0], col = startPos[1];
    var val = board[row][col];
    var nextRow, nextCol, nextVal;
    for (nextRow=row-a; nextRow <= row+a; nextRow+=2*a) {
      for (nextCol=col-b; nextCol <= col+b; nextCol+=2*b) {
        if (!validSquare(nextRow, nextCol, n)) continue;
        this.handleNextSquare(board, nextRow, nextCol, row, col, val);
      }
    }
    for (nextRow=row-b; nextRow <= row+b; nextRow+=2*b) {
      for (nextCol=col-a; nextCol <= col+a; nextCol+=2*a) {
        if (!validSquare(nextRow, nextCol, n)) continue;
        this.handleNextSquare(board, nextRow, nextCol, row, col, val);
      }
    }
    this.queueIdx += 1;
  }
  this.handleNextSquare = function(board, nextRow, nextCol, row, col, val) {
    var nextVal = board[nextRow][nextCol];
    if (nextVal === '-' || nextVal > val+1) {
      board[nextRow][nextCol] = val+1;
      this.posQueue.push([nextRow, nextCol]);
    }
  }
}

function validSquare(row, col, n) {
  if (row < 0) return false;
  if (row >= n) return false;
  if (col < 0) return false;
  if (col >=n) return false;
  return true;
}

function test(n, a, b) {
  var knight = new Knight(a, b);
  var board = [];
  for (var i=0; i<n; i++) {
    board.push(Array(n).fill('-'));
  }
  board[0][0] = 0;
  while (knight.queueIdx < knight.posQueue.length) {
    knight.addNextSquares(board, n);
  }
  var result = board[n-1][n-1]
  return result === '-'? -1: result;
}

function buildWholeGrid(n) {
  var grid = [];
  for (var i=0; i<n-1; i++) {
    grid.push(Array(n-1).fill());
  }
  var a, b;
  var knight = new Knight(1, 1);
  for (a=1; a<n; a++) {
    for (b=1; b<n; b++) {
      if (a < b) {
        grid[a-1][b-1] = test(n, a, b);
      } else if (a > b) {
        grid[a-1][b-1] = grid[b-1][a-1];
      } else {
        if ((n-1)%a === 0) {
          grid[a-1][a-1] = (n-1)/a;
        } else {
          grid[a-1][a-1] = -1;
        }
      }
    }
  }
  return grid
}
