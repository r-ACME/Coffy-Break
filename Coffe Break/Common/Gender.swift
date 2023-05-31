//
//  Gender.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    case other = "Outro"
    case notInformed = "Prefiro não dizer"
    
    var id: String {
        self.rawValue
    }
}
