# PokeDex 
This is Angela Mugo's submission to the take home assignment linked [here](https://holafly.notion.site/iOS-Technical-Test-PokeAPI-556834f2a76f45a6b851f262190fcb4f)
## Sample Screenshots 
![IMG_8588](https://github.com/angiemugo/PokeDex/assets/23118371/13184fbb-2578-4d07-abd4-f79843d94f10)
![IMG_8589](https://github.com/angiemugo/PokeDex/assets/23118371/7fe99740-7d2c-447f-bea4-a648d3c80d0a)

## Prerequisites
These are the tools we need to run the project 
- Xcode 15.0 or newer 
- iOS 16 or newer

## Installation
1. `$ git clone https://github.com/angiemugo/PokeDex.git`
2. `$ cd PokeDex `
3. `$ open PokeDex.xcodeproj `


## Getting started 
1. Open the Xcode project in Xcode.
2. Build and run the project.
3. Explore the app on the iOS Simulator.


## Project Structure 
PokeDex/
│
├─ PokeDex/
│   ├── Common/
│   ├── graphql/
│   ├── PokemonList/
│   ├── PokenMonDetail/

├─ PokeDexUnitTests/

## Technologies Used
 **Programming Language:** Swift 6
 **Development Environment:** Xcode 15.0
 **Version Control:** Git
 **Dependency Manager:** SPM
 **UI Framework:** SwiftUI
 **Database:** Apollo SQLite cache Dependency
 **Networking:** Apollo iOS 
 **Testing Framework:** XCTest
 **Third-party Libraries:**: Apollo, SDWebImage


## App Features 
[X] Display a list of Pokemon retrieved from the PokeAPI. Each Pokemon should display the name, image, and type(s).
    - Using the apollo framork, I was able to group the two requests(get pokemons and get pokemon species) needed to get this information into one.
[X] Tapping a Pokemon in the list should display the Pokemon's detail view. The detail view should display the name, full image, type(s), abilities, and moves.
    - This information I got from the species endpoint 
[X] Allow the user to search for Pokemon by name.
    - This is implemented and using the searchfield should do this easily 
[X] Implement a basic caching mechanism to store previously retrieved Pokemon data and display it while offline.
    - Apollo comes with a caching method 
    - However the default method is an in memory cache so once the app is terminated then the cache is destroyed 
    - Inorder to cache in between launches I added an implemtation to use the SQLiteNormalizedCache that comes with apollo iOS 

**Technical Requirements:**
[X] Use SwiftUI, Combine and the latest version of Xcode.
[X] Use some Design patterns.
[X] Use the PokeAPI to retrieve and display Pokemon data.
[X] Use SOLID and good practices.
[X] Use a third-party library for image loading (e.g. KingFisher or SDWebImage).
[X] The app’s UI should be responsive on different devices and orientations.
[ ] Write unit tests for the networking layer of the app - I really struggled with this. Being relaltively new to apollo, I could not get my head around to mocking the client thus testing efficiently. There is also very limited documentation for this so I would need some more time to discover and learn how to do this. 


 

