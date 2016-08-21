//
//  YVAndroidTableAdapter.m
//  AndroidInfoTest
//
//  Created by Юрий Воскресенский on 20.08.16.
//  Copyright © 2016 Юрий Воскресенский. All rights reserved.
//

#import "YVAndroidTableAdapter.h"

@implementation YVAndroidTableAdapter

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YVAndroidTableCell *cell = [tableView dequeueReusableCellWithIdentifier:YVAndroidTableCellReuseIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configureAndroidTableCellWithAndroidModel:self.modelsArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(androidTableAdapter:didSelectItem:atIndex:allModels:)])
    {
        [self.delegate androidTableAdapter:self didSelectItem:self.modelsArray[indexPath.row] atIndex:indexPath.row allModels:self.modelsArray];
    }
}

@end
