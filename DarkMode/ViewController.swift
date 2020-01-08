//
//  ViewController.swift
//  DarkMode
//
//  Created by Omar Awad on 1/6/20.
//  Copyright © 2020 Omar Awad. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var `switch`: UIBarButtonItem!
    let defaults = UserDefaults.standard
     
    @IBOutlet weak var myswitch: UISwitch!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var dark = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        transperantNavigation()
        
        let darkModeEnabled = defaults.bool(forKey: "darkModeEnabled")
        if darkModeEnabled {
            overrideUserInterfaceStyle = .dark
        }else {
            overrideUserInterfaceStyle = .light
        }
        
        //Checking for support
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available
        {
            registerForPreviewing(with: self, sourceView: view)
        }
        else
        {
            print ("ISN'T COMPATIBLE")
        }
    }

    func transperantNavigation() {
        myswitch.addTarget(self, action: #selector(changemode(_:)), for: .valueChanged)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    @objc func changemode(_ sender : UISwitch){
        let window = UIApplication.shared.windows.first
        if sender.isOn {
            window?.overrideUserInterfaceStyle = .light
            overrideUserInterfaceStyle = .light
            defaults.set(false, forKey: "darkModeEnabled")
        }else {
            defaults.set(true, forKey: "darkModeEnabled")
            window?.overrideUserInterfaceStyle = .dark
            overrideUserInterfaceStyle = .dark

        }
    }
    
    @IBAction func changeMode(_ sender: UIBarButtonItem) {
    }
    
    
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout , UIViewControllerPreviewingDelegate {

    //Shows preview
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        guard let indexPath =  homeCollectionView.indexPathForItem(at: location), let cell = homeCollectionView.cellForItem(at: indexPath) else {
                return nil
        }
        let ideintifier = "detailViewController"
        guard let detailVC = storyboard?.instantiateViewController(identifier: ideintifier) as? DetailViewController else {
            return nil
        }
      
        previewingContext.sourceRect = cell.frame
        return detailVC
    }

    //Shows final VC
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
//        let VC = storyboard?.instantiateViewController(withIdentifier: "detailViewController")as! DetailViewController
//        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width / 2 - 8 , height: 250)
    }
}

