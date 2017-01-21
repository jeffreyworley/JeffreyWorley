//
//  main.cpp
//  calenderProject
//
//  Created by WORLEY, JEFFREY on 1/30/15.
//  Copyright (c) 2015 WORLEY, JEFFREY. All rights reserved.
//

#include <iostream>
#include <ctime>
using namespace std;

int main(int argc, const char * argv[])
{
    //variables
    int birthYear, birthDay, birthMonth;
    
    time_t tim = time(0);
    
    
    // getting info
    cout << "what year were you born? (yyyy)" << endl;
    cin >> birthYear;
    
    cout << "what month were you born? (mm)" << endl;
    cin >> birthMonth;
    while (birthMonth > 12) {
        cout << "That is not a valid month. Please enter again" << endl;
        cin >> birthMonth;
    }
    
    cout << "what day were you born? (dd)" << endl;
    cin >> birthDay;
    
    while (birthDay > 31) {
        cout << "That is not a valid day. Please enter again" << endl;
        cin >> birthDay;
    }
    
    // end getting info
    
    int yearSec = birthYear * 31536000;
    int monthSec = birthMonth * 2678400;
    int daySec = birthDay * 86400;
    int totalSecLived = yearSec + monthSec + daySec;
    
    //calculating age
    int yourAgeSec = (tim + (1970 * 31536000)) - totalSecLived;
    int yourAgeYear = yourAgeSec / 31536000;
    int yourAgeMonth = (yourAgeSec % 31536000) / 2678400;
    int yourAgeDay = (yourAgeSec % ((yourAgeMonth * 2678400) + yourAgeYear * 31536000)) / 86400;
    int yourAgeSecAA = (yourAgeSec - ((yourAgeYear * 31536000) + (yourAgeMonth * 2678400) + (yourAgeDay * 86400)));
    
    
    // display age
    cout << "you are " << yourAgeSec << " seconds old" << endl;
    cout << "you are " << yourAgeYear << " years, " << yourAgeMonth << " months, " << yourAgeDay << " days, and " << yourAgeSecAA << " seconds old" << endl;
    
    return 0;
    
}

