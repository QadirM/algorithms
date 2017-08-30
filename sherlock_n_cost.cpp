#include<math.h>
#include<algorithm>
#include<cstdlib>
#include<iostream>
#include<stdio.h>
#include<map>
#include<ext/hash_map>
#include<ext/hash_set>
#include<set>
#include<string>
#include<assert.h>
#include<vector>
#include<time.h>
#include<queue>
#include<deque>
#include<sstream>
#include<stack>
#include<sstream>
#define MA(a,b) ((a)>(b)?(a):(b))
#define MI(a,b) ((a)<(b)?(a):(b))
#define AB(a) (-(a)<(a)?(a):-(a))
#define X first
#define Y second
#define mp make_pair
#define pb push_back
#define pob pop_back
#define ep 0.0000000001
#define pi 3.1415926535897932384626433832795

using namespace std;
using namespace __gnu_cxx;
const int N=1000111;
const int INF=1000000008;
int n,m,i,j,k,l,r,p;
int a[1000],b[1000];

int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        cin>>n;
        cin>>k;
        for (i=1;i<=k;i++) a[i]=0;
        for (i=k+1;i<=100;i++) a[i]=-INF;
        n--;
       //     for (i=1;i<=15;i++) cout<<a[i]<<" ";cout<<endl;
        while (n--)
        {
            scanf("%d",&k);
            p=-1;
            for (i=1;i<=k;i++)
            {
                p=MA(p+1,a[i]);
                b[i]=p;
            }
            p=-INF;
            for (i=100;i>=1;i--)
            {
                p=MA(p+1,a[i]);
                b[i]=MA(b[i],p);
            }
            for (j=k+1;j<=100;j++) b[j]=-INF;
            for (j=1;j<=100;j++) a[j]=b[j];
     //       for (i=1;i<=15;i++) cout<<a[i]<<" ";cout<<endl;
        }
    p=0;
    for (i=1;i<=k;i++) p=MA(p,a[i]);
    cout<<p<<endl;
    }
    return 0;
}
