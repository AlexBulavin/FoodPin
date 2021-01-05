//
//  RecipeConstructorTableViewController.swift
//  FoodPin
//
//  Created by Alex on 04.11.2020.
//  Copyright © 2020 Alex. All rights reserved.
//

import UIKit

class RecipeConstructorTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var recipeNameConstructorTextField: RoundedTextField! {
        didSet {
            recipeNameConstructorTextField.tag = 1
            recipeNameConstructorTextField.becomeFirstResponder()
            recipeNameConstructorTextField.delegate = self
        }
    }
    
    @IBOutlet var recipeCategoryConstructorTextField: RoundedTextField! {
        didSet {
            recipeCategoryConstructorTextField.tag = 2
            recipeCategoryConstructorTextField.delegate = self
        }
    }
    
    @IBOutlet var recipeKitchenTypeConstructorTextField: RoundedTextField! {
        didSet {
            recipeKitchenTypeConstructorTextField.tag = 3
            recipeKitchenTypeConstructorTextField.delegate = self
        }
    }
    
    @IBOutlet var cookingDeviceTypeConstructorLabel: RoundedTextField! {
        didSet {
            cookingDeviceTypeConstructorLabel.tag = 4
            cookingDeviceTypeConstructorLabel.delegate = self
        }
    }
    
    @IBOutlet var cookingDeviceBrandConstructorTextField: RoundedTextField! {
        didSet {
            cookingDeviceBrandConstructorTextField.tag = 5
            cookingDeviceBrandConstructorTextField.delegate = self
        }
    }
    
    
    @IBOutlet var cookingDeviceModelConstructorTextField: RoundedTextField! {
        didSet {
            cookingDeviceModelConstructorTextField.tag = 6
            cookingDeviceModelConstructorTextField.delegate = self
        }
    }
    
    
    @IBOutlet var recipeBriefConstructorLabelTextView: UITextView! {
        didSet {
            recipeBriefConstructorLabelTextView.tag = 6
            recipeBriefConstructorLabelTextView.delegate = self
        }
    }
   
    @IBOutlet var photoImageView: UIImageView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }

        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure navigation bar appearance
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 35.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor(red: 90, green: 45, blue: 128), NSAttributedString.Key.font: customFont ]
        }
    }

    // MARK: - Camera UIAlertController pickUp
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { //indexPath.row == 0 - Только если нажата первая ячейка в списке (верхняя), будет срабатывать алерт контроллер и предлагаться выбрать фотку из галеоеи или сделать е> с камеры.

            let photoSourceRequestController = UIAlertController(title: "", message: "Выберите источник для иллюстрации рецепта", preferredStyle: .actionSheet)

            let cameraAction = UIAlertAction(title: "Камера", style: .default, handler: { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                let imagePicker = UIImagePickerController()
                                imagePicker.allowsEditing = false
                                imagePicker.sourceType = .camera
                                imagePicker.delegate = self

                                self.present(imagePicker, animated: true, completion: nil)
                            }
                        })

                        let photoLibraryAction = UIAlertAction(title: "Фотографии на телефоне", style: .default, handler: { (action) in
                            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                                let imagePicker = UIImagePickerController()
                                imagePicker.allowsEditing = false
                                imagePicker.sourceType = .photoLibrary
                                imagePicker.delegate = self

                                self.present(imagePicker, animated: true, completion: nil)
                            }
                        })
            
                        photoSourceRequestController.addAction(cameraAction)
                        photoSourceRequestController.addAction(photoLibraryAction)
            
            // For iPad
            if let popoverController = photoSourceRequestController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            present(photoSourceRequestController, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView!, attribute: .leading, relatedBy: .equal, toItem: photoImageView.superview, attribute: .leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true

        let trailingConstraint = NSLayoutConstraint(item: photoImageView!, attribute: .trailing, relatedBy: .equal, toItem: photoImageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true

        let topConstraint = NSLayoutConstraint(item: photoImageView!, attribute: .top, relatedBy: .equal, toItem: photoImageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true

        let bottomConstraint = NSLayoutConstraint(item: photoImageView!, attribute: .bottom, relatedBy: .equal, toItem: photoImageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
    var recipeCategory: [RecipeCategories] = []
    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
