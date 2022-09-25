

library(tidyverse)
library(tidytext)




# BOOK 1 ------------------------------------------------------------------


# MUST LOAD BE ITSELF !
# load("./philosophers_stone.rda")

# THEN GET THE TEXT
philosophers_stone


chapters = c("THE BOY WHO LIVED",
             "THE VANISHING GLASS",
             "THE LETTERS FROM NO ONE",
             "THE KEEPER OF THE KEYS",
             "DRAGON ALLEY",
             "THE JOURNEY FROM PLAFORM NINE AND THREE-QUARTERS",
             "THE SORTING HAT",
             "THE POTIONS MASTER",
             "THE MIDNIGHT DUEL",
             "HALLOWEEN",
             "QUIDDITCH",
             "THE MIRROW OF ERUSED",
             "NICOLAS FLAMEL",
             "NORBERT THE NORWEGIAN RIDGEBACK",
             "THE FORBIDDEN FOREST",
             "THROUGH THE TRAPDOOR",
             "THE MAN WITH TWO FACES"
)


hp_df = tibble( chapters = chapters, text = philosophers_stone)

head(hp_df)


write_csv2(hp_df, file = "philosophers_stone.csv",col_names = T)

hp_ps = read_csv("philosophers_stone.csv",col_names = c(chapters, text))
head(hp_ps)


# https://en.wikibooks.org/wiki/Muggles%27_Guide_to_Harry_Potter/Contents




# BOOK 2 ------------------------------------------------------------------


# Chamber of Secrets
chamber_chapters = c("The Worst Birthday","Dobby's Warning","The Burrow","At Flourish and Blotts",
                     "The Whomping Willow","Gilderoy Lockhart","Mudbloods and Murmurs",
                     "The Deathday Party","The Writing on the Wall","The Rogue Bludger",
                     "The Dueling Club","The Polyjuice Potion","The Very Secret Diary",
                     "Cornelius Fudge","Aragog","The Chamber of Secrets","The Heir of Slytherin",
                     "Dobby's Reward")


# load("chamber_of_secrets.rda")

chamber_of_secrets

hp_df2 = tibble( text = chamber_of_secrets)
# 
head(hp_df2)


write_csv2(hp_df2, file = "chamber_of_secrets.csv")

hp_df2 = read_csv("chamber_of_secrets.csv")
head(hp_df2)



# BOOK 3 ------------------------------------------------------------------

# load("prisoner_of_azkaban.rda")

prisoner_of_azkaban

df3 = tibble( text= prisoner_of_azkaban)

# edit in VS code
write_csv2(df3, file = "prisoner_of_azkaban.csv") 

hp_df3 = read_csv("prisoner_of_azkaban.csv")
head(hp_df3)



# book 4 ------------------------------------------------------------------

# load("goblet_of_fire.rda")

goblet_of_fire

df4 = tibble( text= goblet_of_fire)
write_csv2(df4, file = "goblet_of_fire.csv")

hp_df4 = read_csv("goblet_of_fire.csv")
head(hp_df4)






# book 5 ------------------------------------------------------------------

load("order_of_the_phoenix.rda")

df5 = tibble( text= order_of_the_phoenix)

# edit in VS code
write_csv2(df5, file = "order_of_the_phoenix.csv") 


hp_df5 = read_csv("order_of_the_phoenix.csv")
head(hp_df5)



# book 6 ------------------------------------------------------------------

load("half_blood_prince.rda")

df6 = tibble( text= half_blood_prince )

write_csv2(df6, file = "half_blood_prince.csv")


hp_df6 = read_csv("half_blood_prince.csv")
head(hp_df6)



# BOOK 7 ------------------------------------------------------------------


load("deathly_hallows.rda")

df7 = tibble( text= deathly_hallows )

write_csv2(df7, file = "deathly_hallows.csv")

hp_df7 = read_csv2("" )
head(hp_df7)

# FIX THE CHAPTERS, TEXT !

hp_df7 = readxl::read_xlsx("harrypotter_deathlyhallows.xlsx")
head(hp_df7)

write_csv2(hp_df7, file ="deathlyhallows-1.csv" )

df7 = read_csv2("deathlyhallows-1.csv")
head(df7)

df7 %>% 
  mutate(chapter = str_remove_all(chapter,"[:punct:]"),
         text =  str_remove_all(text,"[:punct:]")
         )

write_csv2(df7, file = "deathly_hallows.csv")


# read in text file from gutenberg
# clean data - drop header and footer section, drop na
# cleaned_txt 
# devtools::use_data( cleaned_txt, overwrite= TRUE )

# hp_books = function(){
#   books = list(
#     "Philosopher's Stone" = harrypotterbook::philosopher_stone,
#     "Chamber of Secrets" = harrypotterbook::chamber_of_secrets,
#     "Prisoner of Azkaban" = harrypotterbook::prisoner_of_azkaban,
#     "Goblet of Fire" = harrypotterbook::goblet_of_fire,
#     "Order of the Phoenix" = harrypotterbook::order_of_phoenix,
#     "Half-Blood Prince" = harrypotterbook::halfblood_prince,
#     "Deathly Hallows" = harrypotterbook::deathly_hallows
#   )
#   ret = data.frame(text = unlist(books, use.names = FALSE),
#                    stringsAsFactors = FALSE)
#   
#   ret$book = factor(rep(names(books), sapply(books, length)))
#   ret$book = factor(ret$book, levels = unique(ret$book))
#   structure(ret, class = c("tbl_df", "tbl", "data.frame"))
# }
# 


