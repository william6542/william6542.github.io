---
layout: post
title:  "Books Wrapped 2022"
date:   2022-12-09 1:11:11 -0700
categories: 
---
First posted 2022-12-09

I have a big list of books read. However, this list for the majority of its exsistence was haphazard and not well curated. Its metadata elements were not thought out, and most of it used to be just a title of the book read. Slowly, the documentation got better, I started including the author, the year, the publishing, and so on. Finally, in 2022 Feb, I started doing systematic documentation, with title, year, edition, creator, editors/translators, publisher, and date that I finished reading the book. Although still not incomplete (because I did not include days spent reading, but that's ok because I will just use the time between books as 'days spent reading'), it is a much better system of documentation than the olden days where I just wrote "Odyssey". 

So in the style of Spotify Wrapped, Youtube Rewind, and others, I slowly input a CSV chart with this year's read books. Then, using skills learned from LIS 572, taught by Melanie Walsh, I did some basic data science with R. Here are the results. 

First, the dataset: [2022 Books Rewind Dataset CSV](/assets/BooksReadAllTimeDataset2022.csv)
RStudio: [2022 Books Rewind RStudio](/assets/2022booksrewind.R)

Since the LCSH is very extensive and I didn't want to spend even more time looking for the right fit, I split the 'about' metadata into two main column variables: genre *qua* subject, and genre *qua* form (type). This is for the viewers, because my own inside my head classification scheme may be a bit weird. In any case, I have included my own simplified mental genre scheme as well. 

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

First, let's take a look at the number of books read per month. Figure 1:

![Books read per month](/assets/BRATbooksreadpermonth2022feb2022december.jpeg)

The next figure below shows the number of pages read per month. Figure 2:

![Pages read per month](/assets/BRATpagesreadpermonth2022feb2022december.jpeg)

From Figure 1 and 2 we can see some trends. Let me explain.   
In March, there is a big slowdown in reading. This is due to the fact that the war in Ukraine started in late Feburary, and I spent the majority of my time being anxiety ridden and following the war very closely. During that spring break I also spent a lot of time playing the newly released Elden Ring. A series of anxiety and distraction.   
In May the reading spikes greatly, I think due to the fact that I had mostly finished most of my projects early, due to a special event I had to attend, so I was just coasting. 
Reading is middling during the summer due to some other things I had to do which I didn't want to do. But I was in a muddle and I was lying to myself and others. So being in such a muddle, as Old Man Emerson says to Lucy, one gets nothing done and wallows in self pity and lost time. Still, it wasn't a totally abysmal amount of reading.  
September is when the reading drops again dramatically because I spent most of that month backpacking. It was great. 
October and November spike greatly because my classes for this semester were not only fun, but also lighter on work compared to previous classes. Taking those classes was highly enjoyable. 

The third figure shows the number of books read per Genres-Subjects. Figure 3:

![Books per genre subject](/assets/BRATbooksreadpersubjectgenre2022feb2022dec.jpeg)

The fourth figure shows the number of books read per William's internal simplified classification scheme. Figure 4:

![William's internal classification](/assets/BRATwilliamgenres.jpeg)

As you can see, the vast majority of books read have to do with 'history'. And even some of the 'skill' books, and 'what is to be done' books, have their basis in history or deal with historical situations. For example, it can be said that Herman Khan's "On Thermonuclear War" is as much a 'skill' book on the strategy and tactics of nuclear war, as it is a history on nuclear development and thought. But since it is different enough from most of the other history books, it is classified as a 'skill' book in my mental scheme. 

You will also notice a bunch of comic books near the bottom of the dataset. This is due to the reccomendation of E, who showed me the world of Frank. From Frank, I then looked at the publisher and found Fantagraphic Books, a small, dedicated comic/graphic novel publishing company in Georgetown, South Seattle area. From that company I looked at other titles and started exploring the world of comic books, for lack of a better term. 


