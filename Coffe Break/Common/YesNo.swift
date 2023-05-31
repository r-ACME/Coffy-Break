//
//  YesNo.swift
//  Coffe Break
//
//  Created by coltec on 09/05/23.
//

import Foundation

enum YesNo: String, CaseIterable, Identifiable{
    case yes = "Sim"
    case no = "Não"
    
    var id: String {
        self.rawValue
    }
}
