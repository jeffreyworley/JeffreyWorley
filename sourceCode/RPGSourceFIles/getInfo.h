//
//  getInfo.h
//  games
//
//  Created by jeff on 5/10/15.
//  Copyright (c) 2015 jeff. All rights reserved.
//



std::string a ="";
std::string b = "";

std::string getInfo_tolower(std::string whatToSay) {
    a = "";
    b = "";
    std::cout << whatToSay;
    getline(std::cin, a);
    std::transform(a.begin(), a.end(), a.begin(), ::tolower);
    
    return a;
    
};

//input what is being said and takes input and puts it to upper case
std::string getInfo_toUpper(std::string whatToSay){
    std::cout << whatToSay << std::endl;
    a = "";
    b = "";
    getline(std::cin, a);
    
    for(int i = 0; i < a.length(); i++){
        a[i] = putchar(toupper(a[i]));
        b[i] = a[i];
    }
    
    return b;
};

//input what is being said and takes input and leaves it as it is
std::string getInfo(std::string whatToSay){
    std::cout << whatToSay << std::endl;
    a = "";
    getline(std::cin, a);
    return a;
};

//input what is being said and takes in an int input
float getInfo_Int(std::string whatToSay){
    std::cout << whatToSay << std::endl;
    float getInfo_Int_a;
    std::cin >> getInfo_Int_a;
    return getInfo_Int_a;
};