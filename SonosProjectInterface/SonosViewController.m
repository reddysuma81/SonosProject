//
//  SonosViewController.m
//  SonosProjectInterface
//
//  Created by Suma Reddy on 11/4/14.
//  Copyright (c) 2014 Flatiron. All rights reserved.
//

#import "SonosViewController.h"
#import "SongTableCellTableViewCell.h"
#import "SearchDisplayTableViewController.h"
#import "AppDelegate.h"
#import "Songs.h"
#import "AutoAutoLayout.h"

@interface SonosViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

//Search textfield, hidden table view, and results table
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) SearchDisplayTableViewController *resultsTable;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (nonatomic, strong) UITableView *hiddenTableView;

@end

@implementation SonosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //AutoLayout (working from 4S)
    [self.view removeConstraints:self.view.constraints];
    [AutoAutoLayout reLayoutAllSubviewsFromBase:@"4s" forSubviewsOf:self.view];
    
    //SmileyButtons - does not work currently
    self.smileyOutlet.showsTouchWhenHighlighted = YES;
    self.sadOutlet.showsTouchWhenHighlighted = YES;
    
    // Initialize the songs array
    Songs *song1 = [Songs new];
    song1.artist = @"Artist1";
    song1.song = @"Song1";
   
    Songs *song2 = [Songs new];
    song2.artist = @"Arist2";
    song2.song = @"Song2";

    self.songs = [NSArray arrayWithObjects: song1, song2, nil];

    //Initializing search tableView and and textView delegates
    [self.view addSubview:self.hiddenTableView];
    self.resultsTable = [SearchDisplayTableViewController new];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.resultsTable];
    
    self.hiddenTableView.dataSource = self;
    self.hiddenTableView.delegate = self;
    self.searchTextField.delegate = self;
    [self.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text field delegates
- (void)textFieldDidChange:(id)sender {
    if (self.searchTextField.text.length == 0) {
        self.hiddenTableView.hidden = YES;
    } else {
        self.hiddenTableView.hidden = NO;
        NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"song CONTAINS[c] %@", self.searchTextField.text];
        self.searchResults = [self.songs filteredArrayUsingPredicate:resultsPredicate];
        [self.hiddenTableView reloadData];
    }
}

#pragma mark - Lazy init
- (UITableView *)hiddenTableView {
    if (_hiddenTableView == nil) {
        _hiddenTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 108, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 108)];
        [_hiddenTableView registerClass:[SongTableCellTableViewCell class] forCellReuseIdentifier:@"searchCell"];
        _hiddenTableView.hidden = YES;
    }
    return _hiddenTableView;
}

#pragma mark - Table view delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongTableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
//    if (self.searchResults.count > 0) {
        Songs *currentSong = self.searchResults[indexPath.row];
        cell.songLabel.text = currentSong.song;
        cell.artistLabel.text = currentSong.artist;
//    }
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//Create a method to handle search filtering.  Searches through all songs and returns the matched results.
-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
        NSPredicate *resultsPredicate = [NSPredicate predicateWithFormat:@"song contains[c]", searchText];
        
        self.searchResults = [self.songs filteredArrayUsingPredicate:resultsPredicate];
    
}

//When button is pressed, upVoteLabel or downVoteLabel adds 1
- (IBAction)thumbsUpButton:(id)sender {
    
    self.counter += 1;
    [self.upvoteLabel setText:[NSString stringWithFormat:@"%d", self.counter]];
}

- (IBAction)thumbsDownButton:(id)sender {
    
    self.counterTwo += 1;
    [self.downvoteLabel setText:[NSString stringWithFormat:@"%d", self.counterTwo]];
    
}

#pragma mark - Controller Buttons

- (IBAction)playButton:(id)sender {
}

- (IBAction)nextButton:(id)sender {
}

- (IBAction)previousButton:(id)sender {
}

- (IBAction)pauseButton:(id)sender {
}

- (IBAction)settingsButton:(id)sender {
}


@end
