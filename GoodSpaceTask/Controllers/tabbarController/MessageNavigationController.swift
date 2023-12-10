//
//  MessageNavigationController.swift
//  GoodSpaceTask
//
//  Created by ShreyGupta on 09/12/23.
//

import Foundation
import UIKit

class MessageNavigationController : UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setupNavigationBarAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNavigationBarAppearance()
    }

    private func setupNavigationBarAppearance() {
        
        self.navigationBar.isTranslucent = false
        self.isNavigationBarHidden = true
    }
}
