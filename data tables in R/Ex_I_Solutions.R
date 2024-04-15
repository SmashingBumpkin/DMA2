#1:
library(data.table)
library(AER)

data("Fertility")
dt <- data.table(Fertility)

#2:
print(dt[35:50, .(age,work)])

#3:
print(dt[nrow(dt)])
#== dt[.N]

#4:
nrow(dt[morekids=="yes"])
dt[morekids=="yes", .N]

#5:
nrow(dt[gender1=="male" & gender2=="female"])
nrow(dt[gender1=="female" & gender2=="female"])
nrow(dt[gender1=="male" & gender2=="male"])
dt[gender1=="female" & gender2=="male",.N]
#ororrrrrrrr
dt[,.N,by = .(gender1, gender2)]

#6:
less4 = dt[work<4 , .N , by = .(afam,hispanic, other)]
greater4=dt[,.N,by = .(afam,hispanic, other)]

cbind(less4,less4[,N]/greater4[,N])
#prof:
dt[, mean(work <= 4), by = .(afam, hispanic, other)]

#7:
dt[age %between% c(22,24),mean(gender1=="male")]

#8:
dt[,age_squared := age**2]
dt

#9:
dt[, .(average_first_male = mean(gender1=="male"),total_first_m = .N),
   by = .(afam, hispanic, other)][order(average_first_male)]

dt[, .(.N, prop_m = mean(gender1 == "male")),
          by = .(afam, hispanic, other)]

dt
#10:
dt[,.(total = sum(morekids=="yes"),mean = mean(morekids=="yes")) ,by = .(gender1, gender2)]
