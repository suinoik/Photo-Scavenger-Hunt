//
//  Task.swift
//  PhotoScavengerHunt
//
//

import Foundation
import UIKit
import CoreLocation

class Task {
    let title: String
    let description: String
    var image: UIImage?
    var imageLocation: CLLocation?
    var isComplete: Bool {
        image != nil
    }
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func set(_ image: UIImage, with location: CLLocation) {
        self.image = image
        self.imageLocation = location
    }
}

extension Task {
    static var mockTasks: [Task] {
        return [
            Task(title: "Your fav picture spot", description: "Where do you go to get fly?"),
            Task(title: "Best eats spot", description: "Where do you go to f some food up?"),
            Task(title: "Where'd you have your first kiss", description: "Where did the memorable event go down? I know you remember."),
            Task(title: "Your addy", description: "Where you live g?"),
            Task(title: "Where's your high school?", description: "Where did you spend the worst 4 years of your life")
        ]
    }
}
