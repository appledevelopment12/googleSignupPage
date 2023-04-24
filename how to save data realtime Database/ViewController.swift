//
//  ViewController.swift
//  how to save data realtime Database
//
//  Created by Rajeev on 23/04/23.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet var txt: UITextField!
    var ref = DatabaseReference.init()
    
    
    @IBOutlet var myImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ref = Database.database().reference()
       // self.saveFIRData()
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(ViewController.openGallery(tapGesture:)))
        myImageView.isUserInteractionEnabled = true
        myImageView.addGestureRecognizer(tapGesture)
        
        
    }
    @objc func openGallery(tapGesture: UITapGestureRecognizer)
    {
        self.setymImagePicker()
    }
   func saveFIRData()
    {
        let dict = ["name": "Rohit","text":txt.text!]
        self.ref.child("cell").childByAutoId().setValue(dict)
    }

    @IBAction func btn(_ sender: Any)
    {
        self.saveFIRData()
    }
}
extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    
    func setymImagePicker()
    {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum)
        {
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.delegate = self
            imagePicker.isEditing = true
            self.present(imagePicker,animated: true,completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        myImageView.image = image
        self.dismiss(animated: true,completion: nil)
    }
}

extension ViewController
{
    func uploadImage(_ image:UIImage,completion: @escaping(_ url: URL?) -> ())
    {
       // let storageRef = Storage.storage().reference().child("myimage.png")
    }
}
