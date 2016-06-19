//
//  HYDynamicList.m
//  HY
//
//  Created by tarena04 on 16/6/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYDynamicList.h"
#import "HYDynamicListUser.h"
@implementation HYDynamicList
-(instancetype)initWithDic:(NSDictionary *)dic{
    
    self = [super init];
    if (self) {
        self.text = dic[@"text"];
        self.created_at = dic[@"created_at"];
        self.pic_urls = dic[@"pic_urls"];
        self.source = dic[@"source"];
        self.reposts_count = dic[@"reposts_count"];
        self.comments_count = dic[@"comments_count"];
        self.attitudes_count = dic[@"attitudes_count"];
        self.ID = dic[@"id"];
        NSDictionary *userDic = dic[@"user"];
        self.user = [[HYDynamicListUser alloc] initWithDic:userDic];
        
        NSDictionary *reWeiboDic = dic[@"retweeted_status"];
        if (reWeiboDic) {
            self.reWeibo = [[HYDynamicList alloc]initWithDic:reWeiboDic];
        }
        
        
    }
    return self;
}

-(NSString *)created_at{

    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    format.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    format.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *weiboDate = [format dateFromString:_created_at];
    NSDate *nowDate = [NSDate new];
    
    long nowTime = [nowDate timeIntervalSince1970];
    long weiboTime = [weiboDate timeIntervalSince1970];
    long time = nowTime-weiboTime;
    if (time<60) {
        return @"刚刚";
    }else if (time>60&&time<=3600){
        return [NSString stringWithFormat:@"%d分钟前",(int)time/60];
    }else if (time>3600&&time<3600*24){
        return [NSString stringWithFormat:@"%d小时前",(int)time/3600];
    }else{
        format.dateFormat = @"MM月dd日";
        return  [format stringFromDate:weiboDate];
    }

}

-(void)setSource:(NSString *)source{
    if ([source containsString:@">"]) {
        source = [source componentsSeparatedByString:@">"][1];
        
        source = [[source componentsSeparatedByString:@"<"]firstObject];
        
        _source = [@"来自：" stringByAppendingString:source];
    }else{
        _source = @"来自：未知";
    }
    
}


-(float)getWeiboHeight{
    
    float h = 0;
 
    h += [self getTextHeight]+2*kMargen;

    if (self.pic_urls.count>0) {
        h += [self getImageHeight]+kMargen;
    }
    
    if (self.reWeibo) {
        h += [self.reWeibo getWeiboHeight]+kMargen;
    }

    return h;
}

-(float)getTextHeight{
    
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:kTextSize]};
    
    CGSize retSize = [self.text boundingRectWithSize:CGSizeMake(kScreenWidth-2*kMargen, CGFLOAT_MAX)
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize.height;
}

-(float)getImageHeight{
    
    NSInteger count = self.pic_urls.count;
    
    if (count==1) {
        return 200;
    }else if (count>1&&count<=3){
        return kImageSize;
    }else if (count>3&&count<=6){
        return 2*kImageSize+kMargen;
    }else if (count>6&&count<=9){
        return 3*kImageSize+2*kMargen;
    }
    
    return 0;
}


@end
