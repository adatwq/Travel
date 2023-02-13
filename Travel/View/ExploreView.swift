//
//  ExploreView.swift
//  Travel
//
//  Created by Arwa on 13/07/1444 AH.
//

import SwiftUI

struct ExploreView: View {
    
    @State var origin : City = cities[0]
    @State var destination : City  = cities[1]
    @State var isPresented : Bool = false
    @State var showingAlert = false
    var TravelVM = TravelViewModel()
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing: 90) {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Currency, Best places")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Search your destination")
                    }
                    .padding(.trailing, 150)
                    VStack {
                        HStack {
                            Image(systemName: "airplane.departure")
                            Text("From")
                            Spacer()
                            Image(systemName: "airplane.arrival")
                            Text("To")
                          
                        }
                        .padding(.horizontal, 50)
                        
                        HStack {
                            Menu {
                                ForEach(cities.indices, id: \.self) { city in
                                    Button {
                                        origin = cities[city]
                                        print(origin)
                                    } label: {
                                        Text(cities[city].name)
                                    }
                                    
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170.0, height: 50.0)
                                        .foregroundColor(.gray)
                                        .opacity(0.3)
                                        .cornerRadius(8)
                                    HStack{
                                        Text("\(origin.name), \(origin.country)")
                                            .foregroundColor(.white)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            Menu {
                                ForEach(cities.indices, id: \.self) { city in
                                    Button {
                                        destination = cities[city]
                                        print(destination)
                                    } label: {
                                        Text(cities[city].name)
                                    }
                                    
                                }
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 170.0, height: 50.0)
                                        .foregroundColor(.gray)
                                        .opacity(0.3)
                                        .cornerRadius(8)
                                    HStack{
                                        Text("\(destination.name), \(destination.country)")
                                            .foregroundColor(.white)
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        if origin.name == destination.name {
                            showingAlert = true
                        }else {
                            isPresented = true
                        }
                      
                    } label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 140.0, height: 39.0)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                            Text("Go")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    

                    
                }
                .padding(.bottom, 200)
                .sheet(isPresented: $isPresented){
                    NavigationView {
                        JourneyDetailsView(origin: $origin, destination: $destination)
                            .toolbar {
                              
                                ToolbarItemGroup(placement: .cancellationAction) {
                                    Button(LocalizedStringKey("Cancel")) {
                                        isPresented.toggle()
                                    }.foregroundColor(Color.red)
                                }
                            }
                    }
                    
                   
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Invalid destination"), message: Text("The origin can't be equal to the destination"), dismissButton: .default(Text("Ok")))
                        }
            }
            .navigationTitle("Explore")
        }
       
    }
}
