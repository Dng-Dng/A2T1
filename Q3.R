# import relevant libraries 
library(ggplot2)
library(dplyr)
library(tidyverse)

# store data into their respective variables accordingly
country <- c('Germany', 'Australia', 'South Korea', 'China', 'USA')
population <- c(83783942, 25499884, 51269185, 1439323776, 331002651)
deaths <- c(6330, 89, 246, 4633, 59438)

# create the tibble dataframe using the data variables created above and store into Covid variable
Covid <- tibble(country, population, deaths)

# Using the original data from the Covid table, create two new columns within the Covid table labelled death_rate and Deaths. This is done through the mutate function which takes data as inputs (population and deaths) and outputs and modified value.  
Covid <- Covid %>% mutate(death_rate = deaths/population)
Covid <- Covid %>% mutate(Deaths = death_rate*100000)

# From the Covid dataframe we want to plot the Deaths metric computed above. The below code achieves this by producing a horizontal barplot using the ggplot function and stores the output into covid_deathChart variable.
                                      #sets data as convid, declare x and y axis reorders the x-axis in descending order
covid_deathChart <- ggplot(data=Covid, aes(x = reorder(country, Deaths), y = Deaths)) +
                    # add labels to axis
	      labs(x = "country", y = "death rate") +
                    # geom_bar tells ggplot to plot a bar graph. Stat="identity" tells ggplot that y-values will be 		      explicity declared and fill sets the colours of the bar
	     geom_bar(stat="identity", fill = "dodgerblue") +
        # adjust x axis tick label
        scale_y_continuous(breaks = seq(0, 20, by = 2)) +
        # turn vertical bar plot into horizontal 
        coord_flip() +
        # generate titles and subtitles for plots
        ggtitle(label = "Death Efficiency", 
                subtitle = "Covid-19 deaths per 100,000 population
                                           \nSelected Countries, to April 30th 2020")
      
covid_deathChart


