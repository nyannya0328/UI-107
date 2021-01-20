//
//  Home.swift
//  UI-107
//
//  Created by にゃんにゃん丸 on 2021/01/20.
//

import SwiftUI
import MobileCoreServices

let  ang = AngularGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center)



struct Home: View {
    @StateObject var model = HomeViewModel()
    var columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
    var body: some View {
        VStack(spacing:10){
            
            ScrollView{
                
                LazyVGrid(columns: columns,spacing: 15, content: {
                    
                    ForEach(model.imgs){image in
                        
                        Image(image.image)
                            .resizable()
                            .frame(height: UIDevice.current.orientation.isLandscape ?  300 : 150)
                            .cornerRadius(10)
                            .onDrag({
                                
                                NSItemProvider(item: .some(URL(string: image.image)! as NSSecureCoding),typeIdentifier: String(kUTTypeURL))
                            })
                            
                            
                        
                        
                        
                    }
                    
                })
                .padding()
                
            }
            
            ZStack{
                
                if model.selectedimage.isEmpty{
                    
                    Text("Drop Image")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(.blue)
                    
                        
                    
                    
                    
                }
                
                
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        
                        HStack(spacing:10){
                            
                            
                            ForEach(model.selectedimage,id:\.image){image in
                                
                                ZStack(alignment: .topTrailing, content: {
                                    
                                    Image(image.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Button(action: {
                                        
                                        withAnimation(.easeOut){
                                            
                                            model.selectedimage.removeAll { (check) -> Bool in
                                                
                                                if check.image == image.image{
                                                    
                                                    
                                                    return true
                                                }
                                                else{return false}
                                                
                                               
                                            }
                                            
                                        }
                                        
                                        
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .background(ang)
                                            .clipShape(Circle())
                                            .shadow(color: Color.black.opacity(0.03), radius: 5, x: 0, y: 8)
                                            
                                    })
                                    
                                    
                                })
                                
                                
                            }
                     
                            
                        }
                        
                      
                    })
                    .padding(.horizontal)
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .padding(.top,10)
                    .contentShape(Rectangle())
                    .frame(height: model.selectedimage.isEmpty ? 100 : nil)
                    .onDrop(of: [String(kUTTypeURL)], delegate: DragView(model: model))
                
                
                
            }
            
            
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
