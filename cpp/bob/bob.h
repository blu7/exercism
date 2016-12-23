#include <string>

#ifndef bob_bob_h
#define bob_bob_h

using std::string;

class bob {

public:
    static string hey (string s);

private:
    static bool onlyNumbers(string s);
    static bool isYelling (string s);
    static bool isQuestion (string s);
    static bool isSilence (string s);
};
#endif
