//
//  ViewController.swift
//  iOSAssignment
//
//  Created by Asim Parvez on 10/28/18.
//  Copyright © 2018 Asim Parvez. All rights reserved.
//

import UIKit
import SlackTextViewController

class ViewController:  SLKTextViewController{

    var messages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Configure the chat view
        self.configureSLKTV()
        //Register Chat cell nib
        self.tableView?.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
    }
    
    
    //MARK: - SLKTextViewController TableViewStyle
    override class func tableViewStyle(for decoder: NSCoder) -> UITableView.Style {
        //Set table view style as plain
        return .plain
    }

    //MARK: - SLKTVC's configuration
    func configureSLKTV() {
        // SLKTVC's configuration
        
        //Enable Shake Gesture to undo/clear
        self.shakeToClearEnabled = true
        //Enable table view to scroll to bottom
        self.shouldScrollToBottomAfterKeyboardShows = true
        //Enter new messages at the bottom of view
        self.isInverted = true
        //Allow bounce
        self.bounces = true
        //Auto hide send button if no text
        self.textInputbar.autoHideRightButton = true
        //Remove separators from table view
        self.tableView?.separatorStyle = .none
        //Set Font and Placeholder for input text view
        self.textView.font = UIFont(name: "Arial", size: 16)
        self.textView.placeholder = "Type your message..."
    }
    
    //MARK: - Send Button Tapped
    override func didPressRightButton(_ sender: Any!) {
        
        // This validates any pending auto-correction or auto-spelling just after hitting the 'Send' button
        self.textView.refreshFirstResponder()
        
        //split the text message
        if let messages = StringUtility.splitMessage(message: self.textView.text) {
            //If succuessful setup indexpaths for multiple messages
            var indexPaths = [IndexPath]()
            for i in 0..<messages.count {
                
                let indexPath = IndexPath(row: i, section: 0)
                indexPaths.append(indexPath)
                
            }
            
            //Set up row animation
            let rowAnimation: UITableView.RowAnimation = self.isInverted ? .bottom : .top
            let scrollPosition: UITableView.ScrollPosition = self.isInverted ? .bottom : .top
            

            //Update table view with new messages with animation
            self.tableView?.beginUpdates()
            self.messages.insert(contentsOf: messages, at: 0)
            self.tableView?.insertRows(at: indexPaths, with: rowAnimation)
            self.tableView?.endUpdates()
            
            //Scroll to the latest message
            self.tableView?.scrollToRow(at: indexPaths[0], at: scrollPosition, animated: true)
            
            // Fixes the cell from blinking (because of the transform, when using translucent cells)
            self.tableView?.reloadRows(at: indexPaths, with: .automatic)
        }else {
            //Show Error For word length exceeded
            let alert = UIAlertController(title: "Error!", message: "We have detected atleast 1 extremely long word.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
        super.didPressRightButton(sender)
    }
    
    
    //MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Get cell through reusing identifier
        let cell = self.tableView?.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        //Set message and selection style
        cell.lblText.text = messages[indexPath.row]
        cell.selectionStyle = .none
        //If table view is inverted cell adjusts accordingly
        cell.transform = (self.tableView?.transform)!;

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}




