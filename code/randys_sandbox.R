

## Randy plays with joins

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






library(zoo)


  

ref_con_scls <- full_join(ref_con_long_wrangled, scls_descriptions_wrangled, by ='join_field')

ref_con_scls <- ref_con_scls %>%
  select(-c(model_code.x,
            model_code.y,
            ref_label
            ))

## remove any extra stuff from bps_scl_nf_wrangled

bps_scl_nf_wrangled_minimal <- bps_scl_nf_wrangled %>%
  select(-c(oid,
            value,
            lc20_bps_220,
            forests_r,
            lc22_s_cla_230,
            bps_code,
            bps_model))

complete_bps_ref_cur_scl <- full_join(bps_scl_nf_wrangled_minimal, ref_con_scls, by = 'join_field')
