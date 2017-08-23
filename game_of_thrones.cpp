#include <vector> // headers {{{
#include <list>
#include <queue>
#include <set>
#include <map>
#include <string>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <functional>
#include <numeric>
#include <cstdlib>
#include <cmath>
#include <cstdio>
#include <fstream>
#include <ctime>
#include <cassert>

using namespace std; // }}}

int main()
{
    //time_t start, end;
    //time(&start);

    //ifstream cin("test.in");
    //ofstream cout("test.out");
    //fcout.precision(6);
    //fcout.setf(ios::fixed,ios::floatfield);

    string s;
    while (getline(cin, s)) {
        vector<int> v(26);
        for (int i = 0; i < s.size(); ++i) {
            v[s[i] - 'a']++;
        }
        bool f = 1, odd = 0;
        for (int i = 0; i < v.size(); ++i) {
            if (v[i] % 2) {
                if (!odd)
                    odd = 1;
                else
                    f = 0;
            }
        }
        cout << (f ? "YES" : "NO") << endl;
    }

    //time(&end);
    //cout << difftime(end, start) << endl;

    return 0;
}
