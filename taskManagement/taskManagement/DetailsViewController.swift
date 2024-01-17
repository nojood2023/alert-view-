//
//  DetailsViewController.swift
//  taskManagement
//
//  Created by Nojood Aljuaid  on 02/07/1445 AH.
//

import UIKit

class DetailsViewController: UIViewController {
    var todo : Todo!
    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var todoNameLable: UILabel!
    @IBOutlet weak var todoDesc: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if todo.image != nil {
            todoImageView.image = todo.image
        } else {
            todoImageView.image = UIImage(named: "task")
        }
        todoNameLable.text = todo.name
        todoDesc.text = todo.desc
    }
    

    @IBAction func editTodoButtonClicked(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "NewTodo") as? NewTodoViewController
        
        if let viewCont = vc {
            viewCont.isCreation = false
            viewCont.editTodo = todo
            
            navigationController?.pushViewController(viewCont, animated: true)
           
        }
       
    }
    

}
