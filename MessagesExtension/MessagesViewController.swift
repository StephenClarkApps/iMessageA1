//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Stephen Clark on 24/10/2016.
//  Copyright © 2016 Activated App Ltd. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController, AddMessageViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    
    func addMessageViewControllerDidSubmit(image: UIImage, caption: String) {
    
        // MARK: Define our custom MSMessage
        
        let components = NSURLComponents()
        
        let layout = MSMessageTemplateLayout()
        
        layout.caption = caption

        layout.image = image
        
        let message = MSMessage()
        
        message.url = components.url!
        
        message.layout = layout
        
        
        // we can take the MSMessage we created above and insert it into the
        // send field in iMessage
        self.activeConversation?.insert(message,  completionHandler: { (error: Error?) in
            
        })
        
        
    }
    
    
   /*
    @IBAction func sendMessageButtonPressed () {
        
        //  let conversation = self.activeConversation
        
        // MARK: Define our custom MSMessage
        let components = NSURLComponents()
        
        let layout = MSMessageTemplateLayout()
        layout.caption = "Cat"
        
        layout.subcaption = "subcaption"
        layout.trailingCaption = "trailing caption"
        layout.trailingSubcaption = "trailing subcaption"
        
        layout.image = UIImage(named: "cat.png")!
        let message = MSMessage()
        message.url = components.url!
        
        message.layout = layout
       
        
        // we can take the MSMessage we created above and insert it into the
        // send field in iMessage
        self.activeConversation?.insert(message,  completionHandler: { (error: Error?) in
            
        })
 
        
     
     
        conversation?.insertText("Test of inserting a text into an active conversation.", completionHandler: { (error: Error?) in
          // error handling
        })

 
    }  */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    private func presentViewController (for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        
        var controller: UIViewController!
        
        if presentationStyle == .compact {
            
            controller = instantiateAddMessageViewController()
            
        } else { // expanded
            controller = instantiateMessageDetailsViewController()
        }
        
        // Embed the new controller
        addChildViewController(controller)
        
        controller.view.frame = view.bounds
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        controller.didMove(toParentViewController: self)
    }
    
    private func instantiateMessageDetailsViewController () -> UIViewController {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "MessageDetailsViewController") as? MessageDetailsViewController else {
            fatalError("MessageDetailsViewController not found")
        }
        
        return controller
        
    }
    
    private func instantiateAddMessageViewController () -> UIViewController {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddMessageViewController") as? AddMessageViewController else {
            fatalError("AddMessageViewController not found")
        }
        
        return controller
        
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
        guard let conversation = activeConversation else {
            fatalError("Expected an active conversation")
        }
        
        presentViewController(for: conversation, with: presentationStyle)
        
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        
        
        
        
        
    }

}
