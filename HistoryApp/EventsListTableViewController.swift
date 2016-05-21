//
//  EventsListTableViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 2/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class EventsListTableViewController: UITableViewController {
    let arrayEventName = ["Coup d'état at Chen Bridge", "Along the River During the Qingming Festival", "Dream Pool Essays"]
    let arrayImagename = ["chenbridge.jpg", "qingming2.jpg", "mengxi.jpg"]
    let arrayDescription = [
        "In 960, word reached the prime minister Fan Zhi that Northern Han and Liao were once again allied to invade them again. Without verifying the liability of the hearsay, Fan Zhi sent Zhao Kuangyin to combat the alliance. After traveling 40 li, there was a clamor that a prophet saw 2 suns fighting, and that this meant the transfer of the Heaven's Mandate onto Zhao Kuangyin. The story effectively spread around the army: there came discontent of the command of the young emperor and a shift of loyalty to Zhao. A few days later, when Kuangyin was drunk in his tent, all the troops have not slept the whole night; they got their weapons and started yelling. Zhao Pu and Zhang Kuangyi, who were guarding the tent, saw the situation and went into the tent to wake up Kuangyin. When Kuangyin came out, all the troops yelled, The army is without a master, we're willing to make commander the new emperor.Allegedly, Zhao Kuangyin took the power reluctantly, only under the urging of his soldiers. The midnight mutiny of officers forcibly urged Zhao Kuangyin to the throne; but, when the officers presented him to the troops as their new commander-in-chief he refused the imperial nomination until they swore unconditional obedience to him as leader.[5] News of the rebellion soon reached the court and erupted chaos. The only person who thought about a resistance was Han Tong, but he was killed by one of Kuangyin's generals when he reached home.Upon entering the capital city to take his seat on the throne, Zhao Kuangyin, or emperor Taizu of the new Song dynasty, made an executive order prohibiting the troops from looting the city or otherwise violating the rights of the population.With the gate open for Zhao Kuangyin, he became emperor with no resistance. Before the prime minister Fang Zhi could say anything, one of Kuangyin's generals pointed a sword at Fang Zhi and said, We're without masters. Today, we must have an emperor. After the officials looked at each other and knew it was hopeless to resist, they all bowed down. With the court under control, Kuangyin was officially proclaimed Taizu, the emperor of Song. The new dynasty name was taken after the army he controlled in the Song Prefecture.",
        "Along the River During the Qingming Festival is a painting by the Song dynasty artist Zhang Zeduan (1085–1145). It captures the daily life of people and the landscape of the capital, Bianjing, today's Kaifeng, from the Northern Song period.[1] The theme is often said to celebrate the festive spirit and worldly commotion at the Qingming Festival, rather than the holiday's ceremonial aspects, such as tomb sweeping and prayers. Successive scenes reveal the lifestyle of all levels of the society from rich to poor as well as different economic activities in rural areas and the city, and offer glimpses of period clothing and architecture.[2] The painting is considered to be the most renowned work among all Chinese paintings,[3][4][5] and it has been called China's Mona Lisa.",
        "The Dream Pool Essays or Dream Torrent Essays was an extensive book written by the Han Chinese polymath, genius, scientist and statesman Shen Kuo (1031-1095) by 1088 AD, during the Song dynasty (960-1279) of China. Although Shen was previously a highly renowned government official and military general, he compiled this enormous written work while virtually isolated on his lavish garden estate near modern-day Zhenjiang, Jiangsu province. He named the book after the name he gave to his estate, the Dream Brook. The literal translated meaning is Brush Talks from a Dream Brook, and Shen Kuo is quoted as saying: Because I had only my writing brush and ink slab to converse with, I call it Brush Talks."]
    let arrayWikiUrl = ["https://en.wikipedia.org/wiki/Emperor_Taizu_of_Song",
        "https://en.wikipedia.org/wiki/Along_the_River_During_the_Qingming_Festival",
        "https://en.wikipedia.org/wiki/Dream_Pool_Essays"]
    
    var chosenCellIndex = 0
    var imageName : String!
    var descriptionText : String!
    var wikiUrl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        let headerView = UIView(frame: CGRectMake(0,0, self.view.frame.width,50))
        
        let headerLabel = UILabel(frame: CGRectMake(self.view.frame.width/2 - 100/2, 10, 100, 40))
        headerLabel.textAlignment = .Center
        headerLabel.text = "People"
        
        headerView.addSubview(headerLabel)
        
        tableView.tableHeaderView = headerView
 */       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayEventName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventListCell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayEventName[indexPath.row]
        
        //        let peopleListButton : UIButton = cell.viewWithTag(1) as! UIButton
        //
        //        peopleListButton.setTitle(arrayPeopleName[indexPath.row], forState: .Normal)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //FIXME: segue to next page here
        
        chosenCellIndex = indexPath.row
        imageName = arrayImagename[chosenCellIndex]
        descriptionText = arrayDescription[chosenCellIndex]
        wikiUrl = arrayWikiUrl[chosenCellIndex]
        print ("imageName11: \(imageName)")
        self.performSegueWithIdentifier("showEventDetail", sender: self)
        
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailViewController : DetailViewController = segue.destinationViewController as! DetailViewController
        detailViewController.imageName = imageName
        detailViewController.descriptionText = descriptionText
        detailViewController.wikiUrl = wikiUrl
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
