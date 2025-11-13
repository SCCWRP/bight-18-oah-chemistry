# seacarb helpers ####
calc_carb_bottle <- function(ph, ta, sal, t, pres) {
  if (is.na(ph) | is.na(ta)) {
    return(data.frame(OmegaAragonite = NA_real_, DIC = NA_real_))
  }
  seacarb::carb(
    flag = 8, var1 = ph, var2 = ta,
    S = sal, `T` = t, P = pres,
    k1k2 = "x", kf = "x", ks = "d", pHscale = "T"
  )[, c("OmegaAragonite", "DIC")]
}

calc_ph_insitu <- function(pH, pHQACode, TA, temp, temp_lab, pres, sal) {
  if (pHQACode != "1") { # doesn't pass QA
    return(NA_real_)
  }
  seacarb::pHinsi(
    pH = pH, ALK = TA, Tinsi = temp, Tlab = temp_lab, Pinsi = pres, S = sal,
    k1k2 = "x", kf = "x", ks = "d", pHscale = "T"
  )
}
