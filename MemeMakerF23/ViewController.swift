//
//  ViewController.swift
//  MemeMakerF23
//
//  Created by Nidhin Nishanth on 11/21/23.
//

import UIKit

class ViewController: UIViewController {

    // these are the two segmented controls at the top and bottom of our app - these allow you to switch between different "modes"
    @IBOutlet var topSegmentedControl: UISegmentedControl!
    @IBOutlet var bottomSegmentedControl: UISegmentedControl!
    
    // these are the labels we're using for our meme captions
    @IBOutlet var topCaptionLabel: UILabel!
    @IBOutlet var bottomCaptionLabel: UILabel!
    
    // we created two arrays to store all the captions for our app - one array for the top label and one array for the bottom label
    // we created the "CaptionOption" type in the CaptionOption.swift file, so refer to that if you need a refresher
    let topChoices = [
        CaptionOption(caption: "Luke, join the dark side", emoji: "😈"),
        CaptionOption(caption: "Luke, come to my book club", emoji: "📚"),
        CaptionOption(caption: "Luke, I found my oven mitts", emoji: "🧤")
    ]
    
    let bottomChoices = [
        CaptionOption(caption: "We have cookies!", emoji: "🍪"),
        CaptionOption(caption: "We'll be unstoppable!", emoji: "🦾"),
        CaptionOption(caption: "The whole family will be there", emoji: "👨‍👩‍👧‍👦")
    ]
    
    // in our viewDidLoad() function, we'll start by cleaning up our segmented controls (replacing all of the existing choices with the memes we made)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // first, we'll remove everything that's currently in our segmented controls
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        // next, we'll take each choice from our arrays and insert a new segment for each choice
        // we'll use the emojis of each caption to represent the different choices in the segmented control
        // we will also place each caption in the same order as they appear in our array
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        
        // finally, we will have our app start with the first options of each segmented control, by manually setting the index to 0
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        // we'll update our captions using this function
        updateCaptions()
    }

    // this function will grab the choice we made from our segmented control, and match that choice with the appropriate caption
    func updateCaptions() {
        // our segmented controls have indexes! we'll pull out the index of the choice we've tapped on ...
        let topIndex = topSegmentedControl.selectedSegmentIndex
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        
        // ... and then we'll use that index to grab the same CaptionOption from our array. We need to grab the caption itself and set that to the appropriate label.
        topCaptionLabel.text = topChoices[topIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
    
    // this action is called when we change the segmented control, and will be used to update our captions.
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        updateCaptions()
    }
}

