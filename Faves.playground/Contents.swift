//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Creating my dictionary
var movieDict: [String:String]
movieDict = ["Al Pacino": "The Godfather", "Robert Taylor": "Waterloo Bridge", "Tony Leung": "Infernal Affairs", "Kevin Spacey": "The Life of David Gale", "Humphrey Bogart": "Casablanca", "Leonardo DiCaprio": "Titanic", "YMakoto Shinkai": "Your Name"]



// Create arrays for keys and values, getting them from the dict.
// Sort these 2 arrays.
var keys = Array(movieDict.keys).sorted()
var values = Array(movieDict.values).sorted()


// Creating the set for actors
var keysSet = Set<String>()
keysSet.insert(keys[0])
keysSet.insert(keys[3])
keysSet.insert(keys[5])

// Creating the set for movies
var valuesSet = Set<String>()
valuesSet.insert(values[1])
valuesSet.insert(values[2])
valuesSet.insert(values[4])

// Use a "for loop" to print them out
for actor in keysSet{
    print("One of my favorite actors is: \(actor)")
}

for movie in valuesSet{
    print("One of my favorite movie is: \(movie)")
}
