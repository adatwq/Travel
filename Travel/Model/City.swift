//
//  City.swift
//  Travel
//
//  Created by Arwa on 13/07/1444 AH.
//

import SwiftUI


struct City {
    var name: String
    var country: String
    var currency: String
    var places: [Place]
    
}

var cities: [City] = [ City(name: "Riyadh", country: "KSA", currency: "SAR", places: RiyadhPlaces), City(name: "Dubai", country: "UAE", currency: "AED", places: DubaiPlaces),
    City(name: "Doha", country: "QAT", currency: "QAR", places: DohaPlaces)
    ,City(name: "Kuwait",  country: "KWT", currency: "KWD", places: KuwaitPlaces)
                   
]


