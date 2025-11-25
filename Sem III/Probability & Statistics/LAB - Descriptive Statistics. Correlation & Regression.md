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

### Variance. Covariance coefficient
**variance** - standard deviation, squared
**covariance coefficient** - a strong covariance number signifies direct proportionality. a negative covariance number signifies inverse proportionality. a covariance number close to 0 indicates that the data sets are not relate

in order to decide upon whether the covariance number is big or not, compute the **correlation coefficient** (a number between -1 and 1, where -1 indicates inverse proportionality and 1 indicates direct proportionality)
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

`figure - create a new figure` 

median - sorts the vector and returns either the element in the middle (odd number of terms) or the avg of the 2 numbers in the middle (even number of terms)

>[!Warning]
>Don't compute the variance by squaring the standard deviation --> you're just amplifying errors!!  
>
>Also, in a real case scenario don't compute both the standard deviation and the variant. Compute the variant only!! (more efficient, duh)

`var` - variance
`cov` - covariance
`corrcoef` - correlation coefficient 

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

>[!Question]
> The following data set represents the number of new computer accounts registered during ten consecutive days, by some online service provider company: \[43,37,50,51,58,105,52,45,45,10]
> 
> a) Compute the mean, median, quartiles and standard deviation
> b) construct the box plot an check for outliers using the 3/2 (IQR) rule
> c) Remove the detected outliers and compute the mean, median, quartiles and standard deviation again

|           | accounts     | nonOutliers    |
| --------- | ------------ | -------------- |
| mean      | 49.6         | 47.62          |
| median    | 47.5         | 47.5           |
| std       | 23.47        | 6.45           |
| quartiles | 43, 47.5, 52 | 44, 47.5, 51.5 |

```matlab
% a 
accounts = [43,37,50,51,58,105,52,45,45,10]

mean(accounts)
median(accounts)
prctile(accounts, [25,50,75])
std(accounts)

% b
boxplot(accounts)
V = isoutlier(accounts, 'quartiles') % select outlier according to outliers rule
outliers = accounts(V) % returns the components 

% c
nonOutliers = accounts(V == 0)

mean(nonOutliers)
median(nonOutliers)
prctile(nonOutliers, [25,50,75])
std(nonOutliers)

```

>[!Question]
>The data below represent investments, in 1000EURs, in the development of new software by some small computer company over an 11-year period
>
>| Year (X)       | 2014 | 2015 | 2016 | 2017 | 2018 | 2019 | 2020 | 2021 | 2022 | 2023 | 2024 |
>| -------------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
>| Investment (Y) | 17   | 23   | 31   | 29   | 33   | 39   | 39   | 40   | 41   | 44   | 47   |
>
>a) Compute the means and variances of the two sets of data 
>b) Compute the covariance and the correlation coefficient of X and Y 
>c) Draw the scatter plot, fit a linear regression model and use it to predict the amount invested in 2026

```matlab
years = [2014,2015,2016,2017,2018,2019,2020,2021,2023,2023,2024]
data = [17,23,31,29,33,39,39,40,41,44,47];

mean(data)
var(data)

cov(years, data) % 2x2 matrix containing the means and the covariance coefficients
rho = corrcoef(years, data)

scatter(years, data, 'r*')
lsline
```

>[!Tip] 
>The equation of the linear regression line is $$y - \bar{y} = \rho_{X,Y} \cfrac{\sigma_Y}{\sigma_X}(x - \bar{x})$$ where $\rho_{X,Y}$ is the correlation coefficient and $\sigma_X$, $\sigma_Y$ are the standard deviations of X and Y


predictions only work when we have a strong correlation coefficient!!