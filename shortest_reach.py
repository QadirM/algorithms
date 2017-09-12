def find_all_dists(g, s):
    r = {}
    ss = {}
    for n in g[s]:
        r[n] = 1
        ss[n] = 1
    arr = [r]
    ss[s] = 0

    while True:
        r = {}
        pr = arr[-1]
        for key, c in pr.items():
            for ne in g[key]:
                if ne not in ss or ss[ne] > c+1:
                    if ne in r and r[ne] <= c+1:
                        continue
                    r[ne] = c+1
                    ss[ne] = c+1
        if r == {}:
            break
        arr.append(r)
    return ss

t = int(input())
for i in range(t):
    n,m = [int(value) for value in input().split()]
    graph = {}
    for i in range(n+1):
        graph[i+1] = []
    for i in range(m):
        u,v = [int(x) for x in input().split()]
        graph[u].append(v)
        graph[v].append(u)

    s = int(input())
    ss = find_all_dists(graph, s)
    #print(ss)
    res = []
    for i in range(1,n+1):
        if i == s:
            continue
        if i not in ss:
            res.append('-1')
        else:
            res.append(str(ss[i] * 6))
    print(" ".join(res))
