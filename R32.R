getwd()
df = read.csv('accepted_2007_to_2018Q4.csv')
library(ggplot2)
library(dplyr)

df = df %>% filter(loan_status!='NA')
df = df %>% filter(loan_status!='')
sum(is.na(df$loan_status))

temp1 = df %>% select(loan_status,grade)
temp2 = temp1 %>% group_by(grade,loan_status) %>% tally %>% group_by(grade) %>%
  mutate(value = n/sum(n)) %>% select(-n)
library(plyr)

temp =join(temp1, temp1,
     type = "full")

temp = merge(x = temp1, y = temp2, by = c("grade", "loan_status"), all.x = TRUE)
head(temp)

ggplot(data=temp,aes(x=grade)) +  
geom_bar(aes(fill =loan_status), position = "fill",color='black',width=0.9)+
  scale_y_continuous(labels = scales::percent) +
  #use positions to plot labels
  geom_text(aes(label = paste0(100*value,"%")  ,y=value),size = 3)
