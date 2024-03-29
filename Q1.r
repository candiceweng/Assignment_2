#Now have finished Q1
getwd()
setwd("E:/EBAC 2019/Modules/Management of Business Analytics Project/Data Analytics Process and Best Practices/Day2/Day 2 Assignment")

#member.data <- read_xlsx("DABP_D2_Assignment_Data.xlsx", sheet = "MemberData")

#session.data <- read_xlsx("DABP_D2_Assignment_Data.xlsx", sheet = "SessionData") 

member.data <- read.csv("Member Data.csv",check.names = F)

session.data <- read.csv("Session Data.csv", check.names = F)

head(session.data)
head(member.data,6)

mean.height.male <- member.data %>%
  group_by(Gender) %>%
  summarise_if(is.numeric,mean,na.rm = T)

mean.height.male[,c("Gender","Height","Weight")]


ggplot(member.data,aes(as.factor(Gender),Height))+geom_boxplot()

# 1/4 - 3/4 value for Female is between 150 - 160 
# 1/4 - 3/4 value for Male is between 165 - 177

ggplot(member.data,aes(as.factor(Gender),Weight))+geom_boxplot()
# 1/4 - 3/4 value for Female is between 50 - 70
# 1/4 - 3/4 value for Male is between 60 - 88

# Check for missing value
member.data[member.data$Gender=='' & member.data$Height>150 & member.data$Height < 160,"Gender"] <- "F"

member.data[member.data$Gender=='',]

member.data[member.data$Gender == '' & member.data$Height > 165 ,"Gender"] <- "M"

colMeans(is.na(member.data))

install.packages("UsingR")

ggplot()+
  geom_point(data=member.data[member.data$Gender == 'M',],aes(x=Height,y=Weight))

ggplot()+
  geom_point(data=member.data[member.data$Gender == 'F',],aes(x=Height,y=Weight))+
  lm(formula = member.data$Height ~ member.data$Weight)


# Fill in missing Height and Weight fot Male 
member.data.male <- member.data[member.data$Gender == 'M',]

?or
# Find Male missing Height
member.data.male[is.na(member.data.male$Height),]
# Height Missing data number is 5,23,77,120 
member.data.male[member.data.male$MemberMobilePhone == "91313168" | member.data.male$MemberMobilePhone =="98236331" |member.data.male$MemberMobilePhone =="81251893"|member.data.male$MemberMobilePhone =="95615638",]
# Find relationship between height and weight 
lm(formula = member.data.male$Height ~ member.data.male$Weight)
# height = 158.6297 + 0.1734*weight 
<<<<<<< HEAD

# Fill in missing height
member.data.male[is.na(member.data.male$Height) & member.data.male$Gender == 'M','Height'] <- round(0.1734*member.data.male[is.na(member.data.male$Height) & member.data.male$Gender == 'M','Weight']+158.6297)

=======

# Fill in missing height
member.data.male[is.na(member.data.male$Height) & member.data.male$Gender == 'M','Height'] <- round(0.1734*member.data.male[is.na(member.data.male$Height) & member.data.male$Gender == 'M','Weight']+158.6297)

>>>>>>> a1d255c253a100a94fba1de1c68423f351825c01
# Find Male missing Weight
member.data.male[is.na(member.data.male$Weight),]
# missing data number is 8, 105, 119
member.data.male[member.data.male$MemberMobilePhone == "89316894" | member.data.male$MemberMobilePhone =="94159051" |member.data.male$MemberMobilePhone =="99088488",]
# Find relationship between weight and height
lm(formula = member.data.male$Weight ~ member.data.male$Height)
# Weight = 0.8776*Height - 77.2241

# Fill in missing value 
member.data.male[is.na(member.data.male$Weight) & member.data.male$Gender == 'M','Weight'] <- round(member.data[is.na(member.data$Weight) & member.data$Gender == 'M','Height']*0.8776 - 77.2241)
<<<<<<< HEAD


#Reference Table (Location SessionDate SessionTime SessionType FitnessChampion)
sketch <- session.data[!is.na(session.data$FitnessChampion),-6] %>%  #drop MobilePhone
  arrange(Location, SessionDate, SessionTime, SessionType)
reference <- unique(sketch)

#Merge Reference Table with session.data(without FitnessChampion)
final<-merge(reference, session.data[,-5], by=c("Location", "SessionDate","SessionTime","SessionType"))
final
=======
>>>>>>> a1d255c253a100a94fba1de1c68423f351825c01
