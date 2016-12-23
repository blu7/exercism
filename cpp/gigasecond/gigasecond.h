//
// Created by luke on 13.10.16.
//
#include "boost/date_time/gregorian/gregorian.hpp"
#ifndef GIGASECOND_GIGASECOND_H
#define GIGASECOND_GIGASECOND_H

using namespace boost;

class gigasecond {
public:
    static gregorian::date advance (gregorian::date date) {
        auto gigasecondToDays = gregorian::date_duration(1000000000 / 60 / 60 / 24);
        return date + gigasecondToDays;
    }



};


#endif //GIGASECOND_GIGASECOND_H
