/* 
 Jeffrey Worley
 */

#include <iostream>
#include <cstring>

class Villain {
public:
    void printInfo(){
        std::cout << "you are fighting against " << name << ". It's a " << vilClass << " who will do " << damage << " damage per hit." << std::endl;
    }
    
    Villain(std::string tempName, std::string tempClass, int tempDamage);

private:
    std::string name;
    std::string vilClass;
    int damage;
};

Villain::Villain(std::string tempName, std::string tempClass, int tempDamage){
    name = tempName;
    vilClass = tempClass;
    damage = tempDamage;
}

/*
 Jeffrey worley
*/