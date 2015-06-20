#import "NappItemProvider.h"

@implementation NappItemProvider

@synthesize customText = _customText;
@synthesize customTextMail = _customTextMail;

@synthesize shareURL = _shareURL;
@synthesize twitterString = _twitterString;

@synthesize URL = _URL; // facebook only allowes one URL and a image, URL must be NSURL


- (id)initWithPlaceholderItem:(id)placeholderItem
{
    return [super initWithPlaceholderItem:placeholderItem];
}

- (id)item
{
    return @"";
}

- (id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType
{
    
    NSString *text;
    NSURL *url;
    
    NSLog(@"[INFO] activityType: %@", activityType);

    
    // mail
    if ([activityType isEqualToString:UIActivityTypeMail]) {
        
        if(_customTextMail) {
            text = [NSString stringWithFormat:@"%@%@%@", @"<html><head></head><body>", _customTextMail, @"</body></html>"];
            NSLog(@"[INFO] Sharing the following as HTML %@",text);
        } else {
            text = _customText;
        }

        return text;
    }
    
    // twitter
    if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {
  
        if([_twitterString length] != 0) {
            text = [_customText stringByAppendingString:_twitterString];
        } else {
            text = _customText;
        }
        
        return text;
    }
    
    // facebook
    // no additional data supported, so return only URL
    if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {
        
        url = _URL;
        return url;
    }
    
    // message
    if ([activityType isEqualToString:UIActivityTypeMessage]) {
        
        text = _customText;
        return text;
    }

   /* if ( [activityType isEqualToString:@"it.albertopasca.myApp"] ||
        [activityType.lowercaseString rangeOfString:@"whatsapp"].length) {
        
    }*/
    
    return text = _customText;
}

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController
{
    return @"";
}
@end