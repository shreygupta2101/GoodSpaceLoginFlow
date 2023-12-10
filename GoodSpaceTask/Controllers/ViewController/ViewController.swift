//
//  ViewController.swift
//  GoodSpaceTask
//
//  Created by ShreyGupta on 05/12/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initiateSignUpViewController()
    }
    
    private func initiateSignUpViewController() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

