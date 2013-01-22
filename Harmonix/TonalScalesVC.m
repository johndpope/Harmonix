//
//  TonalScalesVC.m
//  Harmonix
//
//  Created by Even Northug on 08.12.12.
//  Copyright (c) 2012 Even Northug. All rights reserved.
//

#import "TonalScalesVC.h"

#import "TonalScale.h"
#import "Scale.h"
#import "Degree.h"
#import "ChordFamily.h"
#import "ChordType.h"


@interface TonalScalesVC ()

@end

@implementation TonalScalesVC

@synthesize tonalScalesHeader;       // ignore STORYBOARD header view
@synthesize tonalScalesTV;
@synthesize majorMinorSelector;
@synthesize btnReset;
@synthesize colHeaders;
@synthesize context;
@synthesize tonalScale;
//@synthesize chordScaleDegree;
//@synthesize chordFamily;


/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];

    // fetch data for tonalScale
    NSString *str;
    //NSError *error;
    context = [[AppDelegate sharedAppDelegate] managedObjectContext];
    
    // fetch scales according to majorMinorSelector value
    [self selectGenderScales];      // assigns objects to tonalScale array

/*
    // SAMPLE FETCHING CODE
    // fetch ALL chordScaleDegrees for ALL tonal scales to self.chordScaleDegree array
    NSFetchRequest *degreesRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *degreesEntity = [NSEntityDescription
                                   entityForName:@"ChordScaleDegree" inManagedObjectContext:context];
    [degreesRequest setEntity:degreesEntity];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d) OR (idx == %d)", 0, 2, 3, 5, 6, 7, 8, 10, 12, 13, 16, 17];        // Chromatic scale with default b and #IV roman accidentals

                              //@"(accidText like %@)", s];
    [degreesRequest setPredicate:predicate];
    NSSortDescriptor *sortDegreesByIdx = [[NSSortDescriptor alloc]initWithKey:@"idx" ascending:YES];
    NSArray *sortDegreesDescriptors = [NSArray arrayWithObject:sortDegreesByIdx];
    [degreesRequest setSortDescriptors:sortDegreesDescriptors];
 
    // assigns objects to chordScaleDegree array
    //self.chordScaleDegree = [context executeFetchRequest:degreesRequest error:&error];    // NEVER USED !!!!!!!!!!!
    
    // assigns objects to chordFamily array
    NSFetchRequest *famRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *famEntity = [NSEntityDescription
                                         entityForName:@"ChordFamily" inManagedObjectContext:context];
    [famRequest setEntity:famEntity];
    //self.chordFamily = [context executeFetchRequest:famRequest error:&error];    // NEVER USED !!!!!!!!!!!
*/
    
    // create header view
    tonalScalesHeader = [[TonalScalesCellContents alloc]initWithFrame:CGRectMake(0.0, 0.0, 1024.0, 44.0)];
    tonalScalesHeader.lblName.backgroundColor = [UIColor clearColor];
    tonalScalesHeader.lblName.text = @"Tonal scale";
    UILabel *lbl;
    self.colHeaders = [NSArray arrayWithObjects:
                       @"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", nil];

    for (int col=0; col<[colHeaders count]; col++) {
        lbl = [self.tonalScalesHeader.lblDegreeFamily objectAtIndex:col];
        str = [colHeaders objectAtIndex:col];
        //[lbl setText:str];
        lbl.text = str;
        lbl.backgroundColor = self.view.backgroundColor;
/*
        // color labels with accidentals
        char accid = [str characterAtIndex:0];
        if (accid == '#' || accid == 'b')       // never true in header view
            lbl.backgroundColor = self.view.backgroundColor;
        else
            lbl.backgroundColor = [UIColor whiteColor];
*/
        [tonalScalesHeader.lblDegreeFamily replaceObjectAtIndex:col withObject:lbl];
    }
    [self.view addSubview:tonalScalesHeader];

        
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //[self.tonalScalesTV selectRowAtIndexPath:(NSIndexPath *)indexPath animated:NO scrollPosition:(UITableViewScrollPosition)UITableViewScrollPositionNone];
    
    
    // Uncomment the following line to preserve selection between presentations.
    //self.chordListTV.clearsSelectionOnViewWillAppear = NO;
    
    // color resetting
    tonalScalesHeader.backgroundColor = self.view.backgroundColor;
    //chordListTV.backgroundColor = self.view.backgroundColor;        // displayed on bouncing

    // configure navigationItem
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.btnReset = self.navigationItem.rightBarButtonItem;     // save for retrieval
    self.navigationItem.leftItemsSupplementBackButton = YES;    // to make back button remain visible
}


- (void) viewDidAppear:(BOOL)animated   // self objects already loaded when called
{
    [super viewDidAppear:animated];
    
    // add objects depending on IB objects or objects instantiated in viewDidLoad
/*
    // allocate HALF of the VC height to tonal scales table
    CGRect rect = self.view.frame;
    rect.size.height = rect.size.height/2;
    self.view.frame = rect;
*/
    
    /*
    if (self.keyboard == nil) {
        keyboard = [[Keyboard alloc]initWithSetup: [NSNumber numberWithInt:(INITIAL_OCTAVES*7+1)]
                                 fromVisibleWidth: [NSNumber numberWithFloat:zoomView.frame.size.width] ]; //52 keys * 19 pix
        keyboard.backgroundColor = self.view.backgroundColor;
        keyboard.delegate = self;
    }
     */
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
    return [self.tonalScale count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TonalScaleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];//nil if none
    
    // Configure the cell...
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    else
        [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // make cell content view
    TonalScalesCellContents *content = [[TonalScalesCellContents alloc]initWithFrame:CGRectMake(0.0, 0.0, tableView.frame.size.width, tableView.rowHeight)];
    
    // select tonal scale to display at actual row
    TonalScale *ts = [self.tonalScale objectAtIndex:indexPath.row];
    // select first scale for tonal scale (built on tonal scale degree 1)

    // cell "column" 1: ts name + (abbrev)
    NSString *str = [[NSString alloc]initWithString:ts.name];
    str = [str stringByAppendingString:@" ("];
    str = [str stringByAppendingString:[[self.tonalScale objectAtIndex:indexPath.row]abbrev]];
    str = [str stringByAppendingString:@")"];
    content.lblName.text = str;

    // cell "columns" 2 ...:
    UILabel *lbl;
    Scale *scl;
    NSArray *scaleArray = [ts.scale objectAtIndex:0];
    //NSArray *degreeArray = [scaleArray objectAtIndex:0];
    Degree *dgr;
    ChordFamily *cFam;
    ChordType *chType;
    NSArray *romanRoot = [NSArray arrayWithObjects:
                          @"I", @"bII", @"II", @"bIII", @"III", @"IV", @"#IV", @"V", @"bVI", @"VI", @"bVII", @"VII", nil];
    for (scl in ts.scale) {     // for the actual tonal scale's 7 scales and labels ...
        [self selectScaleDegrees:scl];
        //for (dgr in scl.degree)
        dgr = [self.degreesArray objectAtIndex:0];
        str = dgr.degree;
        int rootIdx = [[AppDelegate sharedAppDelegate] chromNoteFromDegree:str];
        int colIdx = [[AppDelegate sharedAppDelegate] degreeNumFromDegree:str] - 1;
        lbl = [content.lblDegreeFamily objectAtIndex:colIdx];
        str = [romanRoot objectAtIndex:rootIdx];    // simplified assignment logic. Works fine here.
        chType = scl.chordType;
        cFam = scl.chordFamily;
        if (cFam) {
            str = [str stringByAppendingString:@" "];
            str = [str stringByAppendingString:cFam.symbol];
        }
        else
            [lbl setTextColor:[UIColor grayColor]];
        //int num = item.selected.intValue;
        if (dgr.selected.intValue == 1)  //LOGICALLY (and programmatically? NB) never true for items without chordFamily
            [lbl setBackgroundColor:[UIColor lightGrayColor]];
        else
            [lbl setBackgroundColor:[UIColor whiteColor]];
        lbl.text = str;
        [content.lblDegreeFamily replaceObjectAtIndex:colIdx withObject:lbl];
    }
    
    /* 
    // set background for 12 labels in row
    UILabel *hdrLbl;
    for (int col=0; col<12; col++) {
        hdrLbl = (UILabel *)[tonalScalesHeader.lblDegreeFamily objectAtIndex:col];
        [[content.lblDegreeFamily objectAtIndex:col] setBackgroundColor:hdrLbl.backgroundColor];
    }
     */
    
    /*
    NSSet *degrees = ts.chordScaleDegree;                              // the seven Major scale degrees
    chordScaleDegree *item = nil;
    for (item in degrees) {
        int col = item.semiNoteNum.intValue;
        
        str = item.romanText;
        UILabel *lbl;
        lbl = [content.lblDegreeFamily objectAtIndex:col];
        lbl.text = str;

        [content.lblDegreeFamily replaceObjectAtIndex:col withObject:lbl];
    }
*/
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

/* Uncomment for allowing row CELL selection?
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tonalScalesTV selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    
    //[self updateKeyboardFromData];
    
    // Navigation logic may go here. Create and push another view controller.
    // DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    //[self.navigationController pushViewController:detailViewController animated:YES];
}
*/


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    //[self.navigationItem setHidesBackButton:editing animated:YES];
    
    if (!editing)   // Done button pushed
    {
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.navigationItem.titleView.hidden = NO;
        self.navigationItem.rightBarButtonItem = self.btnReset;
        self.navigationItem.leftItemsSupplementBackButton = YES;
        //[self save];
    }
    else    // changes "Edit" button text to "Done" automatically
    {
        UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(Cancel:)];
        self.navigationItem.rightBarButtonItem = cancelButtonItem;
        //cancelButtonItem = nil;
        self.navigationItem.titleView.hidden = YES;
        self.navigationItem.leftItemsSupplementBackButton = NO;
    }
}


- (IBAction)Cancel:(id)sender
{
    //cancel
    self.editing = NO; //--> This is the trick!!!!!!
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.titleView.hidden = NO;
    self.navigationItem.rightBarButtonItem = self.btnReset;
    self.navigationItem.leftItemsSupplementBackButton = YES;
}


- (IBAction)btnResetPushed:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Diatonic degrees"
                                                     message:@"Reset to factory defaults!"
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"Ok", nil];
    [alert show];
}


- (IBAction)minorMajorSelectorValueChanged:(id)sender
{
    [self selectGenderScales];
    [self.tonalScalesTV reloadData];    // no tableView update until cell(s) dequeuing!
    //[self.tonalScalesTV setNeedsDisplay];     // no effect!
    //[self.tonalScalesTV reloadRowsAtIndexPaths:[self.tonalScalesTV indexPathsForVisibleRows]
    //                 withRowAnimation:UITableViewRowAnimationNone];
}


- (void) selectGenderScales
// place predicate matching tonal scales in self array tonalScale
{
    NSString *str;
    NSError *error;
    
    // fetch ALL tonal scales (entity) to self.tonalScale array
    NSFetchRequest *scalesRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *scalesEntity = [NSEntityDescription
                                         entityForName:@"TonalScale" inManagedObjectContext:context];
    [scalesRequest setEntity:scalesEntity];
    /*
    NSSortDescriptor *sortScalesByNumber = [[NSSortDescriptor alloc]initWithKey:@"sortNumber" ascending:YES];   // ERROR
    NSArray *sortScalesDescriptors = [NSArray arrayWithObject:sortScalesByNumber];
    [scalesRequest setSortDescriptors:sortScalesDescriptors];
    */
    if (self.majorMinorSelector.selectedSegmentIndex == 0)
        str = @"M";
    else
        str = @"m";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(tonalMode == %@)", str];
    [scalesRequest setPredicate:predicate];
    self.tonalScale = [context executeFetchRequest:scalesRequest error:&error];
}


- (void) selectScaleDegrees: (Scale *) scl
// place predicate matching degrees in self array tonalScale
{
    NSString *str;
    NSError *error;
    
    // fetch ALL tonal scales (entity) to self.tonalScale array
    NSFetchRequest *degreesRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *degreesEntity = [NSEntityDescription
                                         entityForName:@"Degree" inManagedObjectContext:context];
    [degreesRequest setEntity:degreesEntity];
    /*
    NSSortDescriptor *sortDegreesByNumber = [[NSSortDescriptor alloc]initWithKey:@"sortNumber" ascending:YES];
    NSArray *sortScalesDescriptors = [NSArray arrayWithObject:sortScalesByNumber];
    [scalesRequest setSortDescriptors:sortScalesDescriptors];
     */
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(scale == %K)", scl];
    [degreesRequest setPredicate:predicate];
    self.degreesArray = [context executeFetchRequest:degreesRequest error:&error];
}
               
               
@end

