//
//  ViewController.m
//  国旗选择
//
//  Created by  江苏 on 16/4/14.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "Flag.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSArray* flags;
@property(nonatomic,strong)UIPickerView* pickerView;
@end

@implementation ViewController

-(UIPickerView *)pickerView{
    if (_pickerView==nil) {
        _pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, 320, 300)];
        _pickerView.delegate=self;
        _pickerView.dataSource=self;
        [self.view addSubview:_pickerView];
    }
    return _pickerView;
}

-(NSArray *)flags{
    if (_flags==nil) {
        _flags=[Flag flags];
    }
    return _flags;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self pickerView];
}

#pragma mark-pickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

#pragma mark-pickerViewDelegate
/**
 *  设置自定义的view
 */
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component==0) {
        //判断是否有可以重用的view，如果没有则创建，有则直接用
        if (view==nil) {
            UILabel* countryLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 30)];
            countryLabel.text=[self.flags[row] name];
            return countryLabel;
        }else{
            return view;
        }
    }else{
        if (view==nil) {
            UIImageView* countryImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
            countryImageView.image=[UIImage imageNamed:(NSString*)[self.flags[row] icon]];
            return countryImageView;
        }else{
            return view;
        }
    }
}
/**
 *  设置联动
 */
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
         [self.pickerView selectRow:row inComponent:1 animated:YES];
    }else{
        [self.pickerView selectRow:row inComponent:0 animated:YES];
    }
}
@end
