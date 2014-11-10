//
//  SonosViewController.h
//  SonosProjectInterface
//
//  Created by Suma Reddy on 11/4/14.
//  Copyright (c) 2014 Flatiron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SonosViewController : UIViewController

//Songs and SearchResults Array
@property (strong, nonatomic) NSArray *songs;
@property (strong, nonatomic) NSArray *searchResults;

//Album View, Artist and Song
@property (weak, nonatomic) IBOutlet UIImageView *albumView;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;


//Thumbs-Up and Thumbs-Down Buttons and properties
- (IBAction)thumbsUpButton:(id)sender;
- (IBAction)thumbsDownButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *upvoteLabel;
@property (weak, nonatomic) IBOutlet UILabel *downvoteLabel;
@property (nonatomic) int counter;
@property (nonatomic) int counterTwo;
@property(nonatomic) BOOL showsTouchWhenHighlighted;
@property (weak, nonatomic) IBOutlet UIButton *smileyOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sadOutlet;

//Controller (Play and Pause button (on top of one another), Next and Previous Button, volume line)
- (IBAction)playButton:(id)sender;
- (IBAction)pauseButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)previousButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *lineIcon;

//Settings Button (currently not utilized)
- (IBAction)settingsButton:(id)sender;



@end
