
# 2022 BOOKS READ William Wrapped
# From 2022 Feb 08 to 2022 Dec 09

brat_raw_df <- read.csv("\\Users\\William Young Wu\\Desktop\\Books Read All Time\\Books Read All Time Dataset.csv", stringsAsFactors = FALSE)

library(dplyr)
library(stringr)
library(tidyverse)
library(ggplot2)
library(plotly)

brat_raw_df %>%  summarize(sum(Pages))

sliced_df_1 <- brat_raw_df[-c(52,53,54,55,56,57,58,59),]

sum(sliced_df_1$Pages)
# 17,949  wow

# 304 days of reading  (2022-02-08 to 2022-12-09)

# Average of 59 pages per day. 

#____________________________________________________________________________________________________________

# how many books from what years? 
years_df_1 <- sliced_df_1 %>% group_by(Year.Made) %>% count()
# this is correct

years_plot<- 
  years_df_1 %>%
  ggplot(aes(y=n, x=Year.Made)) +
  geom_col(aes(y=n, x=Year.Made))+
  labs(x="Year Made", y="Frequency")

years_plot

#____________________________________________________________________________________________________________

# do I read certain genres faster or slower?
genre_speed_df <- sliced_df_1 %>% group_by(William.s.Genres) %>% summarize(sum(Pages.per.Day))

typeof(sliced_df_1$Pages.per.Day)

genre_n <- sliced_df_1 %>% group_by(William.s.Genres) %>% count()

genre_speed_and_n <- rbind(genre_n, genre_speed_df )

#____________________________________________________________________________________________________________

# how many pages do I read per month? 
library(lubridate)
sliced_df_1$month_finished <- month(as.Date(sliced_df_1$Finished.Reading, "%Y-%m-%d"))

sliced_df_1$month_finished <- ymd(sliced_df_1$Finished.Reading)
# this works now. sliced_df_1 now has a just month section

# group by
month_df_1 <- sliced_df_1 %>% group_by(month_finished) %>% summarize(Pages=sum(Pages))

library(viridis)

month_plot<- 
  month_df_1 %>%
  ggplot(aes(y=Pages, x=month_finished)) +
  geom_col(aes(y=Pages, x=month_finished, fill=month_finished), show.legend=FALSE)+
  labs(x="Month", y="Pages Read", title="Pages Read per Month from 2022-02-08 to 2022-12-09") +
  theme(panel.grid.major.x = element_blank() ,)+
  scale_x_continuous(breaks = seq(1, 12, by = 1))+
  scale_fill_viridis(option="turbo") 

month_plot

1701+881+2794+3456+211
  # 1701 881 2794 3456 211   = 9043 pages read from August to early December

#____________________________________________________________________________________________________________

# let's count individual number of books read per month

ind_month_df_1 <- sliced_df_1 %>% group_by(month_finished) %>% count()

ind_month_plot <- 
  ind_month_df_1 %>%
  ggplot(aes(y=n, x=month_finished)) +
  geom_col(aes(y=n, x=month_finished, fill=month_finished), show.legend=FALSE)+
  labs(x="Month",y="Books Read", title="Books Read per Month from 2022-02-08 to 2022-12-09") +
  theme(panel.grid.major.x = element_blank() ,)+
  scale_x_continuous(breaks = seq(1, 12, by = 1))+
  scale_y_continuous(breaks=seq(0,11,by=1))+
  scale_fill_viridis(option="plasma")

ind_month_plot

#________________________________________________________________________________________________________

# let's count subject genres' frequency

subject_genre_df <- sliced_df_1 %>% group_by(Subject.Genre) %>% count()

subject_genre_plot <- subject_genre_df %>%
  ggplot(aes(y=n, x=Subject.Genre)) + 
  geom_col(aes(y=n, x=Subject.Genre, fill=Subject.Genre), show.legend=FALSE)+
  labs(x="Subject Genre", y="Books Read", title="Books Read per Subject Genre from 2022-02-08 to 2022-12-09")+
  theme(panel.grid.major.x = element_blank() ,)+
  scale_y_continuous(breaks=seq(0,18,by=1))

subject_genre_plot

#_________________________________________________________________________________________________________

# average pages of all books
sliced_df_1%>%summarize(grand_total_pages =sum(Pages))

# 17949 / 51.   51 is n books
17949/51
# result is average of about 350 pages per book, rounded down. 

#_________________________________________________________________________________________________________



