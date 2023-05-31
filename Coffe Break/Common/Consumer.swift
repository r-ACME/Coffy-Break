//
//  Consumer.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import Foundation

enum Consumer: String, CaseIterable, Identifiable{
    case adult = "Adulto"
    case child = "Criança"
    case pregnant = "Gravida"
    case sensible = "Sensivel"
    
    var id: String {
        self.rawValue
    }
}
