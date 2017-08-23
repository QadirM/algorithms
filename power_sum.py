import math

def mycomb(pnums, n, tgtnum):
    if n == 1:
        for ele in pnums:
            if ele > tgtnum:
                break
            yield (ele,)
    else:
        for i,a in enumerate(pnums):
            if a <=tgtnum:
                for com in mycomb(pnums[i+1:], n-1,tgtnum-a):
                    yield (a,)+com

def npsum(x,n):
    assert 0<=x<=1000 and 2<=n<=10
    c = 0
    r = math.floor(x**(1/n))
    natpow=[b**n for b in list(range(1,r+1))]
    for nchosen in range(1,r+1):
        for com in mycomb(natpow, nchosen, x):
            if sum(com) == x:
                c+=1
    return c

x=int(input())
n=int(input())
print(npsum(x,n))
