size = int(input())
array = input().split(" ")
arr = ['None'] * size
for i in range(size):
    arr[i] = int(array[i])
i = 1
count = 0
while i < size:
    tmp = arr[i]
    j = i - 1
    while arr[j] > tmp and j > -1:
        arr[j+1] = arr[j]
        j = j - 1
        count = count + 1
    arr[j+1] = tmp
    i = i + 1
print(count)
