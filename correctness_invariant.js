function insertionSort (ar) {

for(i = 1; i < ar.length; i++){
    var value = ar[i];
    var j = i - 1;
    while(j >= 0 && ar[j] > value){
      ar[j + 1] = ar[j];
      j = j - 1;
    }
    ar[j + 1] = value;
  }
  return ar;
}


function processData(input) {
    var lines = input.split('\n');
    var n = parseInt(lines.shift(), 10);

    var data = (
         lines
        .shift()
        .split(' ')
        .splice(0, n)
        .map(function (s) { return parseInt(s, 10); })
    );

    insertionSort(data);

    process.stdout.write(data.join(' ') + '\n');
}

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});
