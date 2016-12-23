#include <string>
#include <vector>

#ifndef ANAGRAM_ANAGRAM_H
#define ANAGRAM_ANAGRAM_H

using namespace std;

namespace anagram {
    class anagram {

    public:
        anagram(string a);
        vector<string> matches(initializer_list<string> list);

    private:
        string a;
        bool isAnagram(string s);
    };
}
#endif //ANAGRAM_ANAGRAM_H
