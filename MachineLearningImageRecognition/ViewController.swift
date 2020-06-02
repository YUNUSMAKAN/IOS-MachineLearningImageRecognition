//
//  ViewController.swift
//  MachineLearningImageRecognition
//
//  Created by MAKAN on 2.06.2020.
//  Copyright © 2020 YUNUS MAKAN. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButton(_ sender: Any) {
    
    //RESIM SECME ISLEMI
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    //Kullanici resmi bir kere sectikten sonra ne yapacagi yazilir bu fonksiyon altinda.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!) {
            chosenImage = ciImage
        }
        
        
    //Bu recog.. fonksiyonun avantaji ve dezavantaji var.Avantaji kullanici resmi sectiktek sonra hemen islemi yapicak ve biriki saniye sonra sonucu gorucek.Dezavantaji bizde CI image yapisi beklicek.
    //CIImage: Core image tarafindan kullanilabilecek bir gorseldir.
        recognizeImage(image: chosenImage)
        
        
        
    }
    //Kullanici resmi sectikten hemen sonra cagiricaz.
    func recognizeImage(image : CIImage ){
        
    }
    
}

