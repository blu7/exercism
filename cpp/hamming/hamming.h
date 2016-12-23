//
// Created by luke on 13.10.16.
//
#include <string>
#include <stdexcept>
#ifndef HAMMING_HAMMING_H
#define HAMMING_HAMMING_H



class hamming {
public:
    static int compute(std::string a, std::string b) {
        if (a.length() != b.length()) {
            throw std::domain_error("Strings have unequal length.");
        }

        int count = 0;
        for (std::string::size_type i = 0; i < a.length(); i++) {
            count += a[i] != b[i] ? 1 : 0;
        }
        return count;
    }

};
#endif //HAMMING_HAMMING_H
