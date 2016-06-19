//
//  HYPresentTelecastModel.m
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYPresentTelecastModel.h"

@implementation HYPresentTelecastModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.icon forKey:@"icon"];
    [aCoder encodeObject:self.game_name forKey:@"game_name"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.view_num forKey:@"view_num"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.author forKey:@"author"];
    [aCoder encodeObject:self.source forKey:@"source"];
    [aCoder encodeObject:self.pub_time forKey:@"pub_time"];
    [aCoder encodeObject:self.dasou_icon forKey:@"dasou_icon"];
 
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        
        self.icon = [aDecoder decodeObjectForKey:@"icon"];
        self.game_name = [aDecoder decodeObjectForKey:@"game_name"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.view_num = [aDecoder decodeObjectForKey:@"view_num"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.author = [aDecoder decodeObjectForKey:@"author"];
        self.source = [aDecoder decodeObjectForKey:@"source"];
        self.pub_time = [aDecoder decodeObjectForKey:@"pub_time"];
        self.dasou_icon = [aDecoder decodeObjectForKey:@"dasou_icon"];
  
    }
    return self;
}
@end
