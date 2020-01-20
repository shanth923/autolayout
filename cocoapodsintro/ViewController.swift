//
//  ViewController.swift
//  cocoapodsintro
//
//  Created by R Shantha Kumar on 10/10/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

//
//  ViewController.swift
//  TextFeilds
//
//  Created by R Shantha Kumar on 10/4/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import TextFieldEffects





class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    
    
    
 
    
    
    @IBOutlet weak var firstNameTextFeild: UITextField!
    @IBOutlet weak var secondNameTextFeild: UITextField!
    @IBOutlet weak var ageTextFeild: UITextField!
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var mobileTextFeild: UITextField!
    @IBOutlet weak var countryTextFeild: UITextField!
    @IBOutlet weak var stateTextFeild: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    
        @IBOutlet weak var genderSegment: UISegmentedControl!
   
    var todayDate = Date()
    var dateFormatter = DateFormatter()

    var ageDatePicker = UIDatePicker()
    var minimumDate = DateComponents()
    
    var pickerView = UIPickerView()


    
   @objc func ageDateEvent(){
    
    minimumDate.year = 1970
    minimumDate.month = 10
    minimumDate.day = 10
    
     let fromDate = Calendar.current.date(from: minimumDate)
    
           dateFormatter.dateFormat = "dd-MM-YYYY"
        
        ageDatePicker.maximumDate = todayDate
        ageDatePicker.minimumDate = fromDate
        
        var datePick = Calendar.current.dateComponents([.year,.month,.day], from:ageDatePicker.date, to: todayDate)

     ageTextFeild.text = dateFormatter.string(from: ageDatePicker.date)
    
    
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personnalDetails()
        
        ageDatePicker.datePickerMode = .date

    
        ageDatePicker.addTarget(self, action: #selector(ageDateEvent), for: UIControl.Event.valueChanged)
       
    
//        genderSegment.addTarget(self, action: #selector(segementFormat), for: UIControl.Event.valueChanged)
        ageTextFeild.inputView = ageDatePicker
        
        
        ageTextFeild.addTarget(self, action: #selector(ageDateEvent), for: UIControl.Event.valueChanged)
       
//        genderSegment.addTarget(self, action: #selector(segementFormat), for: UIControl.Event.valueChanged)
        
    }
 
    func personnalDetails(){
        
        
    
        firstNameTextFeild.delegate = self
        secondNameTextFeild.delegate = self
        ageTextFeild.delegate = self
        emailTextFeild.delegate = self
        mobileTextFeild.delegate = self
        addressTextView.delegate=self
        stateTextFeild.delegate = self
        countryTextFeild.delegate = self
  
    }
    
    @IBAction func submitBtns(_ sender: UIButton) {
        
        if(firstNameTextFeild.text!.count>1 &&
            secondNameTextFeild.text!.count>1 &&
            emailTextFeild.text!.count>1 &&
            addressTextView.text!.count>10 &&
            stateTextFeild.text!.count>10 &&
            countryTextFeild.text!.count>10 && stateTextFeild.text!.count>10)
//            (genderSegment.selectedSegmentIndex == 0 || genderSegment.selectedSegmentIndex == 1) )
            {
        
                let btnCntrl = UIAlertController(title: "Submit", message: "are you sure for submit", preferredStyle: UIAlertController.Style.alert)
                
                let btnAct = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel) { (calcenAct) in
                    
                }
                let btnAct2 = UIAlertAction(title: "submit", style: UIAlertAction.Style.default) { (calcenAct) in
                    
                    let btnCntrl3 = UIAlertController(title: "successful!", message: "data regestered", preferredStyle: UIAlertController.Style.alert)
                    let btnAct4 = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { (btn4act) in
                        
                    })
                    btnCntrl3.addAction(btnAct4)
                    self.present(btnCntrl3, animated: true, completion: nil)
                }
                btnCntrl.addAction(btnAct)
                btnCntrl.addAction(btnAct2)
                present(btnCntrl, animated: true, completion: nil)
        }
        else{
            let btnCntrl = UIAlertController(title: "wrong Submit", message: "fill all the blanks and submit properly", preferredStyle: UIAlertController.Style.alert)
            
            
            let btnAct3 = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            
            btnCntrl.addAction(btnAct3)
            present(btnCntrl, animated: true, completion: nil)
        }
        
    }
    
  
    var returnvalue:Bool = false
    var message:String!
    
    func toast (){
        
        
        let alertControl = UIAlertController(title: "Warning", message: "\(message!)", preferredStyle: UIAlertController.Style.actionSheet)
        
        
        let alerttype = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (OkAct) in
            
            
        }
        
        let alerttype2 = UIAlertAction(title: "cancel", style: UIAlertAction.Style.destructive) { (OkAct) in
            
            
        }
        
        alertControl.addAction(alerttype)
        alertControl.addAction(alerttype2)
        present(alertControl, animated: true, completion: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
      
        if(textField == firstNameTextFeild){
            
             return true
        }
        
        if (textField == secondNameTextFeild) {
            
            if(firstNameTextFeild.text!.count>1){
                
                return true
                
            }else
            {
                
                message = "Fill the blanks proper way"
                
                toast()
                return returnvalue
                
            }
        }
        else if (textField == ageTextFeild) {
            
            if(firstNameTextFeild.text!.count>1 &&
               secondNameTextFeild.text!.count>1)
                {
                
                return true
                
            }else
            {
                message = "Fill the blanks proper way"
                
                toast()
                return false
                
            }
        }
    
        else if (textField == emailTextFeild) {
            
            if(firstNameTextFeild.text!.count>1 &&         secondNameTextFeild.text!.count>1 &&
                (genderSegment.selectedSegmentIndex == 0 || genderSegment.selectedSegmentIndex == 1)){
                
                return true
                
            }else
            {
                message = "Fill the blanks proper way"
                
                toast()
                return returnvalue
                
            }
        }
        else if (textField == mobileTextFeild){
            
            if(firstNameTextFeild.text!.count>1 &&
                secondNameTextFeild.text!.count>1 && (genderSegment.selectedSegmentIndex == 0 || genderSegment.selectedSegmentIndex == 1) &&
                emailTextFeild.text!.count>1)
            {
                return true
                
            }else
            {
                message = "Fill the blanks proper way"
                
                toast()
                return returnvalue
                
            }
        }
    
        
        else if (textField == stateTextFeild){

            if(firstNameTextFeild.text!.count>1 &&
                secondNameTextFeild.text!.count>1 && (genderSegment.selectedSegmentIndex == 0 || genderSegment.selectedSegmentIndex == 1) &&
                emailTextFeild.text!.count>1 &&
                addressTextView.text!.count>10)
            {
                return true

            }else
            {
                message = "Fill the blanks proper way"
                
                toast()
                return false

            }
        }
            else if (textField == countryTextFeild){
                
                if(firstNameTextFeild.text!.count>1 &&
                    secondNameTextFeild.text!.count>1 && (genderSegment.selectedSegmentIndex == 0 || genderSegment.selectedSegmentIndex == 1 ) &&
                    emailTextFeild.text!.count>1 &&
                    addressTextView.text!.count>10 &&
                     stateTextFeild.text!.count>1)
                {
                    return true
                    
                }else
                {
                    message = "Fill the blanks proper way"
                    
                    toast()
                    return false
                    
                }
        
            }
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView){
        
        addressTextView.textColor = UIColor.white
    
     
    }
    func ValidEmail(emailStr:String) -> Bool {
        
        
        let emailRegEx = "[A-Z0-9a-z]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: emailStr)
        
    }
    func validMobile(mobile:String) -> Bool {
        
     
        let mobileStr = "^[6-9][0-9]{9}$"
        
        let mobilePre = NSPredicate(format:"SELF MATCHES %@", mobileStr)
        
        return mobilePre.evaluate(with: mobile)
        
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField){
        
        textField.backgroundColor = UIColor.lightGray
        
        
        }
        
        
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        
        textField.backgroundColor = UIColor.white
        
        if(textField == emailTextFeild){
            return ValidEmail(emailStr: textField.text!)
        }
        if(textField == mobileTextFeild){
            return validMobile(mobile: textField.text!)
        }

           return  true
    
    }
    

    
    func textFieldDidEndEditing(_ textField: UITextField){
        
        
    
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason){
    

    }
    
   
    

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
    
     
if(textField == firstNameTextFeild||textField == secondNameTextFeild||textField == stateTextFeild||textField == countryTextFeild){
            let allowCharacters = CharacterSet(charactersIn:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ")
            
            if(string.rangeOfCharacter(from: allowCharacters) != nil||string == ""){
                
            
                
            return true
            }else
            {
            
               toast()
                return  false
                
    }
            }
    
if(textField == mobileTextFeild){

            let allowCharacters = CharacterSet(charactersIn:"0123456789")

            if(string.rangeOfCharacter(from: allowCharacters) != nil||string == ""){



                return true
            }else
            {
                message = "invalid keyword"
                
                toast ()
                return false
            }

        }
    return true
    }
    func imagesIcon(uitextfeild:UITextField,icon:UIImage){
        
        
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 25, height:30))
        
        imageView.image = icon
        
        uitextfeild.leftView = imageView
        uitextfeild.leftViewMode = .always
        
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        
        
        
        
        
            if(mobileTextFeild.text?.count==10)
            {
               return true
                

            }
            else
            {
                message = "fill the blanks properly"
                toast()
                return false
            }
        
        
        
    }


func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
    
    let allowCharacters = CharacterSet(charactersIn:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-+=/")
    
    if(text.rangeOfCharacter(from: allowCharacters) != nil || text == ""){

        return true
    }else
    {
        message = "INVALID KEYWORDS"
        
        toast()
    }
    
    return true
    }
    
}







