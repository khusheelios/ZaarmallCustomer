//
//  BarChartViewController.swift
//  ChartsTutorial
//
//  Created by Duy Bui on 4/20/19.
//  Copyright © 2019 iOSTemplates. All rights reserved.
//

import UIKit
import Charts

enum WeekDayName1: String {
    case Sunday = "Sun"
    case Monday = "Mon"
    case Tuesday = "Tue"
    case Wednesday = "Wed"
    case Thursday = "Thu"
    case Friday = "Fri"
    case Saturday = "Sat"

}
enum WeekDayName2: String {
    case Sunday = "Sun"
    case Monday = "Mon"
    case Tuesday = "Tue"
    case Wednesday = "Wed"
    case Thursday = "Thu"
    case Friday = "Fri"
    case Saturday = "Sat"

}



class BarChartViewController: UIViewController,ChartViewDelegate {

  @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var barChartView1: BarChartView!
    var todayName:String!
    var todayName1:String!

        let week = ["Sun", "Mon", "Tue", "Wed","Thu", "Fri", "Sat"]
    //    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        let staticSteps = [200, 400, 600, 300, 1200, 1600, 400]

        let week1 = ["Sun", "Mon", "Tue", "Wed","Thu", "Fri", "Sat"]
    //    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        let staticSteps1 = [200, 400, 600, 300, 1200, 1600, 400]

    @IBOutlet weak var btnYearly1: CustomizableButton!
    @IBOutlet weak var btnYearly: CustomizableButton!
    @IBOutlet weak var btnMonthly1: CustomizableButton!
    @IBOutlet weak var btnMonthly: CustomizableButton!
    @IBOutlet weak var btnWeekly: CustomizableButton!
    @IBOutlet weak var btnWeekly1: CustomizableButton!
    @IBOutlet weak var btnDaily1: CustomizableButton!
    
    @IBOutlet weak var btnDaily: CustomizableButton!
    
        override func viewDidLoad() {
            super.viewDidLoad()

            getCurrentDayName()
            getCurrentDayName1()


            setup(barLineChartView: barChartView)
            setup1(barLineChartView: barChartView1)
        }

    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func btnYearly1(_ sender: Any) {
        btnYearly1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily1.backgroundColor = UIColor.clear
        btnMonthly1.backgroundColor = UIColor.clear

        btnWeekly1.backgroundColor = UIColor.clear
        
        btnYearly1.setTitleColor(UIColor.white, for: .normal)
        btnDaily1.setTitleColor(UIColor.black, for: .normal)
        btnMonthly1.setTitleColor(UIColor.black, for: .normal)

        btnWeekly1.setTitleColor(UIColor.black, for: .normal)
        
        
        btnYearly1.layer.cornerRadius = 15
        btnYearly1.clipsToBounds = true
        btnYearly1.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnYearly1.layer.borderColor = red.cgColor
        
        
        btnDaily1.layer.cornerRadius = 15
        btnDaily1.clipsToBounds = true
        btnDaily1.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily1.layer.borderColor = red1.cgColor


        btnWeekly1.layer.cornerRadius = 15
        btnWeekly1.clipsToBounds = true
        btnWeekly1.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly1.layer.borderColor = red2.cgColor

        btnMonthly1.layer.cornerRadius = 15
        btnMonthly1.clipsToBounds = true
        btnMonthly1.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly1.layer.borderColor = red3.cgColor




    }
    @IBAction func btnYearly(_ sender: Any) {
        btnYearly.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily.backgroundColor = UIColor.clear
        btnMonthly.backgroundColor = UIColor.clear

        btnWeekly.backgroundColor = UIColor.clear
        
        btnYearly.setTitleColor(UIColor.white, for: .normal)
        btnDaily.setTitleColor(UIColor.black, for: .normal)
        btnMonthly.setTitleColor(UIColor.black, for: .normal)

        btnWeekly.setTitleColor(UIColor.black, for: .normal)
        
        
        btnYearly.layer.cornerRadius = 15
        btnYearly.clipsToBounds = true
        btnYearly.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnYearly.layer.borderColor = red.cgColor
        
        
        btnDaily.layer.cornerRadius = 15
        btnDaily.clipsToBounds = true
        btnDaily.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily.layer.borderColor = red1.cgColor


        btnWeekly.layer.cornerRadius = 15
        btnWeekly.clipsToBounds = true
        btnWeekly.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly.layer.borderColor = red2.cgColor

        btnMonthly.layer.cornerRadius = 15
        btnMonthly.clipsToBounds = true
        btnMonthly.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly.layer.borderColor = red3.cgColor






    }
    @IBAction func btnMonthly1(_ sender: Any) {
        btnMonthly1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily1.backgroundColor = UIColor.clear
        btnWeekly1.backgroundColor = UIColor.clear

        btnYearly1.backgroundColor = UIColor.clear
        
        btnMonthly1.setTitleColor(UIColor.white, for: .normal)
        btnDaily1.setTitleColor(UIColor.black, for: .normal)
        btnWeekly1.setTitleColor(UIColor.black, for: .normal)

        btnYearly1.setTitleColor(UIColor.black, for: .normal)
        
        
        btnMonthly1.layer.cornerRadius = 15
        btnMonthly1.clipsToBounds = true
        btnMonthly1.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnMonthly1.layer.borderColor = red.cgColor
        
        
        btnDaily1.layer.cornerRadius = 15
        btnDaily1.clipsToBounds = true
        btnDaily1.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily1.layer.borderColor = red1.cgColor


        btnWeekly1.layer.cornerRadius = 15
        btnWeekly1.clipsToBounds = true
        btnWeekly1.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly1.layer.borderColor = red2.cgColor

        btnYearly1.layer.cornerRadius = 15
        btnYearly1.clipsToBounds = true
        btnYearly1.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly1.layer.borderColor = red3.cgColor




    }
    @IBAction func btnMonthly(_ sender: Any) {
        btnMonthly.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily.backgroundColor = UIColor.clear
        btnWeekly.backgroundColor = UIColor.clear

        btnYearly.backgroundColor = UIColor.clear
        
        btnMonthly.setTitleColor(UIColor.white, for: .normal)
        btnDaily.setTitleColor(UIColor.black, for: .normal)
        btnWeekly.setTitleColor(UIColor.black, for: .normal)

        btnYearly.setTitleColor(UIColor.black, for: .normal)


        
        btnMonthly.layer.cornerRadius = 15
        btnMonthly.clipsToBounds = true
        btnMonthly.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnMonthly.layer.borderColor = red.cgColor
        
        
        btnDaily.layer.cornerRadius = 15
        btnDaily.clipsToBounds = true
        btnDaily.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily.layer.borderColor = red1.cgColor


        btnWeekly.layer.cornerRadius = 15
        btnWeekly.clipsToBounds = true
        btnWeekly.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly.layer.borderColor = red2.cgColor

        btnYearly.layer.cornerRadius = 15
        btnYearly.clipsToBounds = true
        btnYearly.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly.layer.borderColor = red3.cgColor




        
    }
    @IBAction func btnWeekly1(_ sender: Any) {
        btnWeekly1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily1.backgroundColor = UIColor.clear
        btnMonthly1.backgroundColor = UIColor.clear

        btnYearly1.backgroundColor = UIColor.clear
        
        btnWeekly1.setTitleColor(UIColor.white, for: .normal)
        btnDaily1.setTitleColor(UIColor.black, for: .normal)
        btnMonthly1.setTitleColor(UIColor.black, for: .normal)

        btnYearly1.setTitleColor(UIColor.black, for: .normal)
        
        
        btnWeekly1.layer.cornerRadius = 15
        btnWeekly1.clipsToBounds = true
        btnWeekly1.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnWeekly1.layer.borderColor = red.cgColor
        
        
        btnDaily1.layer.cornerRadius = 15
        btnDaily1.clipsToBounds = true
        btnDaily1.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily1.layer.borderColor = red1.cgColor


        btnMonthly1.layer.cornerRadius = 15
        btnMonthly1.clipsToBounds = true
        btnMonthly1.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly1.layer.borderColor = red2.cgColor

        btnYearly1.layer.cornerRadius = 15
        btnYearly1.clipsToBounds = true
        btnYearly1.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly1.layer.borderColor = red3.cgColor






    }
    @IBAction func btnWeekly(_ sender: Any) {
        btnWeekly.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily.backgroundColor = UIColor.clear
        btnMonthly.backgroundColor = UIColor.clear

        btnYearly.backgroundColor = UIColor.clear
        
        btnWeekly.setTitleColor(UIColor.white, for: .normal)
        btnDaily.setTitleColor(UIColor.black, for: .normal)
        btnMonthly.setTitleColor(UIColor.black, for: .normal)

        btnYearly.setTitleColor(UIColor.black, for: .normal)
        
        btnWeekly.layer.cornerRadius = 15
        btnWeekly.clipsToBounds = true
        btnWeekly.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnWeekly.layer.borderColor = red.cgColor
        
        
        btnDaily.layer.cornerRadius = 15
        btnDaily.clipsToBounds = true
        btnDaily.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnDaily.layer.borderColor = red1.cgColor


        btnMonthly.layer.cornerRadius = 15
        btnMonthly.clipsToBounds = true
        btnMonthly.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly.layer.borderColor = red2.cgColor

        btnYearly.layer.cornerRadius = 15
        btnYearly.clipsToBounds = true
        btnYearly.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly.layer.borderColor = red3.cgColor




    }
    
    @IBAction func btnViewAll(_ sender: Any) {
          let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
          let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreInventoryManagementVIewController") as! BookStoreInventoryManagementVIewController

          self.present(nextViewController, animated:true, completion:nil)

        
    }
    @IBAction func btnDaily1(_ sender: Any) {
        btnDaily1.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnWeekly1.backgroundColor = UIColor.clear
        btnMonthly1.backgroundColor = UIColor.clear

        btnYearly1.backgroundColor = UIColor.clear
        
        btnDaily1.setTitleColor(UIColor.white, for: .normal)
        btnWeekly1.setTitleColor(UIColor.black, for: .normal)
        btnMonthly1.setTitleColor(UIColor.black, for: .normal)

        btnYearly1.setTitleColor(UIColor.black, for: .normal)
        
        
        btnDaily1.layer.cornerRadius = 15
        btnDaily1.clipsToBounds = true
        btnDaily1.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily1.layer.borderColor = red.cgColor
        
        
        btnWeekly1.layer.cornerRadius = 15
        btnWeekly1.clipsToBounds = true
        btnWeekly1.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly1.layer.borderColor = red1.cgColor


        btnMonthly1.layer.cornerRadius = 15
        btnMonthly1.clipsToBounds = true
        btnMonthly1.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly1.layer.borderColor = red2.cgColor

        btnYearly1.layer.cornerRadius = 15
        btnYearly1.clipsToBounds = true
        btnYearly1.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly1.layer.borderColor = red3.cgColor



    }
    
    @IBAction func btnDaily(_ sender: Any) {
        
        btnDaily.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnWeekly.backgroundColor = UIColor.clear
        btnMonthly.backgroundColor = UIColor.clear

        btnYearly.backgroundColor = UIColor.clear
        
        btnDaily.setTitleColor(UIColor.white, for: .normal)
        btnWeekly.setTitleColor(UIColor.black, for: .normal)
        btnMonthly.setTitleColor(UIColor.black, for: .normal)

        btnYearly.setTitleColor(UIColor.black, for: .normal)
        
        btnDaily.layer.cornerRadius = 15
        btnDaily.clipsToBounds = true
        btnDaily.layer.borderWidth = 2
        var red = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
        btnDaily.layer.borderColor = red.cgColor
        
        
        btnWeekly.layer.cornerRadius = 15
        btnWeekly.clipsToBounds = true
        btnWeekly.layer.borderWidth = 2
        var red1 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnWeekly.layer.borderColor = red1.cgColor


        btnMonthly.layer.cornerRadius = 15
        btnMonthly.clipsToBounds = true
        btnMonthly.layer.borderWidth = 2
        var red2 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnMonthly.layer.borderColor = red2.cgColor

        btnYearly.layer.cornerRadius = 15
        btnYearly.clipsToBounds = true
        btnYearly.layer.borderWidth = 2
        var red3 = UIColor(red: 28/255.0, green: 137/255.0, blue: 197/255.0, alpha: 1.0)
        btnYearly.layer.borderColor = red3.cgColor





        
    }
    
        //MARK: Get Current Day Name
        func getCurrentDayName(){
            let weekday = Calendar.current.component(.weekday, from: Date())
            print(weekday)
            switch weekday {
            case 1:
               todayName = WeekDayName1.Sunday.rawValue
            case 2:
               todayName = WeekDayName1.Monday.rawValue
            case 3:
               todayName = WeekDayName1.Tuesday.rawValue
            case 4:
               todayName = WeekDayName1.Wednesday.rawValue
            case 5:
               todayName = WeekDayName1.Thursday.rawValue
            case 6:
               todayName = WeekDayName1.Friday.rawValue
            case 7:
               todayName = WeekDayName1.Saturday.rawValue
            default:
                print("nothng")
            }
            print(todayName)
        }

    
    func getCurrentDayName1(){
        let weekday = Calendar.current.component(.weekday, from: Date())
        print(weekday)
        switch weekday {
        case 1:
           todayName1 = WeekDayName2.Sunday.rawValue
        case 2:
           todayName1 = WeekDayName2.Monday.rawValue
        case 3:
           todayName1 = WeekDayName2.Tuesday.rawValue
        case 4:
           todayName1 = WeekDayName2.Wednesday.rawValue
        case 5:
           todayName1 = WeekDayName2.Thursday.rawValue
        case 6:
           todayName1 = WeekDayName2.Friday.rawValue
        case 7:
           todayName1 = WeekDayName2.Saturday.rawValue
        default:
            print("nothng")
        }
        print(todayName1)
    }


        func setup(barLineChartView chartView: BarChartView) {
            chartView.chartDescription?.enabled = false

            chartView.isUserInteractionEnabled = false //Disables the selection for bar charts
            chartView.dragEnabled = true
            chartView.setScaleEnabled(false) //turn off scaling /kinda pinch zoom type
            chartView.pinchZoomEnabled = false //disables pinch zoom


            let xAxis = chartView.xAxis
            xAxis.labelPosition = .bottom
            xAxis.labelFont = .systemFont(ofSize: 10)

            //hides grid
            xAxis.drawGridLinesEnabled = false


            chartView.xAxis.valueFormatter = WeekValueFormatter()



            xAxis.labelCount = 7
            chartView.animate(yAxisDuration: 3)
           chartView.rightAxis.enabled = false

            let leftAxisFormatter = NumberFormatter()
            leftAxisFormatter.minimumFractionDigits = 0
            leftAxisFormatter.maximumFractionDigits = 1

            let leftAxis = chartView.leftAxis
            leftAxis.labelFont = .systemFont(ofSize: 10)
            leftAxis.labelCount = 5
            leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
            leftAxis.labelPosition = .outsideChart
            leftAxis.spaceTop = 0.15
            leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES


            let l = chartView.legend
            l.horizontalAlignment = .left
            l.verticalAlignment = .bottom
            l.orientation = .horizontal
            l.drawInside = false
            l.form = .circle
            l.formSize = 6
            l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
            l.xEntrySpace = 4

            //setChart(dataPoints: months, values: unitsSold.map { Double($0) })
            setChart(dataPoints: week, values: staticSteps)
        }

    
    func setup1(barLineChartView chartView: BarChartView) {
        chartView.chartDescription?.enabled = false

        chartView.isUserInteractionEnabled = false //Disables the selection for bar charts
        chartView.dragEnabled = true
        chartView.setScaleEnabled(false) //turn off scaling /kinda pinch zoom type
        chartView.pinchZoomEnabled = false //disables pinch zoom


        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)

        //hides grid
        xAxis.drawGridLinesEnabled = false


        chartView.xAxis.valueFormatter = WeekValueFormatter()



        xAxis.labelCount = 7
        chartView.animate(yAxisDuration: 3)
       chartView.rightAxis.enabled = false

        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1

        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 5
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES


        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 6
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4

        //setChart(dataPoints: months, values: unitsSold.map { Double($0) })
        setChart1(dataPoints: week1, values: staticSteps1)
    }


        func setChart(dataPoints: [String], values: [Int]) {
            barChartView.noDataText = "You need to provide data for the chart."

            var dataEntries: [BarChartDataEntry] = []

            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
                dataEntries.append(dataEntry)
            }

            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
            chartDataSet.colors = ChartColorTemplates.colorful()
            let chartData = BarChartData(dataSet: chartDataSet)
            barChartView.data = chartData
        }

    
    func setChart1(dataPoints: [String], values: [Int]) {
        barChartView1.noDataText = "You need to provide data for the chart."

        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
        chartDataSet.colors = ChartColorTemplates.colorful()
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView1.data = chartData
    }



    //MARK: Weeks Bottom Label Class for x-Axis labels
    public class WeekValueFormatter: NSObject, IAxisValueFormatter {

        override init() {
            super.init()
        }

        public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            let weekday = Calendar.current.component(.weekday, from: Date())
            let week = ["Sun", "Mon", "Tue", "Wed","Thu", "Fri", "Sat"]

            return week[Int(value)]
        }
    }
    }
