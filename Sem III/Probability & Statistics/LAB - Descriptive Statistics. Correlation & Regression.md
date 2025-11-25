# LAB - Descriptive Statistics. Correlation & Regression
___
Class: [[Probability & Statistics]]
Type: 
Tags: # 
Date: November 25th, 2025
___

## Theory

Standard deviation --> the average difference between a number and the mean

Note that if the distribution is not uniform

quartiles (standard: 25, 50, 75) --> returns \[X, Y, Z]
- 25% of data is below X
- 50% of data is below Y
- 75% of data is below Z

### Box Plots

box plots contain info about the
- min and max non-outliers
- mean
- std
- quartiles
- interquartile range



### The 1.5 IQR Method

This is used to determine the outliers in a set of data
`min_limit = q1 - 1.5 * iqr`
`max_limit = q3 - 1.5 * iqr`

## MatLab Stuff

`subplot(rows, cols, section)` --> create a rows x cols subplot and go to the specified section

elements in a row are comma-separated. Going to the next row can be done with the semi-column operator

in order to create a combined box plot
1. create a column vector with all the data: `all_data = [before'; after']`
2. use `g1 = repmat({'before'}, size(before));` and `g2 = repmat({'after'}, size(after))` to associate the corresponding label to each element
3. aggregate the data: `g = [g1', g2']`
4. `boxplot(all_data, g)`


`clf - clear previous figure`
## Questions

>[!Question]
>The numbers of blocked intrusion attempts on each day, during the first two weeks of the month, on some site were \[56,47,49,37,38,60,50,43,43,59,50,56,54,58].
>
>After the change of the firewall settings, the number of blocked intrusions during the next 20 days were \[53,21,32,49,45,38,44,33,32,43,53,46,36,48,39,35,37,36,39,45].
>
>To compare the number of blocked intrusions before and after the change,
>a) Compute the minimum, maximum, mean, standard deviation, quartiles and interquartile range, for the two sets of data
>b) construct histograms (with 10 classes), one on top of the other
>c) construct side-by-side boxplots


```matlab
% a
attempts1 = [56,47,49,37,38,60,50,43,43,59,50,56,54,58];
attempts2 = [53,21,32,49,45,38,44,33,32,43,53,46,36,48,39,35,37,36,39,45];

min1 = min(attempts1);
min2 = min(attempts2);

max1 = max(attempts1);
max2 = max(attempts2);

mean1 = mean(attempts1);
mean2 = mean(attempts2);

dev1 = std(attempts1);
dev2 = std(attempts2);

% standard quartiles
% prctile(vector, [25,50,75])

qu1 = prctile(attempts1, [25,50,75]);
qu2 = prctile(attempts2, [25,50,75]);

% interquartile range
% iqr(vector) --> Q3 - Q1

iqr1 = iqr(attempts1);
iqr2 = iqr(attempts2);
```

```matlab
% b
subplot(2,1,1);
histogram(attempts1, 10)
title("Before")

subplot(2,1,2);
histogram(attempts2, 10)
title("After")
```

```
% c
subplot(1,2,1)
boxplot(attempts1, 'Labels', "Before")

subplot(1,2,2)
boxplot(attempts2, 'Labels', "After")

```

