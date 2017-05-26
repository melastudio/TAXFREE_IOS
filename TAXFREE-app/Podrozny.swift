//
//  Podrozny.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 05.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

class Podrozny {
    var id:Int64
    var imie:String
    var nazwisko:String
    var nrPaszportu:String
    
    init(Id: Int64, Imie: String,Nazwisko: String,NrPaszportu:String) {
        self.id=Id
        self.imie = Imie
        self.nazwisko = Nazwisko
        self.nrPaszportu = NrPaszportu
    }

}
