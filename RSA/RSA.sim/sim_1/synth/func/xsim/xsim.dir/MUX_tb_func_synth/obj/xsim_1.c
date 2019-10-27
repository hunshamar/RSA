/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_2(char*, char *);
extern void execute_3(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_6(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_11033(char*, char *);
extern void execute_18(char*, char *);
extern void execute_11036(char*, char *);
extern void execute_6162(char*, char *);
extern void execute_14108(char*, char *);
extern void execute_14109(char*, char *);
extern void execute_14110(char*, char *);
extern void execute_6166(char*, char *);
extern void execute_6167(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_6170(char*, char *);
extern void execute_6171(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_32(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_33(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_34(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_38(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_41(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_42(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_43(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_44(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_45(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_48(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_49(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_50(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_51(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_52(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_53(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_54(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_55(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_56(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_57(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_58(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_59(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_60(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[50] = {(funcp)execute_2, (funcp)execute_3, (funcp)execute_4, (funcp)execute_5, (funcp)execute_6, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_11033, (funcp)execute_18, (funcp)execute_11036, (funcp)execute_6162, (funcp)execute_14108, (funcp)execute_14109, (funcp)execute_14110, (funcp)execute_6166, (funcp)execute_6167, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_6170, (funcp)execute_6171, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_32, (funcp)transaction_33, (funcp)transaction_34, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_38, (funcp)transaction_39, (funcp)transaction_40, (funcp)transaction_41, (funcp)transaction_42, (funcp)transaction_43, (funcp)transaction_44, (funcp)transaction_45, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_47, (funcp)transaction_48, (funcp)transaction_49, (funcp)transaction_50, (funcp)transaction_51, (funcp)transaction_52, (funcp)transaction_53, (funcp)transaction_54, (funcp)transaction_55, (funcp)transaction_56, (funcp)transaction_57, (funcp)transaction_58, (funcp)transaction_59, (funcp)transaction_60};
const int NumRelocateId= 50;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/MUX_tb_func_synth/xsim.reloc",  (void **)funcTab, 50);
	iki_vhdl_file_variable_register(dp + 1616184);
	iki_vhdl_file_variable_register(dp + 1616240);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/MUX_tb_func_synth/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621528, dp + 1625704, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621568, dp + 1625816, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621608, dp + 1625928, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621648, dp + 1626040, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621688, dp + 1626152, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621728, dp + 1626264, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621768, dp + 1626376, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621808, dp + 1626488, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621848, dp + 1626600, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621888, dp + 1626712, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621928, dp + 1626824, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1621968, dp + 1626936, 0, 255, 0, 255, 256, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1622008, dp + 1670168, 0, 3, 0, 3, 4, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/MUX_tb_func_synth/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/MUX_tb_func_synth/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/MUX_tb_func_synth/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/MUX_tb_func_synth/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
