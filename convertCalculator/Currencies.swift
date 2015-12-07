//
//  Currencies.swift
//  convertCalculator
//
//  Created by JerryMAc on 2015/12/3.
//  Copyright © 2015年 JerryMAc. All rights reserved.
//

import Foundation
import UIKit
import Money
class Currencies {
    
    
    var type: String
    var title: String
    var image: UIImage
    var value: Double
    
    
    
    var CurrencyTypeList: [String] = NSLocale.ISOCurrencyCodes()
    
    
    init(Currencytype: String,title: String,imageName: String,value:Double){
        
        self.type = Currencytype
        self.title =  title
        self.value =  value
        if let img = UIImage(named: imageName){
            image = img
        }else{
            image = UIImage(named: "default")!
        }
}

    
    func setValue(value:Double){
        self.value = value
    }

    
    
    
    

}





