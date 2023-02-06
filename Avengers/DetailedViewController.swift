//
//  DetailedViewController.swift
//  Avengers
//
//  Created by sixpep on 05/02/23.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var detailedImage: UIImageView!
    
    @IBOutlet weak var detailedName: UILabel!
    @IBOutlet weak var detailedRealName: UILabel!
    @IBOutlet weak var detailedTeam: UILabel!
    @IBOutlet weak var detailedFirstAppear: UILabel!
    @IBOutlet weak var detailedCreated: UILabel!
    @IBOutlet weak var detailedPublisher: UILabel!
    @IBOutlet weak var detailedBio: UITextView!
    
    var detailedNameStr = ""
    var detailedRealNameStr = ""
    var detailedTeamStr = ""
    var detailedFirstAppearStr = ""
    var detailedCreatedStr = ""
    var detailedPublisherStr = ""
    var detailedBioStr = ""
    var detailedImageImg = ""
    
    override func viewWillAppear(_ animated: Bool) {
        displayImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI(){
        
        //detailedImage.image = detailedImageImg
        
        detailedName.text = detailedNameStr
        detailedRealName.text = detailedRealNameStr
        detailedTeam.text = detailedTeamStr
        detailedFirstAppear.text = detailedFirstAppearStr
        detailedCreated.text = detailedCreatedStr
        detailedPublisher.text = detailedPublisherStr
        detailedBio.text = detailedBioStr
    }
    
    func displayImage(){
        if detailedImageImg != "na"{
            if let url = URL(string: detailedImageImg) {
                DispatchQueue.global(qos: .utility).async {
                    let image = (try? Data(contentsOf: url))
                    DispatchQueue.main.async {
                        self.detailedImage.image = UIImage(data: image!)
                    }
                }
            }
        }
    }
    
}
