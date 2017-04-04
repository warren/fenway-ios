//
//  ViewController.swift
//  Fenway Garden Society
//
//  Created by Warren Partridge on 11/19/16.
//  Copyright © 2016 BU Global App Initiative. All rights reserved.
//

import UIKit
//import GoogleAPIClient
// import GTMOAuth2 TO A FUTURE READER: DO NOT USE THIS. IT IS DEPRECATED ACCORDING TO A GOOGLE POST ON GITHUB
//import GTMAppAuth
//import AppAuth
//import GoogleAPIClient
//import GoogleAPIClientForREST
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    private let kKeychainItemName = "iOS client 1"
    private let kClientID = "301673697222-a2i8to3ld0qihr4gc9cu6t4pjht3ke3a.apps.googleusercontent.com"
    private let kRedirectURI = "com.fenwaygardens.app:oauth_login_redirect"
    private let kIssuer = "https://accounts.google.com"
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    /*
    private let scopes = [kGTLAuthScopeCalendarReadonly]
    
    private let service = GTLServiceCalendar()
    let output = UITextView()
    
    var authState: OIDAuthState?
    @IBOutlet weak var fileListView: UIPickerView!
    */
    
    /*let appDelegate = (UIApplication.shared.delegate! as! AppDelegate)
     var authorization: GTMAppAuthFetcherAuthorization?
     var kExampleAuthorizerKey = "authorization"
     let userDefaults = UserDefaults.standard */
    
    
    // When the view loads, create necessary subviews
    // and initialize the Google Calendar API service
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("https://www.googleapis.com/calendar/v3/calendars/info%40fenwayvictorygardens.org/events?key=AIzaSyByz6zzKDLD966LSS2tPucaQPwfezihMA8").responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            /*if let JSON = response.result.value {
             print("JSON: \(JSON)")
             }*/
            
            // Initializes SwiftyJSON stuff
            let jsonresponse = JSON(response.result.value)
            let jsonItems = jsonresponse["items"]
            
            let jsonItemsSize = jsonItems.count
            
            var eventTitles = [JSON]()
            var eventDetails = [JSON]()
            var eventLocations = [JSON]()
            var eventStartDates = [JSON]()
            var eventEndDates = [JSON]()
            
            // Fill our info arrays with info. I'm using .insert instead of .append in case one event is missing
            // one of these values and it doesn't get misindexed
            for counter in 0 ... (jsonItemsSize - 1) {
                eventTitles.insert(jsonItems[counter]["summary"], at: counter)
                eventDetails.insert(jsonItems[counter]["description"], at: counter)
                eventLocations.insert(jsonItems[counter]["location"], at: counter)
                eventStartDates.insert(jsonItems[counter]["start"]["dateTime"], at: counter)
                eventEndDates.insert(jsonItems[counter]["end"]["dateTime"], at: counter)
            }
            
            print(eventTitles)
            print(eventDetails)
            print(eventLocations)
            print(eventStartDates)
            print(eventEndDates)
            
            
        }
        
    }
    
    
    
    // CALENDAR When the view appears, ensure that the Google Calendar API service is authorized
    // and perform API calls
    /*override func viewDidAppear(_ animated: Bool) {
     if let authorizer = service.authorizer,
     let canAuth = authorizer.canAuthorize, canAuth {
     fetchEvents()
     } else {
     present(
     createAuthController(),
     animated: true,
     completion: nil
     )
     }
     }*/
    
    
    /*@IBAction func authorize(_ sender: Any)
     {
     auth()
     }
     
     
     func saveAuth()
     {
     if authorization != nil && (authorization?.canAuthorize())! {
     let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: authorization!)
     userDefaults.set(encodedData, forKey: kExampleAuthorizerKey)
     userDefaults.synchronize()
     }
     else {
     userDefaults.removeObject(forKey: kExampleAuthorizerKey)
     }
     }
     */
    
    /*func auth()
     {
     //need this potatoe
     let issuer = URL(string: kIssuer)!
     let redirectURI = URL(string: kRedirectURI)!
     
     //logMessage("Fetching configuration for issuer: " + issuer.description)
     // discovers endpoints
     OIDAuthorizationService.discoverConfiguration(forIssuer: issuer, completion: {(_ configuration: OIDServiceConfiguration?, _ error: Error?) -> Void in
     if configuration == nil {
     //self.logMessage("Error retrieving discovery document: " + (error?.localizedDescription)!)
     return
     }
     //self.logMessage("Got configuration: " + configuration!.description)
     // builds authentication request
     let scopes = ["https://www.googleapis.com/auth/calendar.readonly"/*, kGTLRAuthScopeDrive*/]
     let request = OIDAuthorizationRequest(configuration: configuration!, clientId: self.kClientID, scopes: scopes, redirectURL: redirectURI, responseType: OIDResponseTypeCode, additionalParameters: nil)
     // performs authentication request
     
     
     //self.logMessage("Initiating authorization request with scope: " + request.scope!.description)
     
     OIDAuthState.authState(byPresenting: request, presenting: self, callback: {(_ authState: OIDAuthState?, _ error: Error?) -> Void in
     if authState != nil {
     self.authorization = GTMAppAuthFetcherAuthorization(authState: authState!)
     self.service.authorizer = self.authorization
     
     //self.saveAuth()
     print("successful log in")
     }
     })
     })
     }*/
    
    
    /*func loadAuth()
     {
     if let _ = userDefaults.object(forKey: kExampleAuthorizerKey)
     {
     let decoded = userDefaults.object(forKey: kExampleAuthorizerKey) as! Data
     let testAuth = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! GTMAppAuthFetcherAuthorization
     authorization = testAuth
     service.authorizer = authorization
     }
     }*/
    
    // aW5mb0BmZW53YXl2aWN0b3J5Z2FyZGVucy5vcmc
    
    // https://www.googleapis.com/calendar/v3/calendars/info%40fenwayvictorygardens.org/events?key=AIzaSyByz6zzKDLD966LSS2tPucaQPwfezihMA8
    
    
    
    // CALENDAR Construct a query and get a list of upcoming events from the user calendar
    /*func fetchEvents() {
     let query = GTLQueryCalendar.queryForEventsList(withCalendarId: "info@fenwayvictorygardens.org")
     query?.maxResults = 10
     query?.timeMin = GTLDateTime(date: NSDate() as Date!, timeZone: NSTimeZone.local)
     query?.singleEvents = true
     query?.orderBy = kGTLCalendarOrderByStartTime
     service.executeQuery(
     query!,
     delegate: self,
     didFinish: "displayResultWithTicket:finishedWithObject:error:"
     )
     }*/
    
    // CALENDAR Display the start dates and event summaries in the UITextView
    /*func displayResultWithTicket(
     ticket: GTLServiceTicket,
     finishedWithObject response : GTLCalendarEvents,
     error : NSError?) {
     
     if let error = error {
     showAlert(title: "Error", message: error.localizedDescription)
     return
     }
     
     var eventString = ""
     
     if let events = response.items(), !events.isEmpty {
     for event in events as! [GTLCalendarEvent] {
     let start : GTLDateTime! = event.start.dateTime ?? event.start.date
     let startString = DateFormatter.localizedString(
     from: start.date,
     dateStyle: .short, // this might be messed up
     timeStyle: .short // same with this
     )
     eventString += "\(startString) - \(event.summary)\n"
     }
     } else {
     eventString = "No upcoming events found."
     }
     
     output.text = eventString
     }*/
    
    // CALENDAR Creates the auth controller for authorizing access to Google Calendar API
    /*private func createAuthController() -> GTMOAuth2ViewControllerTouch {
     let scopeString = scopes.joined(separator: " ")
     return GTMOAuth2ViewControllerTouch(
     scope: scopeString,
     clientID: kClientID,
     clientSecret: nil,
     keychainItemName: kKeychainItemName,
     delegate: self,
     finishedSelector: "viewController:finishedWithAuth:error:"
     )
     }*/
    
    // CALENDAR Handle completion of the authorization process, and update the Google Calendar API
    // with the new credentials.
    /*func viewController(vc : UIViewController,
     finishedWithAuth authResult : GTMOAuth2Authentication, error : NSError?) {
     
     if let error = error {
     service.authorizer = nil
     showAlert(title: "Authentication Error", message: error.localizedDescription)
     return
     }
     
     service.authorizer = authResult
     dismiss(animated: true, completion: nil)
     }
     
     // Helper for showing an alert
     func showAlert(title : String, message: String) {
     let alert = UIAlertController(
     title: title,
     message: message,
     preferredStyle: UIAlertControllerStyle.alert
     )
     let ok = UIAlertAction(
     title: "OK",
     style: UIAlertActionStyle.default,
     handler: nil
     )
     alert.addAction(ok)
     present(alert, animated: true, completion: nil)
     }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

