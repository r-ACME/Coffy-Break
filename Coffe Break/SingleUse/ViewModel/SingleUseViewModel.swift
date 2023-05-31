//
//  SingleUseViewModel.swift
//  Coffe Break
//
//  Created by coltec on 11/05/23.
//

import Foundation
import SwiftUI
import Combine

class SingleUseViewModel: ObservableObject{

    @Published var uiState: SingleUseUIState = .none
    
    @Published var consumer = Consumer.adult
    @Published var cup = ""
    @Published var pill = ""
    @Published var chocolate = ""
    @Published var other = ""
    var limit = 0.0
    var msg = ""
    var color = Color.white

    //        case halfcup = "Meia Xicara - 85mg"
    //        case cup = "Xicara - 170mg"
    //        case pill = "Remedio - 30mg"
    //        case chocolate = "Chocolate - 45mg"
    //        case other = "Outros - 100mg"
    
    func calculate(){
        
        switch consumer{
        case .adult:
            limit = 400.0
        case .child:
            limit = 100.0
        case .pregnant:
            limit = 200.0
        case .sensible:
            limit = 200.0
        }
        
        let qtdCup = Double(cup) ?? 0.0
        let qtdPill = Double(pill) ?? 0.0
        let qtdChocolate = Double(chocolate) ?? 0.0
        let qtdOther = Double(other) ?? 0.0
        
        let total = qtdCup * 170 + qtdPill * 30 + qtdChocolate * 45 + qtdOther * 100
        
        if (limit < total){
            msg = "Extrapolou o limite"
            color = Color.red
        }
        
        if (limit == total){
            msg = "Chegou no limite"
            color = Color.yellow
        }
        
        if (limit > total){
            msg = "Pode tomar mais"
            color = Color.green
        }
        self.uiState = .calculated
    }
    
    func alertView() -> some View{
        ZStack{
            Image("CupOfCoffe")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(color)
                .ignoresSafeArea()

            Text("")
                .alert(isPresented: .constant(true)){
                    Alert(title: Text("Coffe Break"),
                          message: Text(msg),
                          dismissButton:
                            .cancel(Text("Cancelar")){self.uiState = .none}
                    )
                    
            }
        }
    }
    
    
    func errorFix () {
        
        self.uiState = .none
    }
}
