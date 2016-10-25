//
//  AddMessageViewController.swift
//  iMessageExampleC
//
//  Created by Stephen Clark on 25/10/2016.
//  Copyright © 2016 Activated App Ltd. All rights reserved.
//

import UIKit

protocol AddMessageViewControllerDelegate: class {
    func addMessageViewControllerDidSubmit (image: UIImage, caption: String)
}

class AddMessageViewController: UIViewController {
    
    weak var delegate: AddMessageViewControllerDelegate!
    
    override func viewDidLoad() {
        
        
    }
    
    
    
    @IBAction func addMessage() {
        let img = UIImage(imageLiteralResourceName: "cat.png")
        let caption = "My Cat"
        
        self.delegate.addMessageViewControllerDidSubmit(image: img, caption: caption)
        
    }
}
