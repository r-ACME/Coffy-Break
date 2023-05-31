//
//  CaffeineInputType.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation

enum CaffeineInputType: String, CaseIterable, Identifiable{
    case halfcup = "Meia Xicara - 85mg"
    case cup = "Xicara - 170mg"
    case pill = "Remedio - 30mg"
    case chocolate = "Chocolate - 45mg"
    case other = "Outros - 100mg"
    
    var id: String {
        self.rawValue
    }
}
