# Statistical Inference - Course Project, Part 1: Simulation Exercises
Subrata  
Friday, Sept 12, 2014  

Couresra-[Statistical Inference][statinference-005][Course Project][Part 1]

## Environment
All code was developed and tested on:

> * R version 3.1.1 (2014-07-10) 
> * Platform: x86_64-w64-mingw32/x64 (64-bit)
> * Operating System: Microsoft Windows 8 Version 6.3.9700 

## Introduction and Motivation
This is the part 1 of project for the Statistical Inference class in [Coursera][1]. 

The exponential distribution can be simulated in R with `rexp(n, lambda)` 
where `lambda` is the rate parameter. 

The mean of exponential distribution is `1/lambda` and the standard deviation is also also `1/lambda`. Set `lambda = 0.2` for all of the simulations. 

In this simulation, we need to investigate the distribution of averages of 40 `exponential(0.2)s`. 

Note that we need to do a thousand or so simulated averages of 40 exponentials.

Illustrated via simulation and associated explanatory text the properties of the distribution of the mean of 40 `exponential(0.2)s`.  
We need to:

1. Show where the distribution is centered at and compare it to the theoretical center of the distribution.
2. Show how variable it is and compare it to the theoretical variance of the distribution.
3. Show that the distribution is approximately normal.
4. Evaluate the coverage of the confidence interval for `1/lambda`: $\bar X \pm 1.96 \frac{S}{\sqrt{n}}$ (This only needs to be done for the specific value of `lambda`). 

## Simulation Analysis

The code to simulate the mean of exponential distribution is as follows:

```r
set.seed(1)
lambda <- 0.2
ture_mean <- 1/lambda
ture_std <- 1/lambda
sim_num <- 1000
sample_size <- 40
sample_data <- matrix(rexp(sim_num*sample_size, lambda), sim_num, sample_size)
sample_mean <- apply(sample_data, 1, mean)
sample_var <- apply(sample_data, 1, var)
sample_std <- apply(sample_data, 1, sd)
```

#### 1. Distribution of Sample Means  
The histogram of the sample means shows that they are centered around the theoretical mean of 5 (The mean of origin exponential distribution). 

![plot of chunk unnamed-chunk-2](./project_part1_files/figure-html/unnamed-chunk-2.png) 

#### 2.  Variance of Sample Means
Theoretically, the standard deviation of sample means is $(1/\lambda)/\sqrt{n} = 1/0.2/\sqrt{40}$ = 0.7906, the variance is 0.625. 

And the variance of sample means we obtained is 0.6177.

We have plotted the density of the normal distribution (red line) and the density of the sample means (black line). Please note that the two densities are quite close. 




#### 3.  Distribution is approximately normal
The expected normal distribution (red line) and density of sample means (black line) are quite close in the first figure. 


#### 4. Evaluate the coverage of the confidence interval for 1/lambda
Finally, we calculate the 95% confidence interval for our 1000 sample means, and show that what percentage of these confidence intervals contain the true population mean `1/lambda=5`.

```r
LambdaCover<-function(lambda) {
  lower_limit <- sample_mean - 1.96*sample_std/sqrt(sample_size)
  upper_limit <- sample_mean + 1.96*sample_std/sqrt(sample_size)
  mean(lower_limit < 1/lambda & upper_limit > 1/lambda)
}  
LambdaCover(lambda)
```

```
## [1] 0.932
```
Therefore, 93.2% of these confidence intervals contain the true population mean `1/lambda=5`.


## Appendix
The complete R markdown file for this report can be found at the github repo: [StatisticalInference_ClassProject][2].




[1]:https://class.coursera.org/statinference-005
[2]:https://github.com/subroto08820/StatisticalInference_ClassProject
