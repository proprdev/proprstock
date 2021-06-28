#import "../include/SCRootViewController.h"
#import "../include/PlaystationDirect.h"

@implementation SCRootViewController

- (void)loadView {
	[super loadView];
	
	UIButton* discButton = [UIButton new];

	[discButton setTitle:@"Check Stock Button" forState:UIControlStateNormal];
	[discButton setBackgroundColor:[UIColor redColor]];
	[discButton sizeToFit];
	discButton.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addSubview:discButton];

	[NSLayoutConstraint activateConstraints:@[
		[discButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
		[discButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor]
	]];


	UILabel* discStock = [UILabel new];

	if ([PlaystationDirect checkStock:@"disc"]) {
		[discStock setText:@"In Stock!"];
		[discStock setTextColor:[UIColor greenColor]];
	} else {
		[discStock setText:@"Out of Stock"];
		[discStock setTextColor:[UIColor redColor]];
	}
	[discStock setBackgroundColor:[UIColor blueColor]];
	[discStock sizeToFit];

	discStock.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addSubview:discStock];

	[NSLayoutConstraint activateConstraints:@[
		[discStock.centerXAnchor constraintEqualToAnchor:discButton.centerXAnchor],
		[discStock.centerYAnchor constraintEqualToAnchor:discButton.centerYAnchor],
	]];
	
}

@end
