//
//  ResultViewController.swift
//  convertCalculator
//
//  Created by JerryMAc on 2015/12/3.
//  Copyright © 2015年 JerryMAc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
 {

    var Currency: Currencies!
    @IBOutlet weak var CurrencyTitleLabel: UILabel!
   
    @IBOutlet weak var CurrencyTypeLabel: UILabel!
    
    @IBOutlet weak var baseImage: UIImageView!
    

    @IBOutlet weak var baseTextField: UITextField!
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    
    @IBOutlet weak var rate1: UILabel!
    @IBOutlet weak var rate2: UILabel!
    @IBOutlet weak var rate3: UILabel!
    @IBOutlet weak var rate4: UILabel!
    
    @IBOutlet weak var result1: UILabel!
    
    @IBOutlet weak var result2: UILabel!
    @IBOutlet weak var result3: UILabel!
    
    @IBOutlet weak var result4: UILabel!
    
    @IBOutlet weak var UpdateTimeLabel: UILabel!
    var baseValue: Double = 0
    
    @IBAction func Calculate(sender: AnyObject) {
        baseTextField.resignFirstResponder()
        
        
        baseValue = Double(baseTextField.text!)!
        
        Currency.setValue(baseValue)
        
        
        
        CurrencySetup.exchange(Currency, Currency2: "TWD"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                
                
                self.result1.text = "\(self.baseValue) 塊 \(self.Currency.title) = \(result) 塊新台幣"
            })
            
        }
        
        
        CurrencySetup.exchange(Currency, Currency2: "USD"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                
                
                self.result2.text = "\(self.baseValue) 塊 \(self.Currency.title) = \(result) 美金"
            })
            
        }
        
        
        CurrencySetup.exchange(Currency, Currency2: "JPY"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                
                
                self.result3.text = "\(self.baseValue) 塊 \(self.Currency.title) = \(result) 塊日幣"
            })
            
        }
        
        
        
        
        CurrencySetup.exchange(Currency, Currency2: "EUR"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                
                
                self.result4.text = "\(self.baseValue) 塊 \(self.Currency.title) = \(result) 塊歐元"
            })
            
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CurrencyTitleLabel.text = Currency.title
        
        CurrencyTypeLabel.text = Currency.type
        
        baseImage.image = Currency.image
        
        
        
        
        // 台幣匯率
        CurrencySetup.exchange(Currency, Currency2: "TWD"){ rate,result in
        
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                self.rate1.text = " 1:\(rate) 塊新台幣"
                
            })

        }
        
        //美金匯率
        CurrencySetup.exchange(Currency, Currency2: "USD"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                self.rate2.text = "1: \(rate) 塊美金"
            })
            
        }
        
        //日幣匯率
        
        CurrencySetup.exchange(Currency, Currency2: "JPY"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                self.rate3.text = "1:\(rate) 塊日幣"
            })
            
        }
        //歐元匯率
        
        CurrencySetup.exchange(Currency, Currency2: "EUR"){ rate,result in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                self.rate4.text = "1:\(rate) 塊歐元"
            })
            
        }
        
        
      //更新時間
        
        
        CurrencySetup.getRateTime(Currency){ UpdateTime in
            
            dispatch_async(dispatch_get_main_queue(), {
                //perform all UI stuff here
                self.UpdateTimeLabel.text="更新時間: \(UpdateTime)"
            })
            
        }
        
        image1.image=UIImage(named: "TWD")
        image2.image=UIImage(named: "USD")
        image3.image=UIImage(named: "JPY")
        image4.image=UIImage(named: "EUR")
        
        
        
        
 
    }
    
    
    
    
  



}


