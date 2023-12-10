//
//  UserVerificationViewController.swift
//  GoodSpaceTask
//
//  Created by ShreyGupta on 06/12/23.
//

import Foundation
import UIKit

class UserVerificationViewController : UIViewController {
    
    
    @IBOutlet weak var otpInfoLbl: UILabel!
    @IBOutlet weak var otpRecievedInfolbl: UILabel!
    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    
    var userMobileNumber : String?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpTextField1.delegate = self
        otpTextField2.delegate = self
        otpTextField3.delegate = self
        otpTextField4.delegate = self
        
        getInfoLblText()
        
        
        let editNumberBtn = UIBarButtonItem(title: "", image: UIImage(named: "editIcon"), target: self, action: #selector(editButtonTapped))
        let editNumberBtnText = UIBarButtonItem(title: "Edit Phone number", style: UIBarButtonItem.Style.plain, target: self, action: #selector(editButtonTapped))
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [fixedSpace, editNumberBtn, editNumberBtnText]
        
    }
    
    
    @IBAction func resendOtpTapAction(_ sender: UIButton) {
        
    }
    
    @IBAction func verifyBtnTapAction(_ sender: UIButton) {
        
        verifyOtp()
        showUserDashBoard()
        
    }
    
    
    private func getInfoLblText() {
        
        guard let number = userMobileNumber else {return}
        let text = "OTP sent to " + number + "\nEnter OTP to confirm your phone"
        
        let attributedtext = NSMutableAttributedString(string: text)
        let attributedTextRange = (attributedtext.string as NSString).range(of: number)
        
        attributedtext.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: attributedTextRange)
        
        otpInfoLbl.attributedText = attributedtext
        
        otpRecievedInfolbl.text = "You’ll receive a four digit verification code."
    }
    
    
    private func verifyOtp() {
        
    }
    
    private func showUserDashBoard() {
        
        KSharedAppDelegate.showTabbar()
    }
    
    @objc func editButtonTapped() {
        
    }
}

extension UserVerificationViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        otpTextField1.resignFirstResponder()
        otpTextField2.resignFirstResponder()
        otpTextField3.resignFirstResponder()
        otpTextField4.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        return updatedText?.count ?? 0 <= 1
    }
}
