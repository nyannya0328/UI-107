//
//  HomeViewModel.swift
//  UI-107
//
//  Created by にゃんにゃん丸 on 2021/01/20.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selectedimage : [img] = []
    
    @Published var imgs = [
        img(id: 0, image: "p1"),
        img(id: 1, image: "p2"),
        img(id: 2, image: "p3"),
        img(id: 3, image: "p4"),
        img(id: 4, image: "p5"),
        img(id: 5, image: "p6"),
        img(id: 6, image: "p7"),
        img(id: 7, image: "p8"),
        img(id: 8, image: "p9"),
        img(id: 9, image: "p10")
    
    
    ]
    @Published var isdark = false
    
}

