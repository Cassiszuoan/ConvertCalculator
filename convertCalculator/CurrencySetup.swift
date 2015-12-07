//
//  CurrencySetup.swift
//  convertCalculator
//
//  Created by JerryMAc on 2015/12/3.
//  Copyright © 2015年 JerryMAc. All rights reserved.
//

import Foundation
import Money

class CurrencySetup {
    
    
    var currencies: [Currencies]
    
    

    init (includedCurrencies: [Currencies]){
        currencies = includedCurrencies
    }
   
    
     class  func Setup()-> [Currencies] {
        
        var currencies = [Currencies]()
        
        
        
        currencies.append(Currencies(Currencytype: "TWD",title: "新台幣", imageName: "TWD",value: 100))
            
        currencies.append(Currencies(Currencytype: "USD", title: "美金", imageName: "USD",value: 100))
            
        currencies.append(Currencies(Currencytype: "JPY", title: "日幣", imageName: "JPY",value: 100))
        currencies.append(Currencies(Currencytype: "EUR", title: "歐元", imageName: "EUR",value: 100))
        currencies.append(Currencies(Currencytype: "CNY", title: "人民幣", imageName: "RMB",value: 100))
        currencies.append(Currencies(Currencytype: "KRW", title: "韓元", imageName: "KRW",value: 100))
        currencies.append(Currencies(Currencytype: "THB", title: "泰銖", imageName: "THB",value: 100))
        currencies.append(Currencies(Currencytype: "SGD", title: "新加坡幣",imageName:"SGD",value: 100))
        currencies.append(Currencies(Currencytype: "AUD", title: "澳幣", imageName: "AUD",value: 100))
        currencies.append(Currencies(Currencytype: "VND", title: "越南幣", imageName: "VND",value: 100))
        
        
        
        
        return currencies
        
        
    }
    
    
    
    static func  getRateTime(Currency:Currencies,completion: (String)->()){
        
        let url = NSURL(string: "http://download.finance.yahoo.com/d/quotes.csv?s=USDEUR=X&f=nl1d1t1");
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if let string = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                completion(String(UTF8String: string.componentsSeparatedByString(",")[2])!+" "+String(UTF8String: string.componentsSeparatedByString(",")[3])!)
                
                
                
                
            }
        }
        
        
        task.resume()
        
    }
    
    static func exchange(Currency1:Currencies,Currency2:String,completion: (Double,Double) -> ())

    
    {
        
        
        
        let header:String = "s="
        var queryString: String = "USDEUR"
        let others:String = "=X&f=nl1d1t1"
        var exchangeRate:Double = 0
        var result:Double = 0
        queryString=Currency1.type+Currency2
        let url = NSURL(string: "http://download.finance.yahoo.com/d/quotes.csv?\(header)\(queryString)\(others)");
        
        let baseValue = Currency1.value
        
        
        
        
        

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            if let string = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                 exchangeRate = Double(string.componentsSeparatedByString(",")[1])!
                 result = exchangeRate * baseValue
                
                
                print("\(baseValue) \(Currency1.title) = \(result)\(Currency2)")
                
                completion(Double(string.componentsSeparatedByString(",")[1])!,result)
                
                
                
                
            }
        }
        
        
        task.resume()

    
        
    }
    
    
    
   
    
    
    
    
    
}