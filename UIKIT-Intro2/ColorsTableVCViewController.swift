//
//  ColorsTableVCViewController.swift
//  UIKIT-Intro2
//
//  Created by Mohammed Rashid on 02/02/23.
//

import UIKit

class ColorsTableVCViewController: UIViewController {
    var colors: [UIColor] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createColorsArray()
    }
    

    func createColorsArray(){
        for _ in 0..<50{
            colors.append(createRandomColor())
        }
    }
    
    func createRandomColor() ->UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }

}

extension ColorsTableVCViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        let color = colors[indexPath.row]
        cell.backgroundColor=color
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ColorsDetailsVC", sender: nil)
    }
}
