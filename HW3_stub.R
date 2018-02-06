##########   Homework 3   Due Thursday by 5pm
##
## Read the motivation and Follow the instructions in HW3.pdf
##
## Start by debugging the following stub  fill in the rest. 
## Name your script HW3_myinitials.R
## make sure it runs from source without error or warnings - Test it after shutting down R
## Write clean code without unnecessary clutter.
## Submit it on Github or by email with subject line "710 Homework 3"

## Read in budget data
dat <- read.csv("budget.csv")
names(dat) <- c("date", "description", "amount")


###########################
# 1 - Expenditures summary 
#
total <- sum(data$amount)
#  [1] 360.79

bydate <- aggregate(dat$amount, by=list(dat$date), sum)
total_weekday <- sum(bydate[1:4, 2])
total_weekend <- sum(bydate[5:7])

#  The Total Expenduture is ... the weekday expenditure is ... the weekend is ... 

###########################
# 2 - Expenditures by date and category
#
aggregate(dat$amount, ...    # This shows... 

###########################
# 3 - report by date 
#
bydate.sum <- aggregate(dat$amount, by=list(dat$date), sum) # total by date
bydate.mean <- aggregate(dat$amount, by=list(dat$date), mean) # average by date
bydate.max <- aggregate(amount, by=list(date), max)  # max by date
names(bydate.sum) <- c("date", "total")
names(bydate.mean) <- c("date", "mean")

report.bydate <- merge( bydate.sum, bydate.mean, by="date")
report.bydate <- merge( bydate.sum, bydate.max, by="date") # complete report by date
# Check report.bydate

###########################
# ... Insert more code here


###########################
# 9 - plots illustrating problems
#
	# this plot shows expenditures by day
pdf(file="spendingbyday.pdf")
  barplot(report.bydate$total, names.arg=report.bydate$date)  
  abline(h=10, col="red", lty=2, lwd=3)  # budget is $10/day for everything
dev.off()

###########################
# 10 - save output
#
write.csv(report.bydate, file="report.bydate.csv")

