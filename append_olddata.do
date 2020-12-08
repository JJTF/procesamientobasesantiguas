
clear all
cd "D:\"
import excel using "Bancario, Financiero y Seguros I.xlsx", first clear sheet("Banca (RV)")
/*Renombrar el nombre de las variables con el nombre de la etiqueta(esto porque al importar el excel solo se pudo jalar las primeras filas como etiquetas y no se porque no jalo como nombre de las variables)*/
foreach v of varlist _all {
   local x : variable label `v'
   local x = strtoname("`x'")
    rename `v' `x' 
}


keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Bancario, Financiero y Seguros I", replace

import excel using "Enseñanza (RV).xlsx", first clear sheet("Enseñanza (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")
		rename `p' `x' 
}

keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Enseñanza (RV)",replace




import excel using "Comercio e Industria data 1.xlsx", first clear sheet("Comercio (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")  //command "strtoname" convert a string(accepted by another program like excel variables names) to a Stata name
		rename `p' `x' 
}
rename SECTOR Sector
keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Comercio e Industria data 1",replace





import excel using "Transportes (RV).xlsx", first clear sheet("Terrestre (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")
		rename `p' `x' 
}

keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Transportes (RV)Terrestre",replace



import excel using "Transportes (RV).xlsx", first clear sheet("Aereo (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")
		rename `p' `x' 
}


keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Transportes (RV)Aereo",replace

import excel using "Turismo y otros.xlsx", first clear sheet("Turismo (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")
		rename `p' `x' 
}

keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Turismo y otros_1",replace


import excel using "Turismo y otros.xlsx", first clear sheet("Varios (RV)")

foreach p of varlist _all {
		local x: variable label `p'
		local x= strtoname("`x'")
		rename `p' `x' 
}

keep Hecho Sector Conducta_1
replace Hecho=strtrim(Hecho)
missings dropobs, force
save "Turismo y otros_2",replace

/*
use "Bancario, Financiero y Seguros I.dta"
g Base="Bancario, Financiero y Seguros"
save "Bancario, Financiero y Seguros I", replace
use "Enseñanza (RV)"
g Base="Educacion"
save "Enseñanza (RV)",replace
use "Comercio e Industria data 1.dta"
g Base="Comercio e Industria"
save "Comercio e Industria data 1",replace
use "Transportes (RV)Terrestre"
g Base="Transporte Terrestre"
save "Transportes (RV)Terrestre",replace
use "Transportes (RV)Aereo"
g Base="Transporte Aereo"
save "Transportes (RV)Aereo",replace*/



use "Bancario, Financiero y Seguros I.dta", clear 
append using "Enseñanza (RV)"
append using "Comercio e Industria data 1"
append using "Transportes (RV)Terrestre"
append using "Transportes (RV)Aereo"
append using "Turismo y otros_1"
append using "Turismo y otros_2", force

save RV_1_procesada, replace




/* first step to remove blanks rows is to write the command "search missings", then remove the missing values with the command "missings dropobs, force"




