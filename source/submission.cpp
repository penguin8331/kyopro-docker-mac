#line 1 "A.cpp"
#include <bits/stdc++.h>
using namespace std;

int main() {
    int N;
    char a, b;
    string S;
    cin >> N >> a >> b >> S;
    for (auto &c : S) {
        if (c != a) c = b;
    }
    cout << S << endl;
}
