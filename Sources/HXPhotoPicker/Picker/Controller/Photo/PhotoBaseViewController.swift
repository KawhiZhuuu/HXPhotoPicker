//
//  PhotoBaseViewController.swift
//  HXPhotoPicker
//
//  Created by Silence on 2023/10/15.
//  Copyright © 2023 Silence. All rights reserved.
//

import UIKit

open class PhotoBaseViewController: BaseViewController, PhotoPickerControllerFectch {
    
    let pickerConfig: PickerConfiguration
    init(config: PickerConfiguration) {
        self.pickerConfig = config
        super.init(nibName: nil, bundle: nil)
    }
    
    weak var weakController: PhotoPickerController?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        weakController = pickerController
    }
    
    open func updateColors() {
        
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        weakController?.viewControllersWillAppear(self)
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weakController?.viewControllersDidAppear(self)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        weakController?.viewControllersWillDisappear(self)
    }
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        weakController?.viewControllersDidDisappear(self)
    }
    
    open override var prefersStatusBarHidden: Bool {
        false
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                updateColors()
            }
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
