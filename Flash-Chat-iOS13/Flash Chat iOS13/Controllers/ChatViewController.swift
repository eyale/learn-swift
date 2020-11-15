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

    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - DO NOT FORGET TO TRIGGER DELEGATES METHODS
        tableView.dataSource = self
        messageTextfield.delegate = self
        
        navigationItem.title = K.appName
        navigationItem.hidesBackButton = true

        //MARK: - Register Nib as CellView
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        tableView.isUserInteractionEnabled = false

        loadMessages()
    }

    func loadMessages() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { (snapshot, error) in
                if let e = error {
                    let alert = UIAlertController(title: "Error!", message: e.localizedDescription, preferredStyle: .actionSheet)
                    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                } else {
                    self.messages = []
                    if let snapshotDocuments = snapshot?.documents {
                        for documents in snapshotDocuments {
                            let message = documents.data()
                            if let messageSender = message[K.FStore.senderField] as? String,
                                let messageBody = message[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)

                                DispatchQueue.main.async {
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.reloadData()
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                            }
                        }
                    }
                }
        }
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

//MARK: - UITableViewDataSource - responsible for populating the TableView (how many cells....etc)
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
            cell.label.textColor = UIColor(named: K.BrandColors.blue)
        } else {
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }
        return cell
    }
}

//MARK: - UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName)
                .addDocument(data: [
                    K.FStore.senderField :messageSender,
                    K.FStore.bodyField: messageBody,
                    K.FStore.dateField: Date().timeIntervalSince1970
                ]) { error in
                    if let e = error {
                        let alert = UIAlertController(title: "Error while saving your message!", message: e.localizedDescription, preferredStyle: .actionSheet)
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

                        alert.addAction(alertAction)
                        self.present(alert, animated: true)
                    } else {
                        print("Message was saved successfully")
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                        }
                    }
            }
        }
    }
}
