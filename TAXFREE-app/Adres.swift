//
//  Adres.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 06.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

class Adres {
    var ulica:String?
    var nrBudynku:String?
    var nrLokalu:String?
    var miejscowosc:String?
    var kodPocztowy:String?
    var poczta:String?
    
    init(Ulica:String,NrBudynku:String,NrLokalu:String,Miejscowosc:String,KodPocztowy:String,Poczta:String) {
        self.ulica = Ulica
        self.nrBudynku = NrBudynku
        self.nrLokalu = NrLokalu
        self.miejscowosc = Miejscowosc
        self.kodPocztowy = KodPocztowy
        self.poczta = Poczta
    }
    
}
