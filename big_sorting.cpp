#include <bits/stdc++.h>

int main() {
  std::ios::sync_with_stdio(false);
  std::cin.tie(0);
  int n;
  std::cin >> n;
  std::vector<std::string> number(n);
  for (int i = 0; i < n; ++i) {
    std::cin >> number[i];
  }
  std::sort(number.begin(), number.end(), [](const std::string &a, const std::string &b) {
    if (a.size() < b.size()) return true;
    if (a.size() > b.size()) return false;
    return a < b;
  });
  for (int i = 0; i < n; ++i) {
    std::cout << number[i] << '\n';
  }
  return 0;
}
