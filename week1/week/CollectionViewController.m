//
//  CollectionViewController.m
//  week
//
//  Created by 郭涛玮 on 2018/8/26.
//  Copyright © 2018年 郭涛玮. All rights reserved.
//

#import "CollectionViewController.h"
#import "MyCollectionViewCell.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *mainCollectionView;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
   [super viewDidLoad];

   // Do any additional setup after loading the view.
   self.view.backgroundColor = [UIColor whiteColor];

   //1.初始化layout
   UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
   //2.初始化collectionView
   self.mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
   [self.view addSubview:self.mainCollectionView];
   self.mainCollectionView.backgroundColor = [UIColor clearColor];

   //3.注册collectionViewCell
   [self.mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

   //4.设置代理
   self.mainCollectionView.delegate = self;
   self.mainCollectionView.dataSource = self;

   //添加手势控制，重设contentOffset实现无限滚动
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
//    [self.mainCollectionView addGestureRecognizer:pan];

   CGRect initRect = self.mainCollectionView.bounds;
   initRect.origin.y = 15 * SCREEN_HEIGHT;
   self.mainCollectionView.bounds = initRect;
}

//- (void)handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer {
//    //ContentInset
//    UICollectionView *view = self.mainCollectionView;
//    CGPoint touchPoint = [panGestureRecognizer translationInView:view];//获取手势位置
//    CGFloat newOriginY = view.bounds.origin.y - touchPoint.y;//根据手势位置计算新的origin值
//    CGFloat newOriginX = view.bounds.origin.x - touchPoint.x;
//
//    CGFloat min = 0.0;
//    CGFloat maxOriginY = 30 * SCREEN_HEIGHT;
//    CGFloat maxOriginX = 0;
//    CGRect viewBounds = view.bounds;
//    viewBounds.origin.y = fmax(min, fmin(newOriginY, maxOriginY));
//    if (viewBounds.origin.y >= 29 * SCREEN_HEIGHT || viewBounds.origin.y == 0.0) viewBounds.origin.y = 10 * SCREEN_HEIGHT;
//    viewBounds.origin.x = 0.0;
//    view.bounds = viewBounds;
//
//    [panGestureRecognizer setTranslation:CGPointZero inView:view];
//}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
   return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
   return 210;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   NSArray *array = @[@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", @"星期日"];
   MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   cell.label.text = [NSString stringWithFormat:@"%@", array[indexPath.row % 7]];

   cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
   // Configure the cell

   return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT / 7);
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
   return 0;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
   if (!decelerate) {
       CGRect nowRect = self.mainCollectionView.bounds;
       int a = nowRect.origin.y / SCREEN_HEIGHT;
       nowRect.origin.y = nowRect.origin.y - a * SCREEN_HEIGHT + 15 * SCREEN_HEIGHT;
       self.mainCollectionView.bounds = nowRect;
   }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
   CGRect nowRect = self.mainCollectionView.bounds;
   int a = nowRect.origin.y / SCREEN_HEIGHT;
   nowRect.origin.y = nowRect.origin.y - a * SCREEN_HEIGHT + 15 * SCREEN_HEIGHT;
   self.mainCollectionView.bounds = nowRect;
}

@end

