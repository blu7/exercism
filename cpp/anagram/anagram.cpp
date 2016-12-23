#include "anagram.h"
#include <algorithm>
#include <boost/algorithm/string.hpp>

vector<string> anagram::anagram::matches(initializer_list<string> list) {
    vector<string> v(list);
    vector<string> r;
    for (const string & s : v) {
        if (isAnagram(s)) {
            r.push_back(s);
        }
    }
    return r;
}

bool anagram::anagram::isAnagram(string s) {
    string a = this-> a;
    boost::algorithm::to_lower(s);
    std::transform(s.begin(), s.end(), s.begin(), ::tolower);
    if (s != a && s.length() == a.length()) {
        for (const char &c : a) {
            int pos = s.find(c);
            if (pos < 0) {
                return false;
            }
            s.erase(s.begin() + pos);
        }
        return true;
    }
    return false;
}

anagram::anagram::anagram(string a) {
    boost::algorithm::to_lower(a);
    this->a = a;
}

