#Esercizi 2 q 1

q1 = c(200, 70, 88, 130, 175, 89, 95, 120, 400, 55)
range = max(q1)-min(q1)
xbar = sum(q1)/length(q1)
xbar
dq1 = q1 - xbar #deviations

out = cbind(q1,dq1)

sd(q1)


#e2 q2

x = c(35, 32, 16, 66,22,46,32)
xbar = mean(x)
dxi = x - xbar
out = round(cbind(x, dxi, dxi^2),2)
colSums(ou
sqrt(1627.73/6)


#e2 q3
x = c( 57, 35, 61, 64, 90, 78, 60, 53, 55, 57, 71, 30)
xsorted = sort(x)
xsorted
median(x)
