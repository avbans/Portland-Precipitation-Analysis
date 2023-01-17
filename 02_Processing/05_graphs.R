
plot(rain$day,rain$total_in)
hist(rain$total_in,
     xlim = c(0,1))
hist(log(rain$total_in))
