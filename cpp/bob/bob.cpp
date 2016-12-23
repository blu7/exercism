#include "bob.h"

string bob::hey(string s) {
    unsigned long l = s.length();
    if (isSilence(s)) {
        return "Fine. Be that way!";
    }
    else if (onlyNumbers(s)) {
        if (isQuestion(s)){
            return "Sure.";
        }
        return "Whatever.";
    }
    else if (isYelling(s)) {
        return "Whoa, chill out!";
    }
    else if (isQuestion(s)) {
        return "Sure.";
    }
    return "Whatever.";
}

bool bob::onlyNumbers(string s) {
    for(char& c : s) {
        if (isalpha(c)) {
            return false;
        }
    }
    return true;
}

bool bob::isQuestion(string s) {
    for (string::size_type i = s.length() - 1; i >= 0; i--) {
        if (!isblank(s[i])) {
            return s[i] == '?';
        }
    }
    return false;
}

bool bob::isSilence(string s) {
    for(char& c : s) {
        if (!isblank(c)) {
            return false;
        }
    }
    return true;
}

bool bob::isYelling(string s) {
    for(char& c : s) {
            if (islower(c)) {
                return false;
            }
    }
    return true;
}