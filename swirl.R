#SWIRL#################################################
install.packages('swirl')
library(swirl)
options(editor = 'internal')
swirl()



#1: Basic Building Blocks--------------------------------------------
#assigning value========================
5+7
x<-5+7 
x

y<-x-3
y

z <- c(1.1,9,3.14)
?c #info about combine values into a vector or list
z
c(z,555,z)
z*2+100

#common arithmetic operators===============================================
#are `+`, `-`, `/`, and `^`  
#to take the square root, use the sqrt() function and 
#to take the absolute value, use the abs() function.
my_sqrt<-sqrt(z-1)
my_sqrt
my_div<-z/my_sqrt
my_div

#recycling method of R=====================================
c(1,2,3,4)+c(0,10) #answer is 1,12,3,14
c(1,2,3,4)+c(0,10,100) #answer is 1,12,103,4



#2: Workspace and Files-------------------------------------
#directory=================

getwd() #current working directory

ls() #view all obkects in local workspace

list.files()#list files in working directory
?list.files
#or
dir()

args() #what arguments a function can take
args(list.files)

#new directory================
old.dir<-getwd() #assign value of current working directory to 'old.dir'
dir.create('testdir') #create a directory in the current working directory 
setwd('testdir') #set working directory to "testdir"
file.create('mytest.R') #create a file in working directory
list.files()
file.exists('mytest.R') #check to see if a file exists
file.info('mytest.R') #access information about the file
file.rename('mytest.R','mytest2.R') #rename file from, to
file.copy('mytest2.R','mytest3.R') #make a copy from, to
file.path('mytest3.R') #provide relative path to the file
file.path('folder1','folder2') #make a platform-independent pathname

#create a directory in the current working directory called "testdir2"
#and a subdirectory for it called "testdir3", all in one command by using
#dir.create() and file.path().
?dir.create
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)
setwd(old.dir)


#3: Sequences of Numbers-----------------------
#sequence======================================
1:20
pi:10
15:1
?`:`

seq(1,20)
seq(0,10,by=0.5) #a vector of numbers ranging from 0 to 10, incremented by 0.5
my_seq<-seq(5,10,length=30) #a sequence of 30 numbers between 5 and 10

#length of a data frame================================
length(my_seq)

1:length(my_seq) #generate sequence from 1 to length of data frame
#or
seq(along.with=my_seq)
#or
seq_along(my_seq)

#loop or replicate===========================================
rep(0,times=40) #replicate of forty 0
rep(c(0,1,2),times=10) #0,1,2,0,1,2,0,1,2,....
rep(c(0,1,2),each=10) #0 x 10, 1 x 10, 2 x 10

#4 Vectors---------------------------------------------------
num_vect<-c(0.5,55,-10,6)

#view specific data=============================
tf<-num_vect<1
tf #T F T F

num_vect>=6

#logical operators=================================
#`==` for exact equality, and `!=` for inequality
#<, >=, >, <=

#character vector==================================
my_char<-c('My','name','is')
my_char
paste(my_char,collapse=' ') #join elements together by a single space
my_name<-c(my_char,'Long')
my_name
paste(my_name, collapse=' ')

paste('Hello','world!', sep=' ')

paste(1:3, c('X', 'Y', 'Z'), sep='') #1X, 2Y, 3Z

paste(LETTERS, 1:4, sep='-') #A-1, B-2, C-3, D-4, E-1


#5: Missing Values----------------------------
#NA = not available or missing
x<-c(44,NA,5,NA)
x*3 #answer is 132, NA, 15, NA

y<-rnorm(1000)


z<-rep(NA,1000)

my_data<-sample(c(y,z),100) #randomly draw 100 sizes from c(y,z)
my_na<-is.na(my_data)
my_na

my_data == NA

sum(my_na)
my_data
0/0
Inf-Inf

#6 Subsetting Vector---------------------------------------
x
#viewing elements===================
x[1:10] #view first 10 elements of x

x[is.na(x)] #view all elements with NA values

y<-x[!is.na(x)] #generate y with all non-NA elements of x
y
y[y > 0] #view all positive elements of y
x[x > 0] #NA also appears
x[!is.na(x) & x>0] #same as y[y > 0] 
x[c(3,5,7)]
x[0] #zeroth element of x; nothing useful
x[3000] #nothing useful

x[c(-2,-10)] #view elements except for 2nd and 10th elements
x[-c(2,10)] #same result as x[c(-2,-10)] 

vect<-c(foo=11,bar=2,norf=NA)
vect

#names of vector===============================
names(vect) #get the names of vect

vect2<-c(11,2,NA)
names(vect2)<-c('foo','bar','norf')

#identical vectors===========================
identical(vect,vect2)

vect['bar'] #give 2nd element of vect
vect[c('foo', 'bar')] #specify a vector of names

#7: Matrices and Data Frames----------------------------------------
#matrices contain single class of data
#dataframes consist of many different classes of data
my_vector<-1:20
my_vector

#dimension of an object======================
dim(my_vector) #NULL since my_vector is a vector, it doesnt have dimension attribute

length(my_vector) #20

#convert vector to matrix=============================
dim(my_vector)<-c(4,5) #give vector a 'dim' (4 rows, 5 columns) attribute
dim(my_vector) #view dim(my_vector)
attributes(my_vector) #show all the atributes for my_vector object
my_vector

class(my_vector) #matrix, array
my_matrix<-my_vector #change name from my_vector to my_matrix

#matrix=========================================================
?matrix
my_matrix2<-matrix(1:20,nrow=4,ncol=5)
identical(my_matrix,my_matrix2)

#add column to matrix==========================================
patients<-c('Bill','Gina','Kelly','Sean') #generate patients vector
cbind(patients,my_matrix) #matrix only contains one class of data
#so R coerce my_matrix from "numbers" to "character"
#implicit coercion

#convert vector and matrix into data frame=======================
my_data<-data.frame(patients,my_matrix)
my_data 
class(my_data) #data.frame

#add names to columns===========================================
cnames<-c('patient','age','weight','bp','rating','test')
colnames(my_data) <-cnames
my_data

#8: Logic--------------------------------------------------------
TRUE==TRUE #T
(F==T)==T #F

(FALSE==TRUE)==FALSE #T
6==7
6<7
10<=10 #T

TRUE!=FALSE
5!=7
!5==7 #! negates logical expressions so that T become F

FALSE&FALSE

TRUE&c(TRUE,FALSE,FALSE) #recycling so T,T,T & T,F,F
TRUE&&c(TRUE,FALSE,FALSE) #left operand is only evaluated with first member of right operand
TRUE|c(TRUE,FALSE,FALSE) #T,T,T
TRUE||c(TRUE,FALSE,FALSE) #non-vectorized version of OR operator -> T onlu

#AND operators are evaluated before OR operators===============================
5 > 8 || 6 != 8 && 4 > 3.9

#evaluates to TRUE=============================
isTRUE(6>4)

identical('twins','twins')

xor(5==6,!FALSE) #5==6 is F, !F is T so xor(F,T) is T

ints<-sample(10) #random sampling of integers from 1 to 10 without replacement
ints

ints>5

#which(), any(), all()==============================================
which(c(TRUE,FALSE,TRUE)) #return indices of vector that are TRUE (indice 1 and 3)

which(ints>7)

#any() returns T if one or more of the elements in the logical vector is T 
#all() returns F if every element in the logical vector is T
any(ints<0) #F
all(ints>0) #T

#9: Functions-------------------------------------------------------------------

Sys.Date() #returns a string representing today's date
mean(c(2,4,5))
#ERROR

#10: lapply and sapply------------------------------------------
head(flags)
dim(flags) #tells us that there are 194 rows and 30 columns
class(flags)

#lapply apply the function to each column and return a list================
#lapply always return a list
cls_list<-lapply(flags,class) #lapply(dataname,function)
cls_list
class(cls_list) #list
as.character(cls_list)

#sapply simplify the result from lapply()==================
cls_vect<-sapply(flags,class)
class(cls_vect) #character vector
sum(flags$orange) #gives the sum of all countries have orange color (1=orange, 0=otherwise)

flag_colors<-flags[,11:17]
head(flag_colors)
lapply(flag_colors,sum) #lapply(dataname,function)
sapply(flag_colors,sum)

sapply(flag_colors,mean)

flag_shapes<-flags[,19:23]
lapply(flag_shapes,range)
shape_mat<-sapply(flag_shapes,range)
shape_mat
class(shape_mat)

#unique() function=========================================
unique(c(3,4,5,5,5,6,6))
unique_vals<-lapply(flags,unique)
unique_vals
sapply(unique_vals,length)
sapply(flags,unique)

lapply(unique_vals,function(elem) elem[2]) #return a list containing
#the second item from each element of the unique_vals list
#note that our function takes one argument, 
#elem, which is just a 'dummy variable' that takes on the value of each element of unique_vals, in turn.

#11: vapply and tapply-----------------------------
#vapply requires you to specify the format of output in advance=================
sapply(flags,unique)
vapply(flags,unique,numeric(1)) #error since unique gives out several unique values in object

sapply(flags,class) #character vector of column classes
vapply(flags,class,character(1)) #identical to sapply()

#vapply() is a safer alternative of sapply()

#tapply split data into groups based on value of some variable, then apply function to each group===========
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate,flags$landmass,mean) #apply mean function to animate for each of six landmass groups

tapply(flags$population,flags$red,summary)
tapply(flags$population,flags$landmass,summary)

#12: Looking at Data--------------------------------------------
ls()

#class() give overall structure of data=======
class(plants)

#dim() give exactly how many rows and columns============
dim(plants)
nrow(plants)
ncol(plants)

object.size(plants)

#names() return character vector of column===========
names(plants)

#head() preview the top 6 of dataset===================
head(plants) 
head(plants,10)

tail(plants)
tail(plants,15)

#summary() summarize the dataset=====================
summary(plants)
#numeric data: summary() give  min, 1st quartile, median, mean, 3rd quartile, and max
#categorical variables: summary() give number of times each value occurs in data

table(plants$Active_Growth_Period)

#str() combines many features of other functions, all in concise and readable format========
str(plants)


#13: Simulation--------------------------------------------
#sample() generate random numbers============
?sample
sample(1:6,4,replace=TRUE) #randomly select 4 numbers between 1 and 6, WITH replacement

sample(1:20,10)

LETTERS
sample(LETTERS)

#unfair sample()=======================
flips<-sample(c(0,1),100,replace=TRUE,prob=c(0.3,0.7))
flips
sum(flips)

#rbinom()=================================
?rbinom
#rbinom for random
#dinom for density
#pbinom for probability
#qbinom for quantile

rbinom(1,size=100,prob=0.7)
flips2<-rbinom(100,size=1,prob=0.7)
flips2
sum(flips2)

#rnom() stimulate random numbers from many other probability distributions======
?rnorm
rnorm(10) #generate 10 random numbers from standard normal distribution
rnorm(10,mean=100,sd=25)
#rpois generate random values from Poisson distribution=======
?rpois
rpois(5,10) #5 values with mean 10
my_pois<-replicate(100, rpois(5, 10))
my_pois
cm<-colMeans(my_pois)
hist(cm)

#14: Dates and Times=======================================
#date=============
d1<-Sys.Date()
class(d1) #confirm d1 is a Date object
unclass(d1) #number of days since 1970-01-01
d1

d2<-as.Date('1969-01-01')
unclass(d2) #number of days before 1970-01-01

#time==================
t1<-Sys.time()
t1
class(t1)
unclass(t1) #the (large) number of seconds since the beginning of 1970.

t2<-as.POSIXlt(Sys.time())
class(t2)
t2
str(unclass(t2))
t2$min

weekdays(d1)
months(t1)
quarters(t2)

#store date and time
strptime()

t3<-'October 17, 1986 08:24'
t4<-strptime(t3, "%B %d, %Y %H:%M")
t4

class(t4)

Sys.time()-t1 #tell how much time has passed since t1
difftime(Sys.time(), t1, units = 'days') #tell how many day has passed since t1

#15: Base Graphics-------------------------------------------
data(cars) #load data of cars
?cars
head(cars) #only two columns

#plot()=====================================
plot(cars) #R assumes one column vs another
?plot

#x-y plane===============================
plot(x=cars$speed,y=cars$dist)
plot(x=cars$dist,y=cars$speed)
plot(x=cars$speed,y=cars$dist,ylab='Stopping Distance')
plot(x=cars$speed,y=cars$dist,xlab='Speed',ylab='Stopping Distance')

#title
plot(cars,main='My Plot')
plot(cars,sub='My Plot Subtitle')

#color
plot(cars,col=2)

#x-limit
plot(cars,xlim=c(10,15))

#shape
?points
plot(cars,pch=2)

#boxplot()=============================
data(mtcars)
?boxplot

boxplot(formula=mpg~cyl,data=mtcars)

#histogram=====================
hist(mtcars$mpg)


#FIRST ASSESSMENT EXERCISES#####################################################

#2: create vector containing 2.23,3.45,1.87,2.11,7.33,18.34,19.23
vect<-c(2.23,3.45,1.87,2.11,7.33,18.34,19.23)
mean(vect)

#3: use loop to determine sigma(i=1 to 25) i^2
x<-1:25
sum(x^2)
#or
sum<-0
for(i in 1:25)
  sum<-sum+i^2
sum

#4: the cars dataset is available in base R. 
#Use the class() to determine what type of object is cars.
class(cars) #data.frame

#5: how many rows does cars object have
nrow(cars)

#6: what is the name of second column of cars
names(cars[2])

#7: extract the columns of a matrix or data.frame is using [].
#For example you can access the second column with cars[,2].
#What is the average distance traveled in this dataset?
dist<-cars[,2]
mean(dist)
#or
mean(cars[,2])

#GETTING STARTED EXERCISES###########################
install.packages("downloader")
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
# download(url, destfile=filename) #not working, reason: permission denied


mice <-read.csv('femaleMiceWeights.csv')

#1: report exact name of column containing weights
head(mice) #inspect first 6 rows
names(mice)[2] #return the name of column 2

#2: extract the entry in 12th row and 2nd column
mice[12,2] #entry in 12th row and 2nd col

#3: use $ to extract weight column and report 11th row
mice$Bodyweight[11] #extract Bodyweight column and report weight of mouse in 11th row

#4: how many mice are included in dataset?
length(mice$Diet) #return number of elements in a vector
#or
length(mice$Bodyweight)

#5: compute average weight of hf diet mice
hf_mice<-mice[13:24,] #generate vector hf_mice
hf_mice
mean(hf_mice$Bodyweight) #calculate mean of Bodyweight of hf_mice
#or
mean(mice$Bodyweight[13:24])

#6: Read the help file for sample() using ?sample. 
#Now take a random sample of size 1 from the numbers 13 to 24 and 
#report back the weight of the mouse represented by that row. 
#Type set.seed(1) to ensure that everybody gets the same answer.

?sample
#sample(x, size, replace = FALSE, prob = NULL)

set.seed(1) #to specify your seed starting value
sample(mice$Bodyweight[13:21],1) 
