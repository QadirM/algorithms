#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include <string>
#include <set>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */
    int n;
    cin >> n;

    set<string> uset;
    for(int i = 0; i < n; i ++)
    {
        string s0, s1;
        cin >> s0 >> s1;
        if(s0 == "add")
        {
            uset.insert(s1);
        }else
        {
            std::pair<std::set<string>::iterator,bool> ret = uset.insert(s1);
            std::set<string>::iterator it = ret.first;
            if(ret.second)
            {
                it ++;
                uset.erase(s1);
            }

            int n = 0;
            for(; it != uset.end(); it ++)
            {
                string s = *it;
                if(s[0] != s1[0])
                    break;
                bool skip = false;

                if(s.length() >= s1.length())
                {
                    bool bf = true;
                    for(int i = 1; i < s1.length(); i ++)
                        if(s1[i] != s[i])
                        {
                            bf = false;
                            if(s1[i] < s[i])
                                skip = true;
                            break;
                        }
                    if(bf)
                        n ++;
                }
                if(skip)
                    break;
            }
            cout << n << endl;
        }
    }
    return 0;
}
