library(cmdcR)

cl <- client()


# Single dataset all
cl %>% mobility_devices() %>% fetch()


# Single dataset filter on deaths
cl %>% covid(fips="<100", variable="deaths_total", value=">100") %>% fetch()


# Single dataset single states with all counties
cl %>% mobility_devices(state="48") %>% fetch()
# cl %>% mobility_devices(state=as.integer(48)) %>% fetch()


# Single dataset multiple states with all counties
cl %>% mobility_devices(state=c("CA", "TX")) %>% fetch()


# Single dataset variable select
cl %>% demographics(variable=c(
    "Total population", "Fraction of population over 65", "Median age"
)) %>% fetch()


# Multiple datasets all data
cl %>% demographics() %>% covid() %>% fetch()


# Multiple datasets states only
cl %>% demographics() %>% covid(fips="<100") %>% fetch()


# Multiple datasets counties only
cl %>% demographics() %>% covid(fips=">1000") %>% fetch()
