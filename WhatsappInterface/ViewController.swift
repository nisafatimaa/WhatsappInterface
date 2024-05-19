//
//  ViewController.swift
//  WhatsappInterface
//
//  Created by Macbook Pro on 13/01/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var headerView : UIView!
    @IBOutlet var whatsapp : UILabel!
    @IBOutlet var table : UITableView!
    @IBOutlet var chatsButton : UIButton!
    @IBOutlet var callsButton : UIButton!
    @IBOutlet var updatesButton : UIButton!
    @IBOutlet var communityButton : UIButton!
    @IBOutlet var stackView : UIStackView!
    
    var chats : [Contact] = []
    
    // the line under chats,updates,calls option
    let selectionLine : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.addSubview(selectionLine)
        
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "ChatCell", bundle: nil),forCellReuseIdentifier: "ChatCell" )
        
        chatsButton.addTarget(self, action: #selector(didTapChats), for: .touchUpInside)
        callsButton.addTarget(self, action: #selector(didTapCalls), for: .touchUpInside)
        updatesButton.addTarget(self, action: #selector(didTapUpdates), for: .touchUpInside)
        communityButton.addTarget(self, action: #selector(didTapCommunity), for: .touchUpInside)
        
        configureChats()
        addViewConstraints()
    }
    
    func configureChats(){
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:00 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:30 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:20 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:00 pm",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:00 pm",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:20 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:00 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:30 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "10:20 am",
                             profileImage: UIImage(named: "cute")))
        chats.append(Contact(name: "Selena",
                             message: "hey! I am good. How are you?",
                             time: "yesterday",
                             profileImage: UIImage(named: "cute")))
    }
    
    @objc func didTapChats(){
        showSelectionLine(toButton: chatsButton)
        chatsButton.tintColor = .white
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "chats") as? ViewController else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @objc func didTapUpdates(){
        showSelectionLine(toButton: updatesButton)
        updatesButton.tintColor = .white
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "updates") as? UpdatesViewController else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @objc func didTapCalls(){
        showSelectionLine(toButton: callsButton)
        callsButton.tintColor = .white
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "calls") as? CallsViewController else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    @objc func didTapCommunity(){
        showSelectionLine(toButton: communityButton)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "calls") as? CallsViewController else { return }
        navigationController?.popToViewController(vc, animated: true)
    }
    
    func addViewConstraints(){
        NSLayoutConstraint.activate([
            selectionLine.leadingAnchor.constraint(equalTo: chatsButton.leadingAnchor),
            selectionLine.trailingAnchor.constraint(equalTo: chatsButton.trailingAnchor),
            selectionLine.topAnchor.constraint(equalTo: chatsButton.bottomAnchor),
            selectionLine.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    //for appearing of line animation
    func showSelectionLine(toButton button : UIButton ){
        UIView.animate(withDuration: 0.3){
            self.selectionLine.frame.origin.x = button.frame.origin.x
        }
    }
    
    @IBAction func messageButton(){
        
    }
    
    @IBAction func cameraButton(){
        
    }
    
    @IBAction func searchButton(){
        
    }
    
    @IBAction func moreButton(){
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //for custom cells we give as! CustomCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let chat = chats[indexPath.row]
        cell.profileImage.image = chat.profileImage
        cell.name.text = chat.name
        cell.message.text = chat.message
        cell.time.text = chat.time
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Contact {
    var name : String
    var message : String
    var time : String
    var profileImage : UIImage!     //optional
}
