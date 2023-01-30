//
//  ViewController.swift
//  PhotoPicker
//
//  Created by Adel Al-Aali on 1/23/23.
//

import UIKit
import Photos
import PhotosUI

class ViewController: UIViewController, PHPickerViewControllerDelegate  {
    
    var model = [InstagramPost]()
    @IBOutlet var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title  =   "New Photo Picker"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    // PHPicker config
    @objc func didTapAdd() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 3
        
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true) // init animation
        
    }
    
    // itereates model [results]
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil) // de-init animation
        
        results.forEach { result in
            results.itemProvider.loadObject(ofClass: UIImage)
            else { return }
        }
    }
}
                                            
                                    
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
