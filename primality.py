from math import ceil, sqrt

p = int(input().strip())
for a0 in range(p):
    n = int(input().strip())
    prime = True

    for a1 in range(2, ceil(sqrt(n))):
        if n%a1 == 0:
            prime = False
            break

    if n==1:
        prime = False

    if prime:
        print("Prime")
    else:
        print("Not prime")
        
