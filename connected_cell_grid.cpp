#include <map>
#include <set>
#include <list>
#include <cmath>
#include <ctime>
#include <deque>
#include <queue>
#include <stack>
#include <string>
#include <bitset>
#include <cstdio>
#include <limits>
#include <vector>
#include <climits>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <numeric>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <unordered_map>

using namespace std;

int count_region(vector<vector<int>> &grid, int i, int j) {
    if (i < 0 || j < 0 || i >= grid.size() || j >= grid[0].size())
        return 0;
    if (grid[i][j] != 1)
        return 0;
    grid[i][j] = 2;
    return 1 + count_region(grid, i + 1, j + 0)
             + count_region(grid, i - 1, j + 0)
             + count_region(grid, i + 0, j + 1)
             + count_region(grid, i + 0, j - 1)
             + count_region(grid, i + 1, j + 1)
             + count_region(grid, i - 1, j - 1)
             + count_region(grid, i + 1, j - 1)
             + count_region(grid, i - 1, j + 1);
}

int get_biggest_region(vector< vector<int> > grid) {
    int res = 0;
    for (int i = 0; i < grid.size(); ++i) {
        for (int j = 0; j < grid[i].size(); ++j) {
            if (grid[i][j] == 1) {
                int size = count_region(grid, i, j);
                res = max(res, size);
            }
        }
    }
    return res;
}

int main(){
    int n;
    cin >> n;
    int m;
    cin >> m;
    vector< vector<int> > grid(n,vector<int>(m));
    for(int grid_i = 0;grid_i < n;grid_i++){
       for(int grid_j = 0;grid_j < m;grid_j++){
          cin >> grid[grid_i][grid_j];
       }
    }
    cout << get_biggest_region(grid) << endl;
    return 0;
}
