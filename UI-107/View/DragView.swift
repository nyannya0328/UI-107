//
//  DragView.swift
//  UI-107
//
//  Created by にゃんにゃん丸 on 2021/01/20.
//

import SwiftUI
import MobileCoreServices

struct DragView: DropDelegate{
    
    var model : HomeViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        for provider in info.itemProviders(for: [String(kUTTypeURL)]){
            
            if provider.canLoadObject(ofClass: URL.self){
                print("URL Load")
                
                let _ = provider.loadObject(ofClass: URL.self) { (url, err) in
                   print(url!)
                    
                    
                    let statas = model.selectedimage.contains { (check) -> Bool in
                        if check.image == "\(url!)"{return true}
                        else{return false}
                      
                        
                    }
                    
                    if !statas{
                        
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut){
                                
                               model.selectedimage.append(img(id: model.selectedimage.count, image: "\(url!)"))
                                
                                
                                
                            }
                        }
                        
                    }
                    
                    
                }
                
                
                
                
            }
            else{
                
                print("Cannot Be load")
            }
            
        }
        
    
        
        
        
        return true
    }
}

