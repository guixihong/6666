
#import "CustomTabBarViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

-(UIViewController *)addViewControllerWithString:(NSString *)viewCon title:(NSString *)title andImage:(NSString *)image andSlectedImage:(NSString *)image2
{
    Class viewController = NSClassFromString(viewCon);
    UIViewController *myViewCon = [[viewController alloc]init];
    myViewCon.title = title;
    UIImage * image1 = [UIImage imageNamed:image];
    UIImage * lImage = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image3 = [UIImage imageNamed:image2];
    UIImage *lImage3 = [image3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myViewCon.tabBarItem.image = lImage;
    myViewCon.tabBarItem.selectedImage = lImage3;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:myViewCon];
    nav.navigationBar.tintColor = [UIColor blackColor];
    nav.navigationBar.translucent = NO;
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:nav];
    self.viewControllers = array;
    return myViewCon;
}

@end
