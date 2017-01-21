//
//  Weapon.h
//  games
//
//  Created by jeff on 5/10/15.
//  Copyright (c) 2015 jeff. All rights reserved.
//

#include <iostream>
#include <cstring>

class Weapon{
public:
    
    Weapon(std::string tempName, int tempdamage, bool tempPlayerPossesion);
    
    void getName(std::string tempNameChange){
        name = tempNameChange;
    }
    
    void getDamage(int tempDamageChange){
        damage = tempDamageChange;
    }
    
    void getPlayerPossesion(bool tempPlayerPossesionChange){
        playerPossesion = tempPlayerPossesionChange;
    }
    
    int printDamage(){
        return damage;
    }
    
    std::string printName(){
        return name;
    }
    
    bool printPlayerPossesion(){
        return playerPossesion;
    }
    
    
    
private:
    std::string name;
    int damage;
    bool playerPossesion;
    
};

Weapon::Weapon(std::string tempName, int tempDamage, bool tempPlayerPossesion){
    name = tempName;
    damage = tempDamage;
    playerPossesion = tempPlayerPossesion;
    
}