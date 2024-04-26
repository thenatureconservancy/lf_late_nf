

## Randy plays with joins




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
