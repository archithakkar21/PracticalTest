//
//  ViewController.swift
//  PracticalTest
//
//  Created by Archi Thakkar on 29/09/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables -
    var currentMonth    : Int = 9
    var selecredDate    : Int = 29
    var totalDays       : Int = 0
    
    //MARK: - IBOutlets -
    @IBOutlet weak private var dateCollectionView       : UICollectionView!
    @IBOutlet weak private var jobDataCollectionView    : UICollectionView!
    @IBOutlet weak private var dateLabel                : UILabel!
    @IBOutlet weak private var monthLabel               : UILabel!
    
    //MARK: - Lifecycle method -
    override func viewDidLoad() {
        super.viewDidLoad()
        totalDays = currentMonth == 4 || currentMonth == 6 || currentMonth == 9 || currentMonth == 11 ? 30 : currentMonth == 2  ? 28: 31
        monthLabel.text = getMonthString(month: currentMonth)
        dateLabel.text = "\(selecredDate)"
    }

    //MARK: - IBActions -
    @IBAction func didTapOnPrevMonth(_ sender: Any) {
        if currentMonth > 1 {
            currentMonth -= 1
            monthLabel.text = getMonthString(month: currentMonth)
            jobDataCollectionView.reloadData()
            dateCollectionView.reloadData()
        }
        
    }
    @IBAction func didTapOnNextMonth(_ sender: Any) {
        if currentMonth < 12 {
            currentMonth += 1
            monthLabel.text = getMonthString(month: currentMonth)
            dateCollectionView.reloadData()
            jobDataCollectionView.reloadData()
        }
    }
    
    //MARK: - Helper Function -
    func getTodayWeekDay(date: String)-> String{
        let dateFormatterString = DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        dateFormatterString.dateFormat = "dd/MM/yy"
        let weekDay = dateFormatter.string(from: dateFormatterString.date(from: date) ?? Date())
        return weekDay
    }
    @objc private func didChangeDate(sender: UIButton) {
        selecredDate = sender.tag+1
        if sender.tag == selecredDate {
            sender.backgroundColor = .white
        }
        dateLabel.text = "\(selecredDate)"
    }
}

//MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dateCollectionView {
            return totalDays
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dateCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
            cell.btnDate.setTitle("\(indexPath.item+1)", for: .normal)
            let date = "\(indexPath.item+1)"
            let month = "\(currentMonth)".count == 1 ? "0" + "\(currentMonth)" : "\(currentMonth)"
            cell.btnDate.configuration?.subtitle = getTodayWeekDay(date: date.count == 1 ? "0\(indexPath.item+1)/\(month)/2021" : "\(indexPath.item+1)/\(month)/2021")
            cell.btnDate.tag = indexPath.item
            cell.btnDate.addTarget(self, action: #selector(didChangeDate), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobDataCollectionViewCell", for: indexPath) as! JobDataCollectionViewCell
            return cell
        }
    }
}

