HW5 - Make Data Move
================
Hanna Matera
05/10/2020

Explore the recent global developments with R
=============================================

Today, you will load a filtered gapminder dataset - with a subset of data on global development from 1952 - 2007 in increments of 5 years - to capture the period between the Second World War and the Global Financial Crisis.

**Your task: Explore the data and visualise it in both static and animated ways, providing answers and solutions to 7 questions/tasks below.**

Get the necessary packages
--------------------------

First, start with installing the relevant packages 'tidyverse', 'gganimate', and 'gapminder'.

    ## -- Attaching packages ------------------------------------------------------------------------ tidyverse 1.2.1 --

    ## v ggplot2 3.2.1     v purrr   0.3.2
    ## v tibble  2.1.3     v dplyr   0.8.3
    ## v tidyr   1.0.0     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## Warning: package 'ggplot2' was built under R version 3.5.2

    ## Warning: package 'tibble' was built under R version 3.5.2

    ## Warning: package 'tidyr' was built under R version 3.5.2

    ## Warning: package 'purrr' was built under R version 3.5.2

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## Warning: package 'stringr' was built under R version 3.5.2

    ## Warning: package 'forcats' was built under R version 3.5.2

    ## -- Conflicts --------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

    ## Warning: package 'gganimate' was built under R version 3.5.2

Look at the data
----------------

First, see which specific years are actually represented in the dataset and what variables are being recorded for each country. Note that when you run the cell below, Rmarkdown will give you two results - one for each line - that you can flip between.

``` r
unique(gapminder$year)  # years from '52 until '07 
```

    ##  [1] 1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 2002 2007

``` r
head(gapminder)
```

    ## # A tibble: 6 x 6
    ##   country     continent  year lifeExp      pop gdpPercap
    ##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ## 1 Afghanistan Asia       1952    28.8  8425333      779.
    ## 2 Afghanistan Asia       1957    30.3  9240934      821.
    ## 3 Afghanistan Asia       1962    32.0 10267083      853.
    ## 4 Afghanistan Asia       1967    34.0 11537966      836.
    ## 5 Afghanistan Asia       1972    36.1 13079460      740.
    ## 6 Afghanistan Asia       1977    38.4 14880372      786.

``` r
levels(gapminder$country)  #inspecting all the countries included in the data frame
```

    ##   [1] "Afghanistan"              "Albania"                 
    ##   [3] "Algeria"                  "Angola"                  
    ##   [5] "Argentina"                "Australia"               
    ##   [7] "Austria"                  "Bahrain"                 
    ##   [9] "Bangladesh"               "Belgium"                 
    ##  [11] "Benin"                    "Bolivia"                 
    ##  [13] "Bosnia and Herzegovina"   "Botswana"                
    ##  [15] "Brazil"                   "Bulgaria"                
    ##  [17] "Burkina Faso"             "Burundi"                 
    ##  [19] "Cambodia"                 "Cameroon"                
    ##  [21] "Canada"                   "Central African Republic"
    ##  [23] "Chad"                     "Chile"                   
    ##  [25] "China"                    "Colombia"                
    ##  [27] "Comoros"                  "Congo, Dem. Rep."        
    ##  [29] "Congo, Rep."              "Costa Rica"              
    ##  [31] "Cote d'Ivoire"            "Croatia"                 
    ##  [33] "Cuba"                     "Czech Republic"          
    ##  [35] "Denmark"                  "Djibouti"                
    ##  [37] "Dominican Republic"       "Ecuador"                 
    ##  [39] "Egypt"                    "El Salvador"             
    ##  [41] "Equatorial Guinea"        "Eritrea"                 
    ##  [43] "Ethiopia"                 "Finland"                 
    ##  [45] "France"                   "Gabon"                   
    ##  [47] "Gambia"                   "Germany"                 
    ##  [49] "Ghana"                    "Greece"                  
    ##  [51] "Guatemala"                "Guinea"                  
    ##  [53] "Guinea-Bissau"            "Haiti"                   
    ##  [55] "Honduras"                 "Hong Kong, China"        
    ##  [57] "Hungary"                  "Iceland"                 
    ##  [59] "India"                    "Indonesia"               
    ##  [61] "Iran"                     "Iraq"                    
    ##  [63] "Ireland"                  "Israel"                  
    ##  [65] "Italy"                    "Jamaica"                 
    ##  [67] "Japan"                    "Jordan"                  
    ##  [69] "Kenya"                    "Korea, Dem. Rep."        
    ##  [71] "Korea, Rep."              "Kuwait"                  
    ##  [73] "Lebanon"                  "Lesotho"                 
    ##  [75] "Liberia"                  "Libya"                   
    ##  [77] "Madagascar"               "Malawi"                  
    ##  [79] "Malaysia"                 "Mali"                    
    ##  [81] "Mauritania"               "Mauritius"               
    ##  [83] "Mexico"                   "Mongolia"                
    ##  [85] "Montenegro"               "Morocco"                 
    ##  [87] "Mozambique"               "Myanmar"                 
    ##  [89] "Namibia"                  "Nepal"                   
    ##  [91] "Netherlands"              "New Zealand"             
    ##  [93] "Nicaragua"                "Niger"                   
    ##  [95] "Nigeria"                  "Norway"                  
    ##  [97] "Oman"                     "Pakistan"                
    ##  [99] "Panama"                   "Paraguay"                
    ## [101] "Peru"                     "Philippines"             
    ## [103] "Poland"                   "Portugal"                
    ## [105] "Puerto Rico"              "Reunion"                 
    ## [107] "Romania"                  "Rwanda"                  
    ## [109] "Sao Tome and Principe"    "Saudi Arabia"            
    ## [111] "Senegal"                  "Serbia"                  
    ## [113] "Sierra Leone"             "Singapore"               
    ## [115] "Slovak Republic"          "Slovenia"                
    ## [117] "Somalia"                  "South Africa"            
    ## [119] "Spain"                    "Sri Lanka"               
    ## [121] "Sudan"                    "Swaziland"               
    ## [123] "Sweden"                   "Switzerland"             
    ## [125] "Syria"                    "Taiwan"                  
    ## [127] "Tanzania"                 "Thailand"                
    ## [129] "Togo"                     "Trinidad and Tobago"     
    ## [131] "Tunisia"                  "Turkey"                  
    ## [133] "Uganda"                   "United Kingdom"          
    ## [135] "United States"            "Uruguay"                 
    ## [137] "Venezuela"                "Vietnam"                 
    ## [139] "West Bank and Gaza"       "Yemen, Rep."             
    ## [141] "Zambia"                   "Zimbabwe"

``` r
colnames(gapminder)
```

    ## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"

The dataset contains information on each country in the sampled year, its continent, life expectancy, population, and GDP per capita.

Let's plot all the countries in 1952.

``` r
theme_set(theme_bw())  # set theme to white background for better visibility

ggplot(subset(gapminder, year == 1952), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  geom_text(aes(label=country))+  ##adding countries names
  scale_x_log10()
```

![](W5_MakeItMove_files/figure-markdown_github/1957-1.png)

``` r
gapminder %>% 
  filter(year == 1952) %>%
  arrange(desc(gdpPercap))
```

    ## # A tibble: 142 x 6
    ##    country        continent  year lifeExp       pop gdpPercap
    ##    <fct>          <fct>     <int>   <dbl>     <int>     <dbl>
    ##  1 Kuwait         Asia       1952    55.6    160000   108382.
    ##  2 Switzerland    Europe     1952    69.6   4815000    14734.
    ##  3 United States  Americas   1952    68.4 157553000    13990.
    ##  4 Canada         Americas   1952    68.8  14785584    11367.
    ##  5 New Zealand    Oceania    1952    69.4   1994794    10557.
    ##  6 Norway         Europe     1952    72.7   3327728    10095.
    ##  7 Australia      Oceania    1952    69.1   8691212    10040.
    ##  8 United Kingdom Europe     1952    69.2  50430000     9980.
    ##  9 Bahrain        Asia       1952    50.9    120447     9867.
    ## 10 Denmark        Europe     1952    70.8   4334000     9692.
    ## # ... with 132 more rows

We see an interesting spread with an outlier to the right. Answer the following questions, please:

Q1. Why does it make sense to have a log10 scale on x axis?

First of all, because placing gdp per capita on a x-axis makes the graph readable. The reason for using the log scale is that it can help to visualize between large descrepancies of values on a single axis.

Q2. What country is the richest in 1952 (far right on x axis)? Kuwait is the richest country with 108.382 gdp per capita

You can generate a similar plot for 2007 and compare the differences

``` r
vis <- ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, size = pop,color=continent)) +
  geom_point() +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12))+
  geom_text(aes(label=country))+
  scale_x_log10() +
  labs(title="2007",
        x ="GDP per capita", y = "Life Expectancy")
vis
```

![](W5_MakeItMove_files/figure-markdown_github/2007-1.png)

``` r
#richest countries in 2007: I amsubsetting the data so that I only am looking at the year 2007. I am using a desc() function to look at the countries gdp/pc in a descending order. Running head(5) snippet results in only 5 countries being printed.


gapminder %>% 
  filter(year == 2007) %>%
  arrange(desc(gdpPercap)) %>% 
  head(5)
```

    ## # A tibble: 5 x 6
    ##   country       continent  year lifeExp       pop gdpPercap
    ##   <fct>         <fct>     <int>   <dbl>     <int>     <dbl>
    ## 1 Norway        Europe     2007    80.2   4627926    49357.
    ## 2 Kuwait        Asia       2007    77.6   2505559    47307.
    ## 3 Singapore     Asia       2007    80.0   4553009    47143.
    ## 4 United States Americas   2007    78.2 301139947    42952.
    ## 5 Ireland       Europe     2007    78.9   4109086    40676.

The black bubbles are a bit hard to read, the comparison would be easier with a bit more visual differentiation.

Q3. Can you differentiate the continents by color and fix the axis labels?

BY adding the following:

1.  color=continent in the aesthetics I can color-code all continents

b)labs(title="2007",x ="GDP per capita", y = "Life Expectancy") as a separate formula, I can rename the axes

Q4. What are the five richest countries in the world in 2007?

The five richest countries in 2007 are: Kuwait, Norway, Singapore, United States and Ireland

Make it move!
-------------

The comparison would be easier if we had the two graphs together, animated. We have a lovely tool in R to do this: the `gganimate` package. And there are two ways of animating the gapminder ggplot.

### Option 1: Animate using transition\_states()

The first step is to create the object-to-be-animated

``` r
anim <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop,color=continent))+
  geom_point() +
  labs(title = "Gapminder: animated plot",
       x = 'GDP per capita',
       y = 'Life expectancy',
       size = 'Population',
       color = 'Continent')
anim
```

![](W5_MakeItMove_files/figure-markdown_github/anim1%20start-1.png)

This plot collates all the points across time. The next step is to split it into years and animate it. This may take some time, depending on the processing power of your computer (and other things you are asking it to do). Beware that the animation might appear in the 'Viewer' pane, not in this rmd preview. You need to knit the document to get the viz inside an html file.

``` r
anim + transition_states(year, 
                      transition_length = 1,
                      state_length = 1)
```

![](W5_MakeItMove_files/figure-markdown_github/anim1-1.gif) Notice how the animation moves jerkily, 'jumping' from one year to the next 12 times in total. This is a bit clunky, which is why it's good we have another option.

### Option 2 Animate using transition\_time()

This option smoothes the transition between different 'frames', because it interpolates and adds transitional years where there are gaps in the timeseries data.

``` r
anim2 <- anim +transition_time(year)
anim2
```

![](W5_MakeItMove_files/figure-markdown_github/anim2-1.gif)

The much smoother movement in Option 2 will be much more noticeable if you add a title to the chart, that will page through the years corresponding to each frame.

Q5 Can you add a title to one or both of the animations above that will change in sync with the animation? \[hint: search labeling for transition\_states() and transition\_time() functions respectively\]

``` r
anim3 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() +
  scale_x_log10() +  # convert x to log scale
  labs(title = "Year: {frame_time}", #lab that changes every time step 
       x = 'GDP per capita',
       y = 'Life expectancy',
       size = 'Population') +
  transition_time(year) 
anim3
```

![](W5_MakeItMove_files/figure-markdown_github/anim3-1.gif) Q6 Can you made the axes' labels and units more readable? Consider expanding the abreviated lables as well as the scientific notation in the legend and x axis to whole numbers.\[hint:search disabling scientific notation\]

``` r
library(ggplot2,scales)

#making the axes and labels comprehensible 
anim2 + 
  scale_size_continuous(label = scales::comma) + #Scales the population size (full numbers)
  scale_x_log10(labels = scales::comma) #Scales the GDP per capita values on the x-axis to full numbers
```

![](W5_MakeItMove_files/figure-markdown_github/unnamed-chunk-2-1.gif)

Q7 Come up with a question you want to answer using the gapminder data and write it down. Then, create a data visualisation that answers the question and explain how your visualization answers the question. (Example: you wish to see what was mean life expectancy across the continents in the year you were born versus your parents' birth years). \[hint: if you wish to have more data than is in the filtered gapminder, you can load either the `gapminder_unfiltered` dataset and download more at <https://www.gapminder.org/data/> \]

``` r
#Question : Does child mortality in Europe decrease over time? Is it correlated with the GDP per capita rise?

gapminder2 <- gapminder_unfiltered
mort <- read.csv("child_mortality_0_5_year_olds_dying_per_1000_born.csv")

#long format data frame
library(reshape2)
```

    ## 
    ## Attaching package: 'reshape2'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     smiths

``` r
new <- melt(mort, measure.vars = 2:302,variable.name="year", value.name="mortality")
#subtracting X from the year column
new$year <- substr(new[["year"]], 2, 5)

#merged data frame
merged <- merge(gapminder2, new, by = c("country", "year"))
eur <- subset(merged, continent=="Europe")

anim_mort <-  ggplot(eur, aes(gdpPercap, mortality, size = pop, color = country)) +
  geom_point() +
  geom_text(aes(label=country))+
  scale_size_continuous(label=scales::comma) +
  scale_x_log10(labels = scales::comma) +  # convert x to log scale
  scale_y_log10(labels = scales::comma) +  
  labs(title = "Child mortality in Europe over time",
       x = 'GDP per capita',
       y = 'child mortality (per 1000 births)',
       size = 'Population',
       caption = 'Data source: www.gapminder.org/data/')+
  transition_time(year) +
  labs(subtitle = "Year: {frame_time}")
anim_mort
```

![](W5_MakeItMove_files/figure-markdown_github/unnamed-chunk-3-1.gif)
