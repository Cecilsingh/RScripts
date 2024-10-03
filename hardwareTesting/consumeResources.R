#Create dataframe
df <- data.frame(
    x = c(1:1000000),
    y = c(1:1000000)
)

for (i in c(1:500)) {
    print(i)
    fit <- lm(x ~ y, df)
}
