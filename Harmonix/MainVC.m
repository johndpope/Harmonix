//
//  MainVC.m
//  Harmonix
//
//  Created by Even Northug on 28.11.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end


@implementation MainVC

@synthesize songo;
@synthesize chordlistHeader;
@synthesize chordListTV;
@synthesize keyboardButtonView;
@synthesize btnClear;
@synthesize zoomView;
@synthesize keyboard;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create song object with empty chords array of NUMCHORDROWS elements
    songo = [[Songo alloc]init];
    
    // create header view
    chordlistHeader = [[CellContens alloc]initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 44.0)];
    chordlistHeader.lblBar.text = @"Bar";
    chordlistHeader.lblBar.backgroundColor = [UIColor clearColor];
    chordlistHeader.lblMidiNotes.text = @"Midi notes";
    chordlistHeader.lblMidiNotes.backgroundColor = [UIColor clearColor];
    [self.view addSubview:chordlistHeader];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.chordListTV selectRowAtIndexPath:(NSIndexPath *)indexPath animated:NO scrollPosition:(UITableViewScrollPosition)UITableViewScrollPositionNone];
    // Uncomment the following line to preserve selection between presentations.
    //self.chordListTV.clearsSelectionOnViewWillAppear = NO;
    
    
    // color resetting
    chordlistHeader.backgroundColor = self.view.backgroundColor;
    //chordListTV.backgroundColor = self.view.backgroundColor;        // displayed on bouncing
    zoomView.backgroundColor = self.view.backgroundColor;           // displayed on bouncing
    keyboardButtonView.backgroundColor = self.view.backgroundColor;  // colors triangle bottom strip
}

- (void) viewDidAppear:(BOOL)animated   // zoomView frame values already loaded when this method is called
{
    if (self.keyboard == nil) {
        keyboard = [[Keyboard alloc]initWithSetup: [NSNumber numberWithInt:(INITIAL_OCTAVES*7+1)]
                             fromVisibleWidth: [NSNumber numberWithFloat:zoomView.frame.size.width] ]; //52 keys * 19 pix
        keyboard.backgroundColor = self.view.backgroundColor;
        keyboard.delegate = self;
    }

    // set zoomView initial height = keyboard height
    CGRect frame = zoomView.frame;
    frame.size.height = keyboard.frame.size.height;
    zoomView.frame = frame;

    [self resizeViews];
    zoomView.contentSize = keyboard.frame.size;   // enable scrolling       //scaleFactor = 1
    [zoomView addSubview:keyboard];
    zoomView.minimumZoomScale = zoomView.frame.size.width / keyboard.frame.size.width;
    //[zoomView setContentOffset:CGPointMake(zoomView.contentSize.width*9/52, 0.0)];      // c2 left in display
    //zoomView.delegate = self;     done in IB
    

    [zoomView setContentOffset:CGPointMake(zoomView.contentSize.width*9/52, 0.0)];      // c2 left in display
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return NUMCHORDROWS;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    static NSString *CellIdentifier = @"ChordCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];//nil if none
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    else {
        //if ([cell.contentView subviews])
            [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    //[cell.contentView.subviews removeFromSuperview];  // requires array
    
    CellContens *content = [[CellContens alloc]initWithFrame:CGRectMake(0.0, 0.0, tableView.frame.size.width, tableView.rowHeight)];
    
    NSString *str;
    if ([[self.songo.beatInBar objectAtIndex:indexPath.row]intValue] == 1)
        str = [NSString stringWithFormat:@"%d", [[self.songo.barAtBeat objectAtIndex:indexPath.row]intValue]];
    else str = @"";
    content.lblBar.text = str;

    NSString *note;
    NSString *noteString = @"";
    NSMutableArray *chordNotes = [songo.midiNotes objectAtIndex:indexPath.row];
    for (int i=0; i<[chordNotes count]; i++) {
        NSNumber *midiNote = [chordNotes objectAtIndex:i];
        note = [NSString stringWithFormat:@"%d ", midiNote.intValue];
        noteString = [noteString stringByAppendingString:note];
    }
    content.lblMidiNotes.text = noteString;
    
    [cell.contentView addSubview:content];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */



#pragma mark - <UITableViewDelegate> methods

//      method name             arg1
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.chordListTV selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
    [self updateKeyboardFromData];
    
    // Navigation logic may go here. Create and push another view controller.
    // DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    //[self.navigationController pushViewController:detailViewController animated:YES];
}


#pragma -
#pragma mark - <UIScrollViewDelegate> methods


- (UIView*)viewForZoomingInScrollView:(UIScrollView *) scrollView
{
    // Return the view to zoom
    // Return nil if you don’t want zooming to occur. In scrollViewWillBeginZooming:withView: ?
    return self.keyboard;
}


- (void) scrollViewDidZoom:(UIScrollView *)scrollView
{
    // resize and reposition scrollview
    CGRect frame = scrollView.frame;
    frame.size.height = scrollView.contentSize.height * scrollView.contentScaleFactor;
    scrollView.frame = frame;
    
    [self resizeViews];
}


// optional
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)keyboard atScale:(float)scale
{
    
}

- (IBAction) BtnClear
{
    [self.keyboard clearKeyboard];
    [self updateDataAndTableRow];
}

#pragma mark -
#pragma mark <KeyboardDelegate> method


- (void) updateDataAndTableRow
{
    
    NSMutableArray *chordRowNotes = [NSMutableArray array];
    
    for (int keyMIDI = 21; keyMIDI < 109; keyMIDI++) {
        UIView *labelView = [self.keyboard viewWithTag:keyMIDI+LABEL_TAG_OFFSET];    // pointer or copy ??
        if (labelView.hidden == NO)
            [chordRowNotes addObject:[NSNumber numberWithInt:keyMIDI]];
    }

    NSIndexPath *savedSelection = self.chordListTV.indexPathForSelectedRow;
    
    [songo.midiNotes replaceObjectAtIndex:savedSelection.row withObject:chordRowNotes];

    NSArray *paths = [[NSArray alloc]initWithObjects:savedSelection, nil];
    [self.chordListTV reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationNone];
    [self.chordListTV selectRowAtIndexPath:(NSIndexPath *)savedSelection animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    // make tap receiving row visible
    // even better: for invisible cells, first tap makes row visible, no key toggle
    [self.chordListTV selectRowAtIndexPath:savedSelection animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}


#pragma mark -
#pragma mark <PianorollDelegate> method

- (void)resizeViews
{
    CGRect frame = zoomView.frame;
    frame.origin.y = self.view.frame.size.height-keyboard.frame.size.height;
    zoomView.frame = frame;

    // center button view on top of zoomview
    keyboardButtonView.center = CGPointMake(self.view.frame.size.width/2,
                                            zoomView.frame.origin.y-keyboardButtonView.frame.size.height/2);
    // set chordlist height 
    chordListTV.frame = CGRectMake(chordListTV.frame.origin.x,
                                   chordListTV.frame.origin.y,
                                   chordListTV.frame.size.width,
                                   keyboardButtonView.frame.origin.y - chordlistHeader.frame.size.height);
    
    // make selected row reappear from underneath button view
    [self.chordListTV selectRowAtIndexPath:self.chordListTV.indexPathForSelectedRow animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}



#pragma -
#pragma mark - <ChordListDelegate> method


- (void)updateKeyboardFromData
{
    [self.keyboard clearKeyboard];
    
    NSMutableArray *chordRowNotes = [NSMutableArray array];
    int selectedRowNo = self.chordListTV.indexPathForSelectedRow.row;
    chordRowNotes = [songo.midiNotes objectAtIndex:selectedRowNo];
    
    for (int i=0; i<[chordRowNotes count]; i++) {
        NSNumber *midiNote = [chordRowNotes objectAtIndex:i];
        UIView *labelView = [self.keyboard viewWithTag:midiNote.intValue+LABEL_TAG_OFFSET];
        labelView.hidden = NO;
    }
}

@end
