//
//  ViewController.swift
//  TrackClient
//
//  Created by Martinez, Juan on 5/31/16.
//  Copyright © 2016 Martinez, Juan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let user = "admin"
    let pass = "admin"
    
    // MARK: Connections to UI
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    // MARK: Actions
    @IBAction func requestToken(sender: UIButton) {
        requestTokenUrl()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let requestURL: NSURL = NSURL(string: "http://io.arga-tracking.com:5180/android/request_token?username=\(user)@arga-tracking.com&password=\(pass)")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                do{
                    
                    if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary{
                        let resultDictionary = jsonResult["result"] as? NSString
                        let dataDictionary = jsonResult["data"] as? NSString
                        print("result from url request is \(resultDictionary)")
                        print("data from url is \(dataDictionary)")
                    
                    }
                    
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        task.resume();
        
    }

    func requestTokenUrl(){
        
        let requestURL: NSURL = NSURL(string: "http://io.arga-tracking.com:5180/android/request_token?username=\(user)@arga-tracking.com&password=\(pass)")!
        
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(urlRequest) {
            
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                
                    if let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary{
                        let resultDictionary = jsonResult["result"] as? NSString
                        let dataDictionary = jsonResult["data"] as? NSString
                        print("result from url request is \(resultDictionary)")
                        print("data from url is \(dataDictionary)")
                    }
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        task.resume();
        return 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

