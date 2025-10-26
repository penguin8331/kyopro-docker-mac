#line 2 "library/template/template.hpp"
#include <bits/stdc++.h>
#line 3 "library/template/macro.hpp"

#define overload3(_1, _2, _3, name, ...) name
#define all1(v) std::begin(v), std::end(v)
#define all2(v, a) std::begin(v), std::begin(v) + a
#define all3(v, a, b) std::begin(v) + a, std::begin(v) + b
#define all(...) overload3(__VA_ARGS__, all3, all2, all1)(__VA_ARGS__)
#define rall1(v) std::rbegin(v), std::rend(v)
#define rall2(v, a) std::rbegin(v), std::rbegin(v) + a
#define rall3(v, a, b) std::rbegin(v) + a, std::rbegin(v) + b
#define rall(...) overload3(__VA_ARGS__, rall3, rall2, rall1)(__VA_ARGS__)
#define elif else if
#define updiv(N, X) (((N) + (X) - 1) / (X))
#define sigma(a, b) (((a) + (b)) * ((b) - (a) + 1) / 2)
#define INT(...)     \
    int __VA_ARGS__; \
    scan(__VA_ARGS__)
#define LL(...)     \
    ll __VA_ARGS__; \
    scan(__VA_ARGS__)
#define STR(...)        \
    string __VA_ARGS__; \
    scan(__VA_ARGS__)
#define CHR(...)      \
    char __VA_ARGS__; \
    scan(__VA_ARGS__)
#define DOU(...)        \
    double __VA_ARGS__; \
    scan(__VA_ARGS__)
#define LD(...)     \
    ld __VA_ARGS__; \
    scan(__VA_ARGS__)
#define pb push_back
#define eb emplace_back
#line 3 "library/template/alias.hpp"

using ll = long long;
using ld = long double;
using pii = std::pair<int, int>;
using pll = std::pair<ll, ll>;
constexpr int inf = 1 << 30;
constexpr ll INF = 1LL << 60;
constexpr int dx[8] = {1, 0, -1, 0, 1, -1, 1, -1};
constexpr int dy[8] = {0, 1, 0, -1, 1, 1, -1, -1};
constexpr int mod = 998244353;
constexpr int MOD = 1e9 + 7;
#line 3 "library/template/func.hpp"

template <typename T>
inline bool chmax(T& a, T b) { return ((a < b) ? (a = b, true) : (false)); }
template <typename T>
inline bool chmin(T& a, T b) { return ((a > b) ? (a = b, true) : (false)); }
template <typename T, typename U>
std::ostream &operator<<(std::ostream &os, const std::pair<T, U> &p) {
    os << p.first << " " << p.second;
    return os;
}
template <typename T, typename U>
std::istream &operator>>(std::istream &is, std::pair<T, U> &p) {
    is >> p.first >> p.second;
    return is;
}
template <typename T>
std::ostream &operator<<(std::ostream &os, const std::vector<T> &v) {
    for (auto it = std::begin(v); it != std::end(v);) {
        os << *it << ((++it) != std::end(v) ? " " : "");
    }
    return os;
}
template <typename T>
std::istream &operator>>(std::istream &is, std::vector<T> &v) {
    for (T &in : v) {
        is >> in;
    }
    return is;
}
inline void scan() {}
template <class Head, class... Tail>
inline void scan(Head &head, Tail &...tail) {
    std::cin >> head;
    scan(tail...);
}
template <class T>
inline void print(const T &t) { std::cout << t << '\n'; }
template <class Head, class... Tail>
inline void print(const Head &head, const Tail &...tail) {
    std::cout << head << ' ';
    print(tail...);
}
template <class... T>
inline void fin(const T &...a) {
    print(a...);
    exit(0);
}
#line 3 "library/template/util.hpp"

struct IOSetup {
    IOSetup() {
        std::cin.tie(nullptr);
        std::ios::sync_with_stdio(false);
        std::cout.tie(0);
        std::cout << std::fixed << std::setprecision(12);
        std::cerr << std::fixed << std::setprecision(12);
    }
} IOSetup;
#line 3 "library/template/debug.hpp"

#ifdef LOCAL
#include <dump.hpp>
#else
#define debug(...)
#endif
#line 8 "library/template/template.hpp"
using namespace std;
#line 2 "A.cpp"

int main() {
}
