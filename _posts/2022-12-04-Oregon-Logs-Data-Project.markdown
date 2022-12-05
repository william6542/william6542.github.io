---
layout: post
title:  "LIS 572 Oregon Logs Data Project "
date:   2022-12-04 1:11:11 -0700
categories: 
---

LIS 572: Data Science with Professor Melanie Walsh.   
By William Wu and Ben Hauptman.   
First published 2022-12-04.   

### Introduction
The question we wanted to look into was if macroeconomic swings could be detected through the price of logs. We used a dataset provided by the Oregon Department of Forestry. We chose this dataset because Oregon is a large supplier of logs throughout the Northwest. 

*(Note, Pond Value refers to the price paid for an unprocessed log at a processing plant. Where the logs are stacked are called "Ponds". Log price and pond value are the same thing).*

Since we knew that Douglas Fir is very common in Oregon, and since we also knew that Douglas Fir is comomnly used in building construction, we *predicted that data analysis on this dataset would indeed produce results that clearly show the economic crisis of 2008*. 

The dataset can be found here: [Oregon Log Prices Dataset](https://data.oregon.gov/Natural-Resources/Log-Prices/4v4m-wr5p).  
Our code can be found here: [Oregon Log Prices R Analysis](/assets/OregonLogPricesRASSETSv1.R).


#### Context Concerning the Dataset from the Oregon Department of Forestry
The dataset that we found and decided to use was a dataset from the Oregon Department of Forestry. The raw dataset has 7,884 distinct rows of data about sold logs over the course of 15 years, from 2000 to 2015. It also contains some data from 2016, but because the data is incomplete for that year we decided against using it as part of our analysis and final dataset. (We will talk more about our computational process below). The raw dataset has seven different variables tracked for each column, with those variables being:  
1. The **Year** it was sold   
2. The **Quarter** it was sold in that year  
3. what **Region** the log came from  
4. The **Grade** it was given   
5. The price it was sold for ("**Pond Value**"), and  
6. The number of people who bid on the log / the number of pond centers called. ("**Quote**").

This dataset was surprisingly comprehensive. The importance of keeping such data was immediately clear to us. It was for situations just like this, be it by the data collectors or others like us, that the lessons which can be learned by interpreting the data collected are more than worth the effort of collection.


#### Some Issues with Two Column Variables
The main issue with the data is that we have been unable to get in contact with the data collector/creator/curator (Julie from the Oregon Department of Forestry). Without her help, we are unable to use two of the columns: Grades and Number.of.Quotes.

'Grade' of logs refer to both the quality of the logs, and the size (scale) of the logs. 'Quotes' we weren't able to figure out at all. 

Luckily, those two sets of data were also the least required for us to be able to interpret to answer our question. While it would have been nice to work with Grade and Quotes as well, in the end they did not seem to be important factors to answer our basic question, which could be analyzed with the remaining column variables. Thus, the lack of usage of Grade and Quotes was not a significant obstacle to conudcting our analyses. 

However, for the sake of clarity, we will further explain what it is exactly that we found problematic with the variables Grade and Number.of.Quotes. 

First, we were unable to use the variable column Grade because the grading rubric input used was inconsistent. While we were able to find official government references as to how logs are graded, the data collection input did not follow that rubric. (Here is a quick guide: [Oregon Log Grading](https://www.oregon.gov/ODF/Documents/WorkingForests/LogTermDefinitions.pdf)). The main issue was the problem of grade (*meaning quality*) vs grade (*meaning scale or size*). In the dataset, some of the input rows were only for quality, others only for size, and some held both. This inconsistency led to a situation in which if we were to use that data, we would not have been able to get something out of it that was more than only tangentially related to the original question we were seeking to answer. This is because we simply do not know how much overlap there is on the three types of inputs.   
It could be the case that the rows indicating both quality and scale are equal in number to the independent rows of scale or quality, or it could be that they are totally separate. Without a response from Julie, we simply do not know. In any case, this experience was important because it showed us the importance of being able to contact the dataset source, and the importance of cleaning. 

Second, we are unsure of what the column variable Number of Quotes means exactly. It could be the number of quotes taken per quarter at that listed price, or it could be the number of logs sold at that price quoted from various pond centers. Without this exact information, we would not know if quotes would indicate a weighting system. If the former, then each row would be weighted as 1. If the latter, then each row would be weighted according to the number of quotes listed.   
Also, even if the value did indicate weight, we would not know *by how much*, because a quote from any pond center could indicate any number of logs. This is because unique pond centers *are not* listed as a column variable. In the end, because Julie did not respond to our email, we chose not to utilize this column, which meant that our default assumption was that each row defaulted to a weighted value of 1 log. *This means that the total prices indicated in our graphs will be severely under what is the reality*. 

A final problem was the issue of Year. Does Year mean fiscal year? Or is it simply just calendar year? This problem did not really impact most of the dataset, except for the crucial years around 2007-2009. If Year means Fiscal Year, then Pond Values would not be predictive of the Great Recession. If Year means calendar year, then it could be argued that pond values may have the power to predict housing market crashes! This is because the meaning of Year would change the position of Quarter 4, which could be either seen as a predictive element or a lagging element in relation to the Great Recession. (US fiscal year starts with Quarter 1 in October).  
Given the absence of information, and given exsisting US government data on average house prices in the US, which *seems* to correlate with our graphs, we have taken Year to mean calendar year in our analysis ([Sales prices of new homes in the US](https://upload.wikimedia.org/wikipedia/en/thumb/b/b8/Median_and_Average_Sales_Prices_of_New_Homes_Sold_in_United_States_1963-2016_annual.svg/1920px-Median_and_Average_Sales_Prices_of_New_Homes_Sold_in_United_States_1963-2016_annual.svg.png)). 


#### Computational Method and Analysis  
The raw dataset contains 7,884 distinct rows of information. Although already in quite good shape, we decided to further clean the data for a few reasons. 

The very first thing we did was to remove three rows with N/A for prices. Pond value is the most important variable in our study, so rows without them were removed. 

Next, we noticed that the data collection for 2016 was incomplete: that final year was missing quarters 3 and 4. Doing a quick group_by and count, we were able to see the distribution of the number of rows per year. As expected, 2016 had an abnormally low number of rows. We therefore completley deleted any rows which contained the year 2016. This left us with a remainder of 7,623 rows of information. 

One other issue we noticed was that the number of rows was slowly ramping up from 2000-2006, and then stabailized after 2007. Is the ramping up indicitive of a larger macro logging industry trend, or is it reflective of the building up of logging industry contacts as this dataset first started (and therefore indicating a lack of information in the first years of data collection)? Without a response from Julie, we do not know. 

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
(Note that the Pond Value in each relationship refers to the aggregate Pond Value for each row in the targeted group_by variable).


### Analysis
The main insight that we got from this dataset is that economic trends have a huge impact on log prices, and this impact is reflected very clearly in the data. Perhaps it can even be said that the log prices may predict economic trends, as we see pond values fall even in 2007, before the Great Recession really kicks down the door. Looking at Figure 1, we can clearly see rising pond values from 2002-2007, and the subsequent nosedive in value during the Great Recession which started in December of 2007. Pond values dropped more than 30% in the span of just 2007-2009. The price nadir of 2009 was lower than anything else we had data on. 

We can also see the tail end of the drop in prices of the decade long Dotcom Bubble. Comparatively speaking, the fall in prices at the end of the Dotcom Bubble in 2000-2002 was much more gentle than the extremely steep fall in prices during the Great Recession. 

Thus, despite the above mentioned problem of lacking a weighted variable to calculate actual number of logs, we were still able to see a very clear trend. We suspect that this is because the Oregon Department of Forestry likely has a policy in place which mandates some sort of equal selection of tree grade cutting, so that no one tree growth is cut in toto. 

Figure 1: 

![yearly pond value aggregate](/assets/TotalPondValuesOverYearsV2.jpeg)

Next, in Figure 2, we can see that the quarterly values are also relatively equal. This accurately reflects the fact that modern logging does not rely on seasonal river conditions to transport massive log rafts downriver to processing plants. Incedentally, this is why most major American cities today are located at mouths or other key points of big rivers: those were the locations most able to effectively accumulate logs before the advent of rail. And even after rail became commonplace, said major cities still retained prominence due to their early start and due to early rail's massive need for water and lumber (not only for fuel, but also for rail ties). (Anyone looking to read about the fascinating history humanity's interaction with trees should look into [Deforesting the Earth](https://press.uchicago.edu/ucp/books/book/chicago/D/bo79171450.html) by Michael Williams).

Figure 2:

![quarters pond values over years](/assets/QuartersOverYearsPondValueV2.jpeg)

Next, in Figure 3, we can see that the logging in each region of Oregon is relatively equal. 

Figure 3: 

![region to pond value](/assets/PondValueByRegionV2.jpeg)

And finally, in Figure 4, we can see why Oregon's official state tree is the Douglas Fir. As the bar plot indicates, the most logged tree, even without unit weighting, is by far the Douglas Fir. Out of the $3,579,925 grand total pond value in our calculation, the Douglas Fir holds the Douglas Fir holds 33.1% of sales! (At $1,183,280). The dataset clearly reflects the natural prevalence of the Douglas Fir in Oregon, but also displays its importance to the local rural logging economy and to the wider construction/real estate business. 

Figure 4: 

![species to pond value](/assets/PondValueBySpeciesV2.jpeg)

### Reflections
One possible direction this data could go would be to expand the current dataset to gain a much longer view of the ups and downs of log market prices. This could go both into the future and into the past, but work would have to be done to adjust prices relative to the current year's level of inflation. It would also be interesting to compare the data against other states' logging information, Federal logging information, and the logging information of other countries. 

Finally, we just want to reiterate that the major problem we encountered was the lack of a proper weighting variable, due to the fact that we could not confirm what "Quotes" actually meant. If Julie ever responds to us, it would be very interesting to see if the graphs change, depending on what "Quotes" mean. It is possible that we got very lucky with our current graphs, as they match our predictions and reflect historical ecnomic swings. However, in the future, it would be best to fully ascertain the meaning and weighting of all variables. 



