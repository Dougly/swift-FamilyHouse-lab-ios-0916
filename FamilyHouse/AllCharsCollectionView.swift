//
//  AllCharsCollectionView.swift
//  FamilyHouse
//
//  Created by Douglas Galante on 10/13/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AllCharsCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var locationSelectedOnPreviousScreen: Location!
    var characters: [Character] = []
    var selectedCharacters: [Character] = []
    var message: String = ""
    var numberOfCellsPerRow: CGFloat = 3

    
    //Collection View Cell Size and Spacing
    var spacing: CGFloat!
    var sectionInsets: UIEdgeInsets!
    var itemSize: CGSize!
    
    @IBOutlet weak var numCharsPerRowSlider: UISlider!
    @IBOutlet weak var doneButtonOutlet: UIBarButtonItem!
    
    @IBAction func doneButton(_ sender: AnyObject) {
        var message = "All cast members please report to location: \(locationSelectedOnPreviousScreen.name)!"
        
        for char in selectedCharacters {
            if char.castMemberOf != locationSelectedOnPreviousScreen.show {
                message = "Hey! some of you are not cast members of \(locationSelectedOnPreviousScreen.show.showAsString)!"
            }
        }
        self.message = message
    }
    
    @IBAction func sliderAdjusted(_ sender: AnyObject) {
        numberOfCellsPerRow = CGFloat(numCharsPerRowSlider.value)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        populateCharactersArray()
        numCharsPerRowSlider.maximumValue = Float(characters.count)
        numCharsPerRowSlider.minimumValue = 1.0
    }
    
    func populateCharactersArray () {
        let michelle = Character(name: "Michelle", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "michelle"))
        let carl = Character(name: "Carl", castMemberOf: .familyMatters, headShot: #imageLiteral(resourceName: "carl"))
        let danny = Character(name: "Danny", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "danny"))
        let dj = Character(name: "DJ", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "dj"))
        let eddie = Character(name: "Eddie", castMemberOf: .familyMatters, headShot: #imageLiteral(resourceName: "eddie"))
        let jesse = Character(name: "Jesse", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "jesse"))
        let joey = Character(name: "Joey", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "joey"))
        let Kimmy = Character(name: "Gibbler", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "kimmy"))
        let laura = Character(name: "Laura", castMemberOf: .familyMatters, headShot: #imageLiteral(resourceName: "laura"))
        let rebecca = Character(name: "Rebecca", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "rebecca"))
        let stephanie = Character(name: "Stephanie", castMemberOf: .fullHouse, headShot: #imageLiteral(resourceName: "stephanie"))
        let steve = Character(name: "Steve", castMemberOf: .familyMatters, headShot: #imageLiteral(resourceName: "steve"))
        let waldo = Character(name: "Waldo", castMemberOf: .familyMatters, headShot: #imageLiteral(resourceName: "Waldo"))
        characters.append(michelle)
        characters.append(carl)
        characters.append(danny)
        characters.append(dj)
        characters.append(eddie)
        characters.append(jesse)
        characters.append(joey)
        characters.append(Kimmy)
        characters.append(laura)
        characters.append(rebecca)
        characters.append(stephanie)
        characters.append(steve)
        characters.append(waldo)
    }
    
    //Required Methods for collection view delegate and datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customItem", for: indexPath) as! CustomItem
        
        cell.charNameLabel.text = characters[indexPath.item].name
        cell.headShotImageView.image = characters[indexPath.item].headShot
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CustomItem

        switch cell.charNameLabel.textColor {
        case UIColor.white:
            cell.charNameLabel.textColor = .blue
            selectedCharacters.append(characters[indexPath.item])
            break
        case UIColor.blue:
            cell.charNameLabel.textColor = .white
            removeCharFromSelectedCharsArray(name: characters[indexPath.item].name)
            break
        default:
            break
            
        }
    }
    
    func removeCharFromSelectedCharsArray (name: String) {
        for (index, char) in selectedCharacters.enumerated() {
            if char.name == name {
                selectedCharacters.remove(at: index)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        doneButton(doneButtonOutlet)
        
        if segue.identifier == "messageSegue" {
            let dest = segue.destination as! MessageViewController
            dest.message = self.message
        }
    }
    
    
    //Methods for Collection View flow layout
    
    func configureLayout () {
        
        let screenWidth = UIScreen.main.bounds.width
        let desiredSpacing: CGFloat = 2
        let whiteSpace: CGFloat = numberOfCellsPerRow + 1.0
        let itemWidth = (screenWidth - (whiteSpace * desiredSpacing)) / numberOfCellsPerRow
        let itemHeight = itemWidth
        
        spacing = desiredSpacing
        sectionInsets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}

class CustomItem: UICollectionViewCell {
    
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var headShotImageView: UIImageView!
    
}


