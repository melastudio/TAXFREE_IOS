//
//  Rachunek.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 05.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import Foundation

//https://granica.gov.pl/TaxFree/Services/ModulSprzedazy_v1.wsdl

enum Waluta {
    case PLN, EUR, CHF, GBP
}

class Rachunek {
    var wystawca: Wystawca
    var podrozny: Podrozny
    var nrRachunku: String?
    var wartosc: Float32?
    var kodWaluty: Waluta?
    var dataWystawienia:NSDate?
    var listaAsortymentu: [String]=[]
    var opisAsortymentu:String?
    
    init(wystawca: Wystawca,podrozny: Podrozny, nrRachunku: String,wartosc: Float32,kodWaluty:Waluta,dataWystawienia:NSDate,listaAsortymentu: [String],opisAsortymentu:String) {
        self.wystawca = wystawca
        self.podrozny=podrozny
        self.nrRachunku=nrRachunku
        self.wartosc=wartosc
        self.kodWaluty=kodWaluty
        self.dataWystawienia=dataWystawienia
        self.listaAsortymentu=listaAsortymentu
        self.opisAsortymentu=opisAsortymentu
    }
}

