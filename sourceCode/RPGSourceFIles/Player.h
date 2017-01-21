/*
 Jeffrey Worley
 */
#include <iostream>
#include <cstring>
#include <vector>
#include "getInfo.h"


// this is a class with a bunch of methods

class Player {
public:
    Player(std::string tempName, int tempAge, int tempHealth, std::string tempJob);
    
    ///////////////////// get methods ///////////////////////////////////////////////////////////////////////////////
        void getName(std::string tempNameChange){
        name = tempNameChange;
    }
    
    void getAge(int tempAgeChange){
        age = tempAgeChange;
    }
    
    void getJob(std::string tempJobChange){
        job = tempJobChange;
    }
    
    void getDirection(std::string tempDirectionChange){
        direction = tempDirectionChange;
    }
    
    void getBackPackSize(int tempBackPackSizeChange){
        backPackSize = tempBackPackSizeChange;
    }
    
    ///////////////////// print methods ///////////////////////////////////////////////////////////////////////////////
    
    int printAge() {
        return age;
    }
    
    int printHealth(){
        return health;
    }
    
    std::string printName(){
        return name;
    }
    
    std::string printJob(){
        return job;
    }
    
    std::string printDirection(){
        return direction;
    }
    
    int printBackPackSize(){
        return backPackSize;
    }
    
    ///////////////////// health methods ///////////////////////////////////////////////////////////////////////////////
    
    void addHealth(int tempAdd){
        health = (health + tempAdd);
    }
    
    void subtractHealth(int damage){
        health = (health - damage);
    }
    
    ///////////////////// backpack methods ///////////////////////////////////////////////////////////////////////////////
    
    void addToBackPack(std::string itemToHave){
        
        std::string wouldLikeToPickUp = getInfo_tolower("Would you like to pick up this item? y/n\n");
        if(wouldLikeToPickUp == "y"){
            if(backPackSize > 0){
                backPackContents.emplace_back(itemToHave);
                std::cout << "you have added " << itemToHave << " to your backpack" << std::endl;
                backPackSize -= 1;
            }else {
                std::cout << "you can not pick that up. Your bag is full" << std::endl;
                pickUpResponse = getInfo_tolower("would you like to drop an item? y/n\n");
                if(pickUpResponse == "y"){
                    std::cout << "these are the items currently in your bag." << std::endl;
                    
                    for (std::vector<std::string>::const_iterator i = backPackContents.begin(); i != backPackContents.end(); ++i){
                        std::cout << *i << "\n";
                    }
                    
                    std::string removeResponse = getInfo_tolower("type in the name of the item you would like to remove\n");
                    int fooAddToBackPack = 1;
                    
                    while(fooAddToBackPack == 1){
                        if(std::find(backPackContents.begin(), backPackContents.end(), removeResponse) != backPackContents.end()){
                            backPackContents.erase(std::remove(backPackContents.begin(), backPackContents.end(), removeResponse), backPackContents.end());
                            backPackContents.emplace_back(itemToHave);
                            
                            std::cout << removeResponse << " has been removed from your backpack. " << itemToHave << " has been added to your backpack." << std::endl;
                            
                            fooAddToBackPack = 0;
                            
                        } else{
                            std::cout << "please type in the exact name of the item you want to remove" << std::endl;
                        }
                    }
                    
                } else if(pickUpResponse == "n"){
                    
                    std::cout << "no items were picked up and none were dropped" << std::endl;
                }
                
            }
        }else {
            std::cout << itemToHave << " was not picked up" << std::endl;
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    bool wasAddedToBackPack(std::string tempWasAdded){
        if(std::find(backPackContents.begin(), backPackContents.end(), tempWasAdded) != backPackContents.end()){
            return true;
        } else{
            return false;
        }
    }
    
private:
    
    std::string name;
    std::string job;
    std::string direction;
    std::string pickUpResponse;
    int age;
    int health;
    int backPackSize = 1;
    std::vector<std::string> backPackContents;
    
    
    
};


Player::Player(std::string tempName, int tempAge, int tempHealth, std::string tempJob) {
    name = tempName;
    age = tempAge;
    health = tempHealth;
    job = tempJob;
    backPackContents.emplace_back("water bottle");
    backPackSize -= 1;
}

/*
 Jeffrey Worley
 */