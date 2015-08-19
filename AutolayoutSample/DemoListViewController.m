//
//  ViewController.m
//  AutolayoutSample
//
//  Created by joehsieh on 2015/8/18.
//  Copyright (c) 2015年 JH. All rights reserved.
//

#import "DemoListViewController.h"
#import "JHCustomizeViewController.h"
#import "JHAutoresizngViewController.h"
#import "JHAutolayoutViewController.h"

static NSString *const kCellIndetifier = @"kCellIndetifier";

@interface DemoListViewController ()
@property (nonatomic, strong) NSDictionary *sampleNameAndClassDictionary;
@property (nonatomic, strong) NSArray *sampleNames;
@end

@implementation DemoListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sampleNames = @[@"layoutSubviews", @"autoresizing", @"autolayout"];
    self.sampleNameAndClassDictionary = @{self.sampleNames[0]:[JHCustomizeViewController class], self.sampleNames[1]:[JHAutoresizngViewController class], self.sampleNames[2]:[JHAutolayoutViewController class]};
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIndetifier];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIndetifier forIndexPath:indexPath];
    cell.textLabel.text = self.sampleNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *sampleName = self.sampleNames[indexPath.row];
    Class c = self.sampleNameAndClassDictionary[sampleName];
    UIViewController *vc = [[c alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
