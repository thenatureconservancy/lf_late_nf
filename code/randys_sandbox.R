

## Randy plays with joins using fake data -----

df1 <- data.frame(
  bps = c(1, 1, 1, 1, 1),
  scl = c('a', 'b', 'c', 'd', 'e'),
  ref = c(20, 20, 20, 20, 20),
  join = c('1a', '1b', '1c', '1d', '1e')
)

df2 <- data.frame(
  bps = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
  scl = c('a', 'b', 'c', 'e', 'a', 'b', 'c', 'e', 'a', 'b', 'c', 'e'),
  cur = c(10, 20, 30, 40, 10, 20, 30, 40, 10, 20, 30, 40),
  forest = c('h', 'h', 'h', 'h', 'z', 'z', 'z', 'z', 'm', 'm', 'm', 'm'),
  join = c('1a', '1b', '1c', '1e', '1a', '1b', '1c', '1e', '1a', '1b', '1c', '1e')
)


# Create a dataset with all combinations of unique "join" and "forest" values
all_combinations <- expand.grid(join = unique(df1$join), forest = unique(df2$forest))

# Perform a left join to retain all rows from df1 and matching rows from df2
df_merged <- left_join(all_combinations, df2, by = c("join", "forest"))

df_merged <- left_join(df_merged, df1, by = 'join')


## Try with real data

all_combinations_real <- expand.grid(join_field = unique(ref_con_long_wrangled$join_field), forestname = unique(bps_scl_nf_wrangled$forestname))


real_joined <- left_join(all_combinations_real, bps_scl_nf_wrangled, by = c("join_field", "forestname"))

real_joined <- left_join(real_joined, ref_con_long_wrangled, by = 'join_field')
