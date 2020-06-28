//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    let db = Firestore.firestore()

    var messages: [Message] = [
        Message(sender: "123@123.com", body: "Hi"),
        Message(sender: "aksjdhkjsakjd@adjsalkjdlkasjdl.com", body: "Hello"),
        Message(sender: "123@123.com", body: "How are you?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - DO NOT FORGET TO TRIGGER DELEGATES METHODS
        tableView.dataSource = self
        messageTextfield.delegate = self
        
        navigationItem.title = K.appName
        navigationItem.hidesBackButton = true

        //MARK: - Register Nib as CellView
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - UITableViewDataSource - responsible to populating the TableView (how many cells....etc)
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        let messageIndex = indexPath.row
        cell.label.text = messages[messageIndex].body
        return cell
    }
}

//MARK: - UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.hideKeyboardWhenTappedAround()
        messageTextfield.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if messageTextfield.text != "" {
            return true
        } else {
            messageTextfield.placeholder = "Write a message..."
            return false
        }
    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        messageTextfield.text = ""
//    }
    @IBAction func sendPressed(_ sender: UIButton) {
           if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
               db.collection(K.FStore.collectionName)
                   .addDocument(data: [K.FStore.senderField :messageSender, K.FStore.bodyField: messageBody]) { error in
                       if let e = error {
                           let alert = UIAlertController(title: "Error while saving your message!", message: e.localizedDescription, preferredStyle: .actionSheet)
                           let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

                           alert.addAction(alertAction)
                           self.present(alert, animated: true)
                       } else {
                           print("Message was saved successfully")
                       }
               }
           }
        messageTextfield.endEditing(true)
        messageTextfield.text = ""
       }
}
