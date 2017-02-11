//
//  ParseTableViewController.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/5.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "ParseTableViewController.h"
#import "WeatherXmlParser.h"
#import "Resp.h"
#import "XmlResultTableViewController.h"

@interface ParseTableViewController () <WeatherXmlParserDelegate>

@end

@implementation ParseTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 0) {
        WeatherXmlParser *parser = [WeatherXmlParser xmlParserWithUrl:[[NSBundle mainBundle] URLForResource:@"Weather" withExtension:@"xml"]];
        parser.delegate = self;
        [parser parse];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Use NSXMLParse"]) {
        if ([segue.destinationViewController isKindOfClass:[XmlResultTableViewController class]]) {
            Resp *resp = (Resp *)sender;
            XmlResultTableViewController *xmlTVC = (XmlResultTableViewController *)segue.destinationViewController;
            xmlTVC.resp = resp;
        }
    }
}

- (void)weatherXmlParser:(WeatherXmlParser *)parser didFinishedParseResp:(Resp *)resp
{
    [self performSegueWithIdentifier:@"Use NSXMLParse" sender:resp];
}

@end
