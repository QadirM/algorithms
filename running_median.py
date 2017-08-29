from bisect import insort

nums = []
output = '{:.1f}'.format
for a in range(int(input())):
    insort(nums, int(input()))
    half = a // 2
    print(output((nums[half] + nums[half + 1]) / 2 if a % 2 else nums[half]))
