function revSentc(sentence) {
  let arr = sentence.split(" ");
  let result = [];

  for (let i = arr.length - 1; i >= 0; i--) {
    output.push(arr[i]);
  }

  return output.join(" ");
}
