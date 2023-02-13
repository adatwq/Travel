//
//  TravelViewModel.swift
//  Travel
//
//  Created by Arwa on 13/07/1444 AH.
//

import Foundation


class TravelViewModel {
    
 
    //MARK: - Functions
 
    
    func calculateJourneyDuration(origin: String, destination: String) -> String{
        var journeyDuration = ""
        if origin == "Riyadh" && destination == "Dubai" || origin == "Dubai" && destination == "Riyadh" {
            journeyDuration = "01h 55m"
        }
        
        if origin == "Riyadh" && destination == "Doha" || origin == "Doha" && destination == "Riyadh" {
            journeyDuration = "01h 25m"
        }
        
        if origin == "Riyadh" && destination == "Kuwait" || origin == "Kuwait" && destination == "Riyadh" {
            journeyDuration = "01h 20m"
        }
        
        if origin == "Doha" && destination == "Dubai" || origin == "Dubai" && destination == "Doha" {
            journeyDuration = "01h 15m"
        }
        
        if origin == "Kuwait" && destination == "Dubai" || origin == "Dubai" && destination == "Kuwait" {
            journeyDuration = "01h 50m"
        }
        
        if origin == "Doha" && destination == "Kuwait" || origin == "Kuwait" && destination == "Doha" {
            journeyDuration = "01h 25m"
        }
        
        return journeyDuration
    }
    
}
