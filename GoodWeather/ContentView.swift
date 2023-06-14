//
//  ContentView.swift
//  GoodWeather
//
//  Created by Nikos Galinos on 1/6/23.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var weatherVM : WeatherViewModel
    
    init(){
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter A City Name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
            }.font(.custom("Arial", size: 40))
                .padding()
                .fixedSize()
            
            Text(self.weatherVM.temperature)
                .font(.custom("Arial", size: 80))
                .foregroundColor(Color.white)
                .offset(y:-200)
                .padding()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
