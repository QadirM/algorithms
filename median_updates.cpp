
#include <map>
#include <cmath>
#include <cstdio>
#include <iostream>
#include <vector>
#include <string>

using namespace std;


void readInput()
{
	int n;
	cin >> n;
	map<long long, int> h1;
	map<long long, int> h2;
	int s1 = 0;
	int s2 = 0;
	for (int i = 0; i < n; i++)
	{
		string s;
		long long x;
		cin >> s >> x;

		//cout << s1 << " " << s2 << endl;
		if (s == "r")
		{
			if (h1.find(x) == h1.end() && h2.find(x) == h2.end())
			{
				cout << "Wrong!" << endl;
				continue;
			}
			if (h1.find(x) != h1.end())
			{
				h1[x]--;
				if (h1[x] == 0)
					h1.erase(x);
				s1--;
			}
			else
			{
				h2[x]--;
				if (h2[x] == 0)
					h2.erase(x);
				s2--;
			}
			if (s1 == 0 && s2 == 0)
			{
				cout << "Wrong!" << endl;
				continue;
			}
		}
		else
		{
			map<long long, int>::reverse_iterator it = h1.rbegin();
			if (!s1 || x <= it->first)
			{
				h1[x]++;
				s1++;
			}
			else
			{
				h2[x]++;
				s2++;
			}
		}
		if (s2 > s1)
		{
			map<long long, int>::iterator it = h2.begin();
			long long t = it->first;
			h2[t]--;
			if (h2[t] == 0)
				h2.erase(t);
			s2--;
			h1[t]++;
			s1++;
		}
		if (s1 == s2+2)
		{
			map<long long, int>::reverse_iterator it = h1.rbegin();
			long long t = it->first;
			h1[t]--;
			if (h1[t] == 0)
				h1.erase(t);
			s1--;
			h2[t]++;
			s2++;
		}

		if (s1 > s2)
			cout << h1.rbegin()->first << endl;
		else
		{
			long long a = h1.rbegin()->first;
			long long b = h2.begin()->first;
			double t = (double)(a+b) / 2;
			if ((a+b)%2)
				printf("%.1f\n", t);
			else
				printf("%lld\n", (long long)t);
		}

	}
}

int main()
{
	readInput();
	return 0;
}
