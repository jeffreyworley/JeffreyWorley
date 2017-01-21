//
//  main.cpp
//  sldkgj;sdlfgjk
//
//  Created by WORLEY, JEFFREY on 4/27/15.
//  Copyright (c) 2015 WORLEY, JEFFREY. All rights reserved.
//

#include <iostream>
#include <cstring>
#include "Villain.h"
#include "Player.h"
#include "Weapon.h"




int main(int argc, const char * argv[]) {
    
    Player p1((getInfo("What is your name?")), getInfo_Int("How old are you?"), 50, getInfo_tolower(""));
    std::string job1 = getInfo_tolower("Were you a \n \t Doctor? \n \t Farmer? \n \t or Athlete?\n");
    
    p1.getJob(job1);
    
    while(job1 != "doctor" && job1 != "farmer" && job1 != "athlete"){
        p1.getJob(getInfo_tolower("Invalid input. Please respond with Doctor, Farmer, or Athlete\n"));
    }
    
    std::cout << "You are " << p1.printName() << ". You were a " << p1.printJob() << ". You are " << p1.printAge() << " years old." << std::endl;
    
    std::string hello = getInfo_tolower("Is this info correct? y/n\n");
    
    while(hello != "y"){
        
        p1.getName(getInfo("What is your name?"));
        p1.getAge(getInfo_Int("How old are you"));
        std::string throwaway1 = getInfo_tolower("");
        p1.getJob(getInfo_tolower("Were you a \n \t Doctor? \n \t Farmer? \n \t Athlete?\n"));
        
        std::cout << "You are " << p1.printName() << ". You were a " << p1.printJob() << ". You are " << p1.printAge() << " years old." << std::endl;
        
        hello = getInfo_tolower("is this info correct? y/n\n");
    }
    
    p1.getDirection(getInfo_tolower("you find youself at an intersection. do you go left, straight, or right? r/s/l\n"));
    
    Weapon bloodyAxe("BloodyAxe", 15, false);
    
    int foo1 = 1;
    while(foo1 == 1){
        
        if(p1.printDirection() == "r"){
            std::cout << "you turned right" << std::endl;
            std::cout << "you have found a " << bloodyAxe.printName() << "." << std::endl;
            p1.addToBackPack("bloodyAxe");
            bloodyAxe.getPlayerPossesion(p1.wasAddedToBackPack("bloodyAxe"));
            
            foo1 = 0;
        }else if(p1.printDirection() == "s"){
            std::cout << "you went straight" << std::endl;
            std::cout << "there's nothing here. You should start over. Next time I would reccomend going right." << std::endl;
            foo1 = 0;
        }else if(p1.printDirection() == "l"){
            std::cout << "you turned left" << std::endl;
            std::cout << "there's nothing here. You should start over. Next time I would reccomend going right." << std::endl;
            foo1 = 0;
        }else{
            p1.getDirection(getInfo_tolower("input invalid. Please respond l or s or r\n"));
        }
    }
    
    return 0;
}


