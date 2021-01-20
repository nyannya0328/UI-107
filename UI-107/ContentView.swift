//
//  ContentView.swift
//  UI-107
//
//  Created by にゃんにゃん丸 on 2021/01/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = HomeViewModel()
    var body: some View {
        NavigationView{
            
            Home()
                .navigationBarTitle("UI-107", displayMode: .inline)
                .toolbar(content: {
                    
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        
                       
                        
                        Button(action: {
                            
                            model.isdark.toggle()
                            
                        }, label: {
                            Image(systemName: "sun.min.fill")
                                .font(.system(size: 30, weight: .bold))
                        })
                        
                        
                        
                        
                    })
                    
                })
                    
                    
                    
                    
                }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(model.isdark ? .dark : .light)
                
        }
    
       
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
