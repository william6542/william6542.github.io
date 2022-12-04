---
layout: post
title:  "LIS 572 Oregon Logs Data Project "
date:   2022-12-04 1:11:11 -0700
categories: 
---

## Remember to note somewhere that all pond values are aggregate totals for their given group_by

DRAFT chart 2: Quarters' Pond Value over Years:
![quarters pond values](/assets/QuartersOverYearsPondValueV2.jpeg)

DRAFT chart 3: Region to Pond Value:
![region to pond value](/assets/PondValueByRegionV2.jpeg)


DRAFT chart 4: Species to Pond Value. 
![species to pond value](/assets/PondValueBySpeciesV2.jpeg)


### Introduction  
The question that we decided on looking into and trying to answer was how much, if at all, economic swings could be seen through the commercial prices of logs as sold through the Oregon Department of Forestry.

### Context Concerning the Dataset from the Oregon Dept. of Forestry  
The dataset that we found and decided to use was a dataset from the Oregon Department of Forestry. The dataset has 7,884 distinct rows of data about sold logs over the course of 15 years, from 2000 to 2015. It also contains some data from 2016, but because the data is incomplete for that year we decided against using it as part of our analysis and final dataset. The raw dataset has seven different variables tracked for each column, with those variables being:  
1. The Year it was sold   
2. The quarter it was sold in that year  
3. what region the log came from  
4. The grade it was given   
5. The price it was sold for, and  
6. The number of people who bid on the log / the number of pond centers called. (We are unsure of this variable and will explain later below).

It was at first a somewhat surprisingly comprehensive dataset for something that seemed so mundane, but after some thought the importance of keeping such data was clear. It was for situations just like this, be it by the data collectors or others like us, that the lessons which can be learned by interpreting the data collected are more than worth the effort of collection.

The main issue with the data is that we have been unable to get in contact with the data collector. Without her help, we are unable to use two of the columns: Grades and Number.of.Quotes.  

One problem that we ran into with this dataset is getting context for two of the types of data that is in it. While we reached out to the creator of the dataset, or at least the one who published it and is listed as the creator, but we did not hear back. The two columns of data that we were unable to effectively use are the graded assessment of the quality of the wood, and the quotes made on the wood. 

Luckily, those two sets of data were also the least required for us to be able to interpret to answer our question. While it would have been nice to work with the wood grade and number of bids as well, in the end they were largely only factors in the final price the wood was sold for, which was a set of data that was very understandable and easy to work with. And as our question was directly related to the price of the wood over time and not the grade of the wood, it was not a significant obstacle to have to exclude those variables from the final analysis.

However, for the sake of clarity, we will further explain what it is exactly that we found problematic with the variables Grade and Number.of.Quotes. 

First, we were unable to use the variable column Grade because the grading rubric input used was inconsistent. While we were able to find official government references as to how logs are graded, the data collection input did not follow that rubric (https://www.oregon.gov/ODF/Documents/WorkingForests/LogTermDefinitions.pdf). The main issue was the problem of grade (meaning quality) vs scale (meaning size). In the dataset, some of the input rows were only for quality, others only for size, and some held both. This inconsistency led to a situation in which if we were to use that data, we would not have been able to get something out of it that was mor ethan only tangentially related to the original question we were seeking to answer. This is because we simply do not know how much overlap there is on the three types of inputs. It could be the case that the rows indicating both quality and scale are equal in number to the independent rows of scale or quality, or it could be that they are totally separate. Without a response from Julie, we simply do not know. In any case, this experience was important because it showed us the importance of being able to contact the dataset source, and the importance of cleaning. 

Second, we are unsure of what the column variable Number.of.Quotes means exactly. It could be the number of quotes taken per quarter at that listed price, or it could be the number of logs sold at that price quoted from various pond centers. Without this exact information, we would not know if quotes would thus equal a weighting system. If the former, then each row would be weighted as 1. If the latter, then each row would be weighted according to the number of quotes listed. Because Julie did not respond to our email, we chose not to utilize this column, which meant that our default assumption was that each row defaulted to a weighted value of 1. 

### Computational method?   (NEED TO ADD)

The main insight that we got from this dataset is that economic trends have a huge impact on log prices, and this impact is reflected very clearly in the data. Perhaps it can even be said that the log prices may predict economic trends, as we see prices fall even in 2007. Looking at Figure 1,we can clearly see rising price of logs from 2002-2007, and the subsequent nosedive in prices during the Great Recession which started in December of 2007. Log prices dropped more than 30% in the span of just 2007-2009. The price low of 2009 was lower than anything else we had data on. 

We can also see the tail end of the drop in prices during the tail end of the decade long Dotcom Bubble. The fall at the end of the Dotcom Bubble was much less sudden, as we can see in the years 2000-2002, as compared to extremely steep fall in prices during the Great Recession. 

Figure 1: 

![yearly pond value aggregate](/assets/TotalPondValueOverYearsV2.jpeg)


Visual data/plots (BELOW)
Zoom in on a specific example? (Maybe refer to Douglas Fir?)
The Douglas Fir, which is also Oregon’s official state tree, makes up by far the most pond value out of all the tree species documented by this dataset. The grand total pond value in the final dataset adds up to $3,579,925. Of that amount, the Douglas Fir holds 33.1% of sales! (At $1,183,280). The dataset clearly reflects the natural prevalence of the Douglas Fir in Oregon, but also displays its prominence and importance to the local rural logging economy. 


A possible future direction that this kind of data could be taken would be expanding the years that the dataset covers, to gain a longer view of the ups and downs of the market price for logs. Also if possible it would be good to compare and contrast against the data of other such lumber selling companies around the US so that we could see trends not only nationally, but also on a smaller scale like state by state. 
