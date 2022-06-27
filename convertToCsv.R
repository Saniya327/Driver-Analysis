require(RMySQL)

m <- MySQL()
con < -dbConnect(m, dbname = "car_data", host = "18.221.8.243", user = "root", pass = "root")
tables < -dbListTables(con)
 
for (i in 1 : length(tables)){
	temp <- (dbReadTable(con, tables[i]))
	write.table(temp, tables[i], row.names = TRUE)
}