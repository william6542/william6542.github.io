---
layout: post
title:  "Books Rewind Wrapped 2022"
date:   2022-12-09 1:11:11 -0700
categories: 
---
First posted 2022-12-09

I have a big list of books read. However, this list for the majority of its exsistence was haphazard and not well curated. Its metadata elements were not thought out, and most of it used to be just a title of the book read. Slowly, the documentation got better, I started including the author, the year, the publishing, and so on. Finally, in 2022 Feb, I started doing systematic documentation, with title, year, edition, creator, editors/translators, publisher, and date that I finished reading the book. Although still not incomplete (because I did not include days spent reading, but that's ok because I will just use the time between books as 'days spent reading'), it is a much better system of documentation than the olden days where I just wrote "Odyssey". 

So in the style of Spotify Wrapped, Youtube Rewind, and others, I slowly input a CSV chart with this year's read books. Then, using skills learned from LIS 572, taught by Melanie Walsh, I did some basic data science with R. Here are the results. 

First, the dataset: [2022 Books Rewind Dataset](/assets/2022booksrewind.R)

Since the LCSH is very extensive and I didn't want to spend even more time looking for the right fit, I split the 'about' metadata into two main column varaibles: genre *qua* subject, and genre *qua* form. This is for the viewers, because my own inside my head classification scheme may be a bit weird. Still, I have included it as well under William's Genres. 

The number of pages read are gotten from each book's total pages from google books. I tried to find the most accurate edition relative to mine. The page number is obviously not normalized for font size and spacing and book size. That would be impossible. They are simply a reflection of what the physical book says. It is likely that the total pages read should be lessened by 20%, given the fact that many of the books have indexes, title pages, and other miscellenia. 

Pages per day is meant to simply be a general reflection of how fast I read that book. 

### Quick Facts  
Time frame of Dataset: 2022 Feb 08 to 2022 Dec 09   
Total days: 304 days  

Total books read: 51   
Total pages read: 17,949   
Average pages read per day: 59   
Average page count per book: 350  

Shortest book: 124 pages  
Longest book: 1184 pages  

First, let's take a look at the number of books read per month. 

![Books read per month](/assets/BRATbooksreadpermonth2022feb2022december.jpeg)

The next figure below shows the number of pages read per month.

![Pages read per month](/assets/BRATpagesreadpermonth2022feb2022december.jpeg)

The third figure shows the number of books read per Genres-Subjects. 

![Books per genre subject](/assets/BRATbooksreadpersubjectgenre2022feb2022dec.jpeg)


