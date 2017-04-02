//
//  Validator.swift
//  TAXFREE-app
//
//  Created by Elżbieta Matus on 30.03.2017.
//  Copyright © 2017 Elżbieta Matus. All rights reserved.
//
import UIKit

class Validator {
    
    
    func validateAndRemove(fieldText: String,type: String) -> String
    {
        var set:String
        switch type {
        case "nazwa":
            set="AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuWwVvYyZzŹźŻż0123456789 -.!#$&'*+/?_{|}-"
        case "nrString":
            set="AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuWwVvYyZzŹźŻż0123456789\\/-\\."
        case "nrPaszport":
            set="AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpRrSsTtUuWwVvYyZz0123456789"
        case "nr":
            set="0123456789"
        default:
            return fieldText
        }
        let filtered=fieldText.characters.filter{ return set.contains(String($0))}
        return String(filtered)
    }
    
    func validate(fieldText: String,type: String) -> Bool
    {
        switch type {
        case "date":
            let pat="(\\d{4})-(\\d{2})-(\\d{2})"
            let regex = try! NSRegularExpression(pattern: pat, options: [])
            let matches = regex.numberOfMatches(in: fieldText, options: [], range: NSRange(location: 0, length: fieldText.characters.count))
            if matches>0 {return true}
        case "postal_code":
            let pat="^[0-9]{2}-[0-9]{3}$"
            let regex = try! NSRegularExpression(pattern: pat, options: [])
            let matches = regex.numberOfMatches(in: fieldText, options: [], range: NSRange(location: 0, length: fieldText.characters.count))
            if matches>0 {return true}
        case "NIP": //walidacja polskiego NIP
          let nip=fieldText.characters.filter{ return "^[\\s-]$".contains(String($0))}
            if String(nip).characters.count<10 {
                return false
            }
            for i in 0..<10 {
                if Int(String(nip[i])) == nil {
                    return false
                }
            }
            var sum:Int = 6 * Int(String(nip[0]))! + 5 * Int(String(nip[1]))! + 7 * Int(String(nip[2]))! + 2 * Int(String(nip[3]))! + 3 * Int(String(nip[4]))! + 4 * Int(String(nip[5]))! + 5 * Int(String(nip[6]))! + 6 * Int(String(nip[7]))! + 7 * Int(String(nip[8]))!
            sum = sum % 11
            if (Int(String(nip[9]))! != sum && sum != 10) {
                return false
            }
            return true
        default:
            return false
        }
        return false
    }

}

/*function NIPValidate(nip) {
    if (nip == null) {
        return false;
    }
    nip = nip.replace(/[\s-]/g, '');
    if (nip.length != 10) {
        return false;
    }
    for (i = 0; i < 10; i++)
    if (isNaN(nip.charAt(i))) {
        return false;
    }
    sum = 6 * nip.charAt(0) + 5 * nip.charAt(1) + 7 * nip.charAt(2) + 2 * nip.charAt(3) + 3 * nip.charAt(4) + 4 * nip.charAt(5) + 5 * nip.charAt(6) + 6 * nip.charAt(7) + 7 * nip.charAt(8);
    sum = sum % 11;
    if (nip.charAt(9) != sum & sum != 10) {
        return false;
    }
    return true;
}
*/
