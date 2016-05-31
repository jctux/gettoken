//
//  ViewController.swift
//  TrackClient
//
//  Created by Martinez, Juan on 5/31/16.
//  Copyright © 2016 Martinez, Juan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let user = "admin"
        
        let pass = "admin"
        
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
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let result = json["result"] as? [[String: AnyObject]] {
                
                    }
                    
                    if let token = json["data"] as? [[String: AnyObject]]{
                        print("token is:\(token)")
                        someLabel.text = "\(someVar)"
                        
                    }
                    
                    
                }catch {
                    print("Error with Json: \(error)")
                }
                
            }
        }
        
        task.resume();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

