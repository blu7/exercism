//
// Created by luke on 13.10.16.
//

#ifndef LEAP_LEAP_H
#define LEAP_LEAP_H


class leap {

public:
    static bool is_leap_year(int year){
        return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
    }

};

#endif //LEAP_LEAP_H_H
