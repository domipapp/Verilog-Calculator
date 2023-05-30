
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name calc_1_2 -dir "C:/Users/domip/Downloads/my_m123/CALC_1_2/calc_1_2/planAhead_run_3" -part xc3s250etq144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/domip/Downloads/my_m123/CALC_1_2/calc_1_2/calc_2.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/domip/Downloads/my_m123/CALC_1_2/calc_1_2} }
set_property target_constrs_file "LOGSYS_SP3E.ucf" [current_fileset -constrset]
add_files [list {LOGSYS_SP3E.ucf}] -fileset [get_property constrset [current_run]]
link_design
