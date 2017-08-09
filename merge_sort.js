function mergeSort(myarr, callback) {
  if (myarr.length < 2) {
    return myarr;
  }

  let mid = Math.floor(myarr.length / 2);
  let left = myarr.slice(0, mid);
  let right = myarr.slice(mid, myarr.length);
  let leftSorted = mergeSort(left, callback);
  let rightSorted = mergeSort(right, callback);

  return merge(leftSorted, rightSorted, callback);
}

function merge(myarr1, myarr2, callback) {
  callback = callback || function(num1, num2) {
    if (num1 < num2) {
      return -1;
    }
  }

  let result = [];

  while (myarr1.length > 0 && myarr2.length > 0) {
    if (callback(myarr1, myarr2) === -1) {
      result.push(myarr1.shift());
    } else {
      result.push(myarr2.shift());
    }
  }

  return result.concat(arr1).concat(arr2);
}

console.log(mergeSort([3, 2, 1, 2, 3, 6, 9, 1, 2, 3]));
