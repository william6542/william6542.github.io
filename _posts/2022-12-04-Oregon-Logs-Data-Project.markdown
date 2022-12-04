---
layout: post
title:  "LIS 572 Oregon Logs Data Project "
date:   2022-12-04 1:11:11 -0700
categories: 
---

DRAFT chart 2: Quarters' Pond Value over Years:
![quarters pond values](/assets/QuartersOverYearsPondValueV2.jpeg)

DRAFT chart 3: Region to Pond Value:
![region to pond value](/assets/PondValueByRegionV2.jpeg)


DRAFT chart 4: Species to Pond Value. 
![species to pond value](/assets/PondValueBySpeciesV2.jpeg)


### Introduction
The question that we decided on looking into and trying to answer was how much, if at all, economic swings could be seen through the Pond Value of logs, through a dataset provided by the Oregon Department of Forestry. (Note, Pond Value refers to the price paid for an unprocessed log at a processing plant. Where the logs are stacked are called "Ponds"). 

The dataset can be found here: [Oregon Log Prices Dataset](https://data.oregon.gov/Natural-Resources/Log-Prices/4v4m-wr5p)

#### Context Concerning the Dataset from the Oregon Department of Forestry
The dataset that we found and decided to use was a dataset from the Oregon Department of Forestry. The raw dataset has 7,884 distinct rows of data about sold logs over the course of 15 years, from 2000 to 2015. It also contains some data from 2016, but because the data is incomplete for that year we decided against using it as part of our analysis and final dataset. (We will talk more about our computational process below). The raw dataset has seven different variables tracked for each column, with those variables being:  
1. The Year it was sold   
2. The quarter it was sold in that year  
3. what region the log came from  
4. The grade it was given   
5. The price it was sold for, and  
6. The number of people who bid on the log / the number of pond centers called. 

This dataset was surprisingly comprehensive. The importance of keeping such data was immediately clear to us. It was for situations just like this, be it by the data collectors or others like us, that the lessons which can be learned by interpreting the data collected are more than worth the effort of collection.

#### Some Issues with Two Column Variables
The main issue with the data is that we have been unable to get in contact with the data collector/creator/curator (Julie from the Oregon Department of Forestry). Without her help, we are unable to use two of the columns: Grades and Number.of.Quotes.

'Grade' of logs refer to both the quality of the logs, and the size (scale) of the logs. 'Quotes' we weren't able to figure out at all. 

Luckily, those two sets of data were also the least required for us to be able to interpret to answer our question. While it would have been nice to work with Grade and Quotes as well, in the end they did not seem to be important factors to answer our basic question, which could be analyzed with the remaining column variables. Thus, the lack of usage of Grade and Quotes was not a significant obstacle to conudcting our analyses. 

However, for the sake of clarity, we will further explain what it is exactly that we found problematic with the variables Grade and Number.of.Quotes. 

First, we were unable to use the variable column Grade because the grading rubric input used was inconsistent. While we were able to find official government references as to how logs are graded, the data collection input did not follow that rubric. (Here is a quick guide: [Oregon Log Grading Quick Guide](https://www.oregon.gov/ODF/Documents/WorkingForests/LogTermDefinitions.pdf)). The main issue was the problem of grade (meaning quality) vs scale (meaning size). In the dataset, some of the input rows were only for quality, others only for size, and some held both. This inconsistency led to a situation in which if we were to use that data, we would not have been able to get something out of it that was more than only tangentially related to the original question we were seeking to answer. This is because we simply do not know how much overlap there is on the three types of inputs. It could be the case that the rows indicating both quality and scale are equal in number to the independent rows of scale or quality, or it could be that they are totally separate. Without a response from Julie, we simply do not know. In any case, this experience was important because it showed us the importance of being able to contact the dataset source, and the importance of cleaning. 

Second, we are unsure of what the column variable Number.of.Quotes means exactly. It could be the number of quotes taken per quarter at that listed price, or it could be the number of logs sold at that price quoted from various pond centers. Without this exact information, we would not know if quotes would thus equal a weighting system. If the former, then each row would be weighted as 1. If the latter, then each row would be weighted according to the number of quotes listed. Also, even if the value was weighted, we would not know by how much, because a single quote from any Pond center could indicate any number of logs. In the end, because Julie did not respond to our email, we chose not to utilize this column, which meant that our default assumption was that each row defaulted to a weighted value of 1. 

A final problem was the issue of Year. Does Year mean fiscal year? Or is it simply just calendar year? This problem did not really impact most of the dataset, except for the crucial years around 2007-2009. If Year means Fiscal Year, then Pond Values would not be predictive of the Great Recession. If Year means calendar year, then it could be argued that pond values may have the power to predict housing market crashes! Given the absence of information, and given exsisting US government data on average house prices in the US, we have taken Year to mean calendar year in our analysis [Sales prices of new homes in the US](https://upload.wikimedia.org/wikipedia/en/thumb/b/b8/Median_and_Average_Sales_Prices_of_New_Homes_Sold_in_United_States_1963-2016_annual.svg/1920px-Median_and_Average_Sales_Prices_of_New_Homes_Sold_in_United_States_1963-2016_annual.svg.png). 

#### Computational Method and Analysis  
The raw dataset contains 7,884 distinct rows of information. Although already in quite good shape, we decided to further clean the data for a few reasons. 

On the overall level, we noticed that the data collection for 2016 was incomplete: that final year was missing quarters 3 and 4. We therefore completley deleted any rows which continaed the year 2016. This left us with a remainder of 7,623 rows of information. Doing a quick group_by and count, we were able to see the distribution of the number of rows per year. As expected, 2016 had an abnormally low number of rows. One other issue we noticed was that the number of rows was slowly ramping up from 2000-2006, and then stabailized after 2007. Is the ramping up indicitive of a larger macro logging industry trend, or is it reflective of the building up of logging industry contacts as this dataset first started (and therefore indicating a lack of information in the first years of data collection)? Without a response from Julie, we do not know. 

Dataset rows per year
![screenshot rows per year](/assets/RowCountByYear.jpg)

On a more specific level, while doing analysis on regions, we noticed that two regions only had a frequency of 1. These two rows were "6 - Klamath Unit" and "7 - Klamath Unit". However, Klamath Unit already exsists as region 5. So we decided to slice those two out. Further along in our analysis on regions, we noticed that two regions were the exact same, but for some reason were split into two rows. We merged those two rows into one. ("2 & 3 - Coos, Douglas Counties & Roseburg"). 

Region Count Raw
![Region Count Raw](/assets/RegionCountRaw.jpeg)

For our analysis of the four main relationships, our most common code pattern was to group_by and then summarize(sum()) the cleaned dataset.

{% highlight css %}  
yearly_price_total <- 
  log_prices_clean_2 %>% 
  group_by(Year) %>% 
  summarize(sum(Pond.Value))
{% endhighlight %}  

This worked well for all four relationships:    
1. Total Pond Value over Years  
2. Quartlery Pond Values over Years  
3. Pond Value by Region  
4. Pond Value by Species  
(Note that the Pond Value in each relationship refers to the aggregate Pond Value for each group_by variable).

#### Analysis
The main insight that we got from this dataset is that economic trends have a huge impact on log prices, and this impact is reflected very clearly in the data. Perhaps it can even be said that the log prices may predict economic trends, as we see pond values fall even in 2007, before the Great Recession really kicks down the door. Looking at Figure 1, we can clearly see rising pond values from 2002-2007, and the subsequent nosedive in value during the Great Recession which started in December of 2007. Pond values dropped more than 30% in the span of just 2007-2009. The price nadir of 2009 was lower than anything else we had data on. 

We can also see the tail end of the drop in prices during the tail end of the decade long Dotcom Bubble. The fall at the end of the Dotcom Bubble was much less sudden, as we can see in the years 2000-2002, as compared to extremely steep fall in prices during the Great Recession. 

Figure 1: 

![yearly pond value aggregate](/assets/TotalPondValuesOverYearsV2.jpeg)




Visual data/plots (BELOW)
Zoom in on a specific example? (Maybe refer to Douglas Fir?)
The Douglas Fir, which is also Oregon’s official state tree, makes up by far the most pond value out of all the tree species documented by this dataset. The grand total pond value in the final dataset adds up to $3,579,925. Of that amount, the Douglas Fir holds 33.1% of sales! (At $1,183,280). The dataset clearly reflects the natural prevalence of the Douglas Fir in Oregon, but also displays its prominence and importance to the local rural logging economy. 


A possible future direction that this kind of data could be taken would be expanding the years that the dataset covers, to gain a longer view of the ups and downs of the market price for logs. Also if possible it would be good to compare and contrast against the data of other such lumber selling companies around the US so that we could see trends not only nationally, but also on a smaller scale like state by state. 
