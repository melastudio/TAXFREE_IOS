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
    
    init(ulica:String,nrBudynku:String,nrLokalu:String,miejscowosc:String,kodPocztowy:String,poczta:String) {
        self.ulica = ulica
        self.nrBudynku = nrBudynku
        self.nrLokalu = nrLokalu
        self.miejscowosc = miejscowosc
        self.kodPocztowy = kodPocztowy
        self.poczta = poczta
    }
    
}
