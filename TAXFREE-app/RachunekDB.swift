//
//  RachunekDB.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 07.05.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//

import SQLite

class RachunekDB {

    static let instance = RachunekDB()
    private let db: Connection?
    private let podrozni = Table("podrozny")
    private let id = Expression<Int64>("id")
    private let imiep = Expression<String>("imie")
    private let nazwisko = Expression<String>("nazwisko")
    private let nrpaszportu = Expression<String>("nrpaszportu")
    
    private let sklepy = Table("wystawca")
    private let ids = Expression<Int64>("id")
    private let nazwa = Expression<String>("nazwa")
    private let nip = Expression<String>("nip")
    private let ulica = Expression<String>("ulica")
    private let nrBudynku = Expression<String>("nrBudynku")
    private let nrLokalu = Expression<String>("nrLokalu")
    private let miejscowosc = Expression<String>("miejscowosc")
    private let kodPocztowy = Expression<String>("kodPocztowy")
    private let poczta = Expression<String>("poczta")
    
    private let dokumentyTF = Table("rachunek")
    private let idr = Expression<Int64>("id")
    private let idwystawca = Expression<Int64>("idwystawcy")
    private let idpodrozny = Expression<Int64>("idpodrozny")
    private let nrRachunku = Expression<String>("nrrachunku")
    private let wartoscd = Expression<Double>("wartosc")
    private let kodWaluty = Expression<String>("waluta")
    private let dataWystawienia = Expression<String>("datawystawienia")
    private let listaAsortymentu = Expression<String>("listaasortymentu")
    private let opisAsortymentu = Expression<String>("opisasortymentu")
    private let dataZgloszenia = Expression<String>("datazgloszenia")
    
    private let ustawienia = Table("ustawienia")
    private let ver = Expression<String>("ver")
    private let lang = Expression<String>("lang")

    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/taxfree.sqlite3")
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTableUstawienia()
        addUpdateUstawienia(Ver: "1.00", Lang: "pl")
        createTablePodrozny()
        createTableSklep()
        createTableRachunek()
        
    }
    
    func createTablePodrozny() {
        do {
            try db!.run(podrozni.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                //table.column(id, primaryKey: .Autoincrement)
                table.column(imiep)
                table.column(nazwisko)
                table.column(nrpaszportu, unique: true)
            })
        } catch {
            print("Unable to create table podrozny")
        }
    }
    
    func createTableSklep() {
        do {
            try db!.run(sklepy.create(ifNotExists: true) { table in
                table.column(ids, primaryKey: true)
                table.column(nazwa)
                table.column(nip)
                table.column(ulica)
                table.column(nrBudynku)
                table.column(nrLokalu)
                table.column(miejscowosc)
                table.column(kodPocztowy)
                table.column(poczta)
            })
        } catch {
            print("Unable to create table wystawca")
        }
    }

    func createTableRachunek() {
        do {
            try db!.run(dokumentyTF.create(ifNotExists: true) { table in
                table.column(idr, primaryKey: true)
                table.column(idwystawca)
                table.column(idpodrozny)
                table.column(nrRachunku)
                table.column(wartoscd)
                table.column(kodWaluty)
                table.column(dataWystawienia)
                table.column(listaAsortymentu)
                table.column(opisAsortymentu)
                table.column(dataZgloszenia)
            })
        } catch {
            print("Unable to create table rachunek: \(error)")
        }
    }
    
    func createTableUstawienia() {
        do {
            try db!.run(ustawienia.create(ifNotExists: true) { table in
                table.column(ver)
                table.column(lang)
            })
        } catch {
            print("Unable to create table ustawienia: \(error)")
        }
    }
    
    func addUpdateUstawienia(Ver: String, Lang: String) {
        do {
            let insert = ustawienia.insert(ver <- Ver, lang <- Lang)
            try db!.run(insert)
            print(insert.asSQL())
            //return 1
        } catch {
            print("Insert failed to podrozny: \(error)")
            //return -1
        }
    }
    

    func addPodrozny(Imie: String, Nazwisko: String, nrPaszportu: String) -> Int64? {
        do {
            let insert = podrozni.insert(imiep <- Imie, nazwisko <- Nazwisko, nrpaszportu <- nrPaszportu)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed to podrozny: \(error)")
            return -1
        }
    }
    
    func addSklep(Nazwa: String, Nip: String, Ulica: String, NrBudynku: String, NrLokalu: String, Miejscowosc: String, KodPocztowy: String, Poczta: String) -> Int64? {
        do {
            let insert = sklepy.insert(nazwa <- Nazwa, nip <- Nip, ulica <- Ulica, nrBudynku <- NrBudynku, nrLokalu <- NrLokalu, miejscowosc <- Miejscowosc,kodPocztowy <- KodPocztowy, poczta <- Poczta)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed to wystawca: \(error)")
            return -1
        }
    }
    
    func addRachunek(Imier: String, Nazwiskor: String, nrPaszportur: String, Nazwar: String, Nipr: String, Ulicar: String, NrBudynkur: String, NrLokalur: String, Miejscowoscr: String, KodPocztowyr: String, Pocztar: String, NrRachunkur: String, Wartoscr: Float64, KodWalutyr: String, DataWystawieniar: String, ListaAsortymentur: String, OpisAsortymentur:String, Datazgloszeniar: String) -> Int64? {
        do {
            let insert = dokumentyTF.insert(idwystawca <- self.addSklep(Nazwa: Nazwar, Nip: Nipr, Ulica: Ulicar, NrBudynku: NrBudynkur, NrLokalu: NrLokalur, Miejscowosc: Miejscowoscr, KodPocztowy: KodPocztowyr, Poczta: Pocztar)!, idpodrozny <- self.addPodrozny(Imie: Imier, Nazwisko: Nazwiskor, nrPaszportu: nrPaszportur)!, nrRachunku <- NrRachunkur, wartoscd <- Wartoscr, kodWaluty <- KodWalutyr, dataWystawienia <- DataWystawieniar, listaAsortymentu <- ListaAsortymentur, opisAsortymentu <- OpisAsortymentur, dataZgloszenia <- Datazgloszeniar)
            let id = try db!.run(insert)
            print(insert.asSQL())
            return id
        } catch {
            print("Insert failed to rachunek: \(error)")
            return -1
        }
    }
    
    func addUpdateUstawienia(Vers: String, Lang: String) {
        do {
            try db!.transaction
            {
                let update = try self.db!.scalar(self.ustawienia.count)
                if update==0 {
                    do {
                        let insert = self.ustawienia.insert(self.ver <- Vers, self.lang <- Lang)
                        try self.db!.run(insert)
                        print(insert.asSQL())
                        //return 1
                    } catch {
                        
                        print("Insert failed to ustawienia")
                    //return -1
                    }
                }
                else {
                    do {
                        try self.db!.run(self.self.ustawienia.update(self.ver <- Vers, self.lang <- Lang))
                        print("Updated ustawienia")
                    } catch {
                        
                        print("Update failed to ustawienia")
                    }
                }
            }

        } catch {
            print("transaction failed: \(error)")
        }
    }
    
    func getPodrozni() -> [Podrozny] {
        var podrozni = [Podrozny]()
        
        do {
            for podrozny in try db!.prepare(self.podrozni) {
                podrozni.append(Podrozny(
                    Id: podrozny[id],
                    Imie: podrozny[imiep],
                    Nazwisko: podrozny[nazwisko],
                    NrPaszportu: podrozny[nrpaszportu]))
            }
        } catch {
            print("Select failed from podrozny")
        }
        
        return podrozni
    }
    
    func getPodrozny(cid: Int64) -> Podrozny {
            let podrozny = podrozni.filter(id == cid)
        return Podrozny(Id: cid, Imie: String(describing: podrozny[imiep]) , Nazwisko: String(describing: podrozny[nazwisko]), NrPaszportu: String(describing: podrozny[nrpaszportu]))
    }
    
    func getWystawca(cid: Int64) -> Wystawca {
        let sklep = sklepy.filter(ids == cid)
        return Wystawca(Id: cid, Nazwa: String(describing: sklep[nazwa]), NIP: String(describing: sklep[nip]), Adres: Adres (Ulica: String(describing: sklep[ulica]),NrBudynku: String(describing: sklep[nrBudynku]), NrLokalu: String(describing: sklep[nrLokalu]), Miejscowosc: String(describing: sklep[miejscowosc]), KodPocztowy: String(describing: sklep[kodPocztowy]),Poczta: String(describing: sklep[poczta])))
    }
    
    func getRachunki() -> [Rachunek] {
        var rachunki = [Rachunek]()
        
        do {
            for rachunek in try db!.prepare(self.dokumentyTF) {
                rachunki.append(Rachunek(wystawca: getWystawca(cid: rachunek[idwystawca]), podrozny: getPodrozny(cid: rachunek[idpodrozny]),nrRachunku: rachunek[nrRachunku],wartosc: rachunek[wartoscd],kodWaluty: Waluta(rawValue: String(describing: rachunek[kodWaluty]))!,dataWystawienia: String(describing: rachunek[dataWystawienia]), listaAsortymentu: [rachunek[listaAsortymentu]], opisAsortymentu: String(describing: rachunek[opisAsortymentu])))}
        } catch {
            print("Select failed from rachunek")
        }
        
        return rachunki
    }
    
    func deletePodrozny(cid: Int64) -> Bool {
        do {
            let podrozny = podrozni.filter(id == cid)
            try db!.run(podrozny.delete())
            return true
        } catch {
            print("Delete failed from podrozny")
        }
        return false
    }
    
    func updatePodrozny(cid:Int64, newPodrozny: Podrozny) -> Bool {
        let podrozny = podrozni.filter(id == cid)
        do {
            let update = podrozny.update([
                imiep <- newPodrozny.imie,
                nazwisko <- newPodrozny.nazwisko,
                nrpaszportu <- newPodrozny.nrPaszportu
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed in podrozny: \(error)")
        }
        
        return false
    }
}

/*extension Date: Value {
    class var declaredDatatype: String {
        return String.declaredDatatype
    }
    class func fromDatatypeValue(stringValue: String) -> Date {
        return SQLDateFormatter.dateFromString(stringValue)!
    }
    var datatypeValue: String {
        return SQLDateFormatter.stringFromDate(self)
    }
}

let SQLDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    formatter.locale = Locale(localeIdentifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(forSecondsFromGMT: 0)
    return formatter
}()*/
