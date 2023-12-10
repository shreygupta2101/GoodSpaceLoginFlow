//
//  SignUpViewController.swift
//  GoodSpaceTask
//
//  Created by ShreyGupta on 06/12/23.
//

import Foundation
import CoreLocation
import UIKit

class SignUpViewController : UIViewController {
    
    
    //MARK: @IBOutlet
    @IBOutlet weak var inputInfoLbl: UILabel!
    @IBOutlet weak var countryFlagImgView: UIImageView!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var otpInfoLbl: UILabel!
    
    var countryList : [CountryModel]?


    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        numberTextField.delegate = self
        getInputInfoText()
        getOtpInfotext()
    }
    
    //MARK: @IBAction
    @IBAction func getOtpBtnTapAction(_ sender: UIButton) {
        
        getOtp()
        initiateUserVerificationViewController()
    }
}

//MARK: private
extension SignUpViewController {
    
    private func getInputInfoText() {
        
        let text = NSMutableAttributedString(string: "Please enter your phone number to sign in GoodSpace account.")
        let attributedTextRange = (text.string as NSString).range(of: "GoodSpace")
        
        text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: attributedTextRange)
        
        inputInfoLbl.attributedText = text
    }
    
    private func getOtpInfotext() {
        
        let text = NSMutableAttributedString(string: "You will receive a 4 digit OTP")
        let attributedTextRange = (text.string as NSString).range(of: "4 digit OTP")
        
        text.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: attributedTextRange)
        
        otpInfoLbl.attributedText = text
    }
    
    private func getOtp() {
        
    }
  
    private func initiateUserVerificationViewController() {
            
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "UserVerificationViewController") as? UserVerificationViewController {
            
            viewController.userMobileNumber = numberTextField.text
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: UITextFieldDelegate
extension SignUpViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        return updatedText?.count ?? 0 <= 10
    }
}

