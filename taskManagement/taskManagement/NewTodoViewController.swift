//
//  NewTodoViewController.swift
//  taskManagement
//
//  Created by Nojood Aljuaid  on 04/07/1445 AH.
//

import UIKit

class NewTodoViewController: UIViewController {
    var isCreation = true 
    var editTodo : Todo?
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var detailsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if isCreation == false {
            mainButton.setTitle("Edit", for: .normal)
            navigationItem.title = "Edit Task"
        }
        if let todo = editTodo {
            titleTextField.text = todo.name
            detailsTextView.text = todo.desc
        }
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        if isCreation {
            var todo = Todo(name: titleTextField.text! , image: nil, desc: detailsTextView.text)
            NotificationCenter.default.post(name: NSNotification.Name("newTodoAdded"), object: nil , userInfo: ["newAdded" : todo])
            var alert = UIAlertController(title: "Added", message: "the task was added successfully", preferredStyle: .alert)
            var closeAction = UIAlertAction(title: "done", style: .default) { _ in
                 self.tabBarController?.selectedIndex = 0
                self.titleTextField.text = ""
                self.detailsTextView.text = ""
            }
            present(alert , animated: true, completion: nil)
            alert.addAction(closeAction)
        }
        else {
            
        }
    }
    

}
