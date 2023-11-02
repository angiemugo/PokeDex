# PokeDex 
This is Angela Mugo's submission to the take home assignment linked [here](https://holafly.notion.site/iOS-Technical-Test-PokeAPI-556834f2a76f45a6b851f262190fcb4f)
## Sample Screenshots 
<img src="https://github.com/angiemugo/PokeDex/assets/23118371/13184fbb-2578-4d07-abd4-f79843d94f10" width="200" height="400" alt="Pokemons List">
<img src="https://github.com/angiemugo/PokeDex/assets/23118371/7fe99740-7d2c-447f-bea4-a648d3c80d0a" width="200" height="400" alt="Pokemons List">

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
- [x] Display a list of Pokemon retrieved from the PokeAPI. Each Pokemon should display the name, image, and type(s).
  - Using the Apollo framework, I could group the two requests (get pokemons and get pokemon species) needed to get this information into one.

- [x] Tapping a Pokemon in the list should display the Pokemon's detail view. The detail view should display the name, full image, type(s), abilities, and moves.
  - This information I got from the species endpoint.

- [x] Allow the user to search for Pokemon by name.
  - This is implemented, and using the search field should do this easily.

- [x] Implement a basic caching mechanism to store previously retrieved Pokemon data and display it while offline.
  - Apollo comes with a caching method.
  - However, the default method is an in-memory cache, so once the app is terminated, the cache is destroyed.
  - In order to cache in between launches, I added an implementation to use the SQLiteNormalizedCache that comes with Apollo iOS.

**Technical Requirements:**
- [x] Use SwiftUI, Combine, and the latest version of Xcode.
- [x] Use some Design patterns.
- [x] Use the PokeAPI to retrieve and display Pokemon data.
- [x] Use SOLID and good practices.
- [x] Use a third-party library for image loading (e.g. KingFisher or SDWebImage).
- [x] The app’s UI should be responsive on different devices and orientations.
- [ ] Write unit tests for the networking layer of the app - I really struggled with this. Being relatively new to Apollo, I could not get my head around mocking the client, thus testing efficiently. There is also minimal documentation for this, so I need more time to discover and learn how to do this.

