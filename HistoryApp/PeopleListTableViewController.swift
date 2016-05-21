//
//  PeopleListTableViewController.swift
//  HistoryApp
//
//  Created by Jiongyan Zhang on 30/03/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class PeopleListTableViewController: UITableViewController {
    
    let arrayPeopleName = ["Li Qingzhao", "Su Shi", "Xin Qiji", "Yue Fei", "Zhao Kuangyin"]
    let arrayPeopleTitle = ["A talented female poet", "A Great poet", "A famous military poet", "A great General", "The first emperor of the Song dynasty"]
    let arrayImagename = ["QingzhaoLi.jpg", "Sushi.jpg", "Xinqiji.jpg", "Yuefei.jpg", "Zhaokuangyin.jpg"]
    let arrayDescription = [
        "Li Qingzhao was born 1084 in Zhangqiu (modern Shandong province) into a family of scholar-officials. Her father was a student of Su Shi. He had a large collection of books and Li was educated during her childhood. She was unusually outgoing and knowledgeable for a woman of noble birth.Li Qingzhao was born 1084 in Zhangqiu (modern Shandong province) into a family of scholar-officials. Her father was a student of Su Shi. He had a large collection of books and Li was educated during her childhood. She was unusually outgoing and knowledgeable for a woman of noble birth.Before she got married, her poetry was already well known within elite circles. In After he started his official career, her husband was often absent.",
        "Su Shi (January 8, 1037 – August 24, 1101), also known as Su Tungpo, was a Chinese writer, poet, painter, calligrapher, pharmacologist, gastronome, and a statesman of the Song dynasty. A major personality of the Song era, Su was an important figure in Song Dynasty politics, aligning himself with Sima Guang and others, against the New Policy party led by Wang Anshi. Su Shi was famed as an essayist, and his prose writings lucidly contribute to the understanding of topics such as 11th-century Chinese travel literature or detailed information on the contemporary Chinese iron industry. His poetry has a long history of popularity and influence in China, Japan, and other areas in the near vicinity and is well known in the English-speaking parts of the world through the translations by Arthur Waley, among others.Dongpo pork, a prominent dish in Hangzhou cuisine, is named in his honor",
        "Xin Qiji (28 May 1140 – 1207) was a Chinese poet and military leader during the Southern Song dynasty.During Xin's lifetime, northern China was occupied during the Jin–Song wars by the Jurchens of the Jin dynasty, a nomadic people from what is now north-east China then regarded as barbarians. Only southern China was ruled by the Han Chinese Southern Song dynasty. Xin was born in the modern city of Jinan in Shandong Province. In his childhood his grandfather told him about the time when the Han Chinese ruled the north and told him to be an honorable man and seek revenge against the barbarian for the nation. It was then when he developed his patriotic feelings. His grandfather named him after a legendary military commander from the Western Han, Huo Qubing.",
        "Yue Fei (24 March 1103 – 27 January 1142), courtesy name Pengju, was a Han Chinese military general who lived during the Southern Song dynasty. His ancestral home was in Xiaoti, Yonghe Village, Tangyin, Xiangzhou, Henan (in present-day Tangyin County, Anyang, Henan). He is best known for leading Southern Song forces in the wars in the 12th century between Southern Song and the Jurchen-ruled Jin dynasty in northern China before being put to death by the Southern Song government in 1142.[1] He was granted the posthumous name Wumu by Emperor Xiaozong in 1169, and later granted the posthumous title King of È (鄂王) by Emperor Ningzong in 1211. Widely seen as a patriot and national folk hero in China, since after his death, Yue Fei has evolved into a standard epitome of loyalty in Chinese culture.",
        "Zhao Kuangyin ,courtesy name Yuanlang also known by his temple name Taizu (太祖), was the founding emperor of imperial China's Song Dynasty, reigning from 960 until his death. A distinguished military general under the Later Zhou, he came to power by staging a coup d'état and forcing the young Emperor Gong of Later Zhou to abdicate power."]
    let arrayWikiUrl = ["https://en.wikipedia.org/wiki/Li_Qingzhao",
        "https://en.wikipedia.org/wiki/Su_Shi",
        "https://en.wikipedia.org/wiki/Xin_Qiji",
        "https://en.wikipedia.org/wiki/Yue_Fei",
        "https://en.wikipedia.org/wiki/Emperor_Taizu_of_Song"]
    
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

    @IBOutlet var peopleSearchBar: UISearchBar!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPeopleName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("peopleListCell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayPeopleName[indexPath.row]
        cell.detailTextLabel?.text = arrayPeopleTitle[indexPath.row]
    
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
        self.performSegueWithIdentifier("showPeopleDetail", sender: self)
        
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
