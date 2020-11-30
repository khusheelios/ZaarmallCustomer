//
//  FMDBDatabaseModel.swift
//  FMDBDatabase Demo
//
//  Created by Parth Changela on 22/06/17.
//  Copyright © 2017 Micropple. All rights reserved.
//

import Foundation
import UIKit

let sharedInstance = FMDBDatabaseModel()
class FMDBDatabaseModel: NSObject {

    var databese:FMDatabase? = nil

    class func getInstance() -> FMDBDatabaseModel
    {
        if (sharedInstance.databese == nil)
        {
        sharedInstance.databese = FMDatabase(path: Util.getPath(fileName: "ZarMall.db"))
        }
        return sharedInstance
    }

    //MARK:- insert data into table

    func InsertData(_ Tbl_Info:Tbl_Info) -> Bool {
        sharedInstance.databese!.open()
        let isInserted = sharedInstance.databese!.executeUpdate("INSERT INTO ZarMallAddProduct(category_id,sub_category_id,child_category_id,author_id,product_name,descriptions,original_price,total_discount,stock_quantity) VALUES(?,?,?,?,?,?,?,?,?)", withArgumentsIn: [Tbl_Info.category_id,Tbl_Info.sub_category_id,Tbl_Info.child_category_id,Tbl_Info.author_id,Tbl_Info.product_name,Tbl_Info.descriptions,Tbl_Info.original_price,Tbl_Info.total_discount,Tbl_Info.stock_quantity])

        sharedInstance.databese!.close()
        return (isInserted != nil)

    }
    func GetAllData() -> NSMutableArray {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("SELECT * FROM ZarMallAddProduct", withArgumentsIn: [0])

        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {

                let item:Tbl_Info = Tbl_Info()
//                item.Id = Int(resultSet.int(forColumn: "Id"))
//                item.Name = String(resultSet.string(forColumn: "Name")!)
//                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
//                item.Email = String(resultSet.string(forColumn: "Email")!)
//                itemInfo.add(item)
            }
        }

        sharedInstance.databese!.close()
        return itemInfo
    }

//    func updateRecode(RecoreId:Int,Name:String,MobileNo:String,Email:String) -> NSMutableArray {
//        sharedInstance.databese!.open()
//
//        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("UPDATE ZarMall-AddProduct SET Name = ?,MobileNo = ?,Email = ? WHERE Id = ?", withArgumentsIn: [Name,MobileNo,Email,RecoreId])
//
//        let itemInfo:NSMutableArray = NSMutableArray ()
//        if (resultSet != nil)
//        {
//            while resultSet.next() {
//
//                let item:Tbl_Info = Tbl_Info()
//                item.Id = Int(resultSet.int(forColumn: "Id"))
//                item.Name = String(resultSet.string(forColumn: "Name")!)
//                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
//                item.Email = String(resultSet.string(forColumn: "Email")!)
//                itemInfo.add(item)
//            }
//    }
//
//        sharedInstance.databese!.close()
//        return itemInfo
//
//    }
    func deleteRecode(RecoreId:Int) -> NSMutableArray {
        sharedInstance.databese!.open()

        let resultSet:FMResultSet! = sharedInstance.databese!.executeQuery("DELETE FROM ZarMallAddProduct WHERE Id = ?", withArgumentsIn: [RecoreId])

        let itemInfo:NSMutableArray = NSMutableArray ()
        if (resultSet != nil)
        {
            while resultSet.next() {

//                let item:Tbl_Info = Tbl_Info()
//                item.Id = Int(resultSet.int(forColumn: "Id"))
//                item.Name = String(resultSet.string(forColumn: "Name")!)
//                item.MobileNo = String(resultSet.string(forColumn: "MobileNo")!)
//                item.Email = String(resultSet.string(forColumn: "Email")!)
//                itemInfo.add(item)
            }
        }

        sharedInstance.databese!.close()
        return itemInfo
        
    }
}
