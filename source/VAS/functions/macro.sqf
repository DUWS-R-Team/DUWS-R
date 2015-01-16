//VAS Main Display idc's
#define VAS_Main_Display 2500
#define VAS_detail_magsbg 2507
#define VAS_detail_mags 2508
#define VAS_detail_mags_list 2509
#define VAS_virt_list 2501
#define VAS_unit_list 2502
#define VAS_filter_1 2580
#define VAS_filter_2 2581
#define VAS_filter_3 2582
#define VAS_filter_4 2583
#define VAS_filter_5 2584

//Define VAS Load idc's
#define VAS_load_Display 2520
#define VAS_load_list 2521
#define VAS_load_fetch 2522

//Define VAS Save idc's
#define VAS_save_Display 2510
#define VAS_save_list 2511
#define VAS_save_fetch 2513
#define VAS_save_text 2512

//Define VAS Prompt idc's
#define VAS_prompt_Display 2550
#define VAS_prompt_text 2551
#define VAS_prompt_true 2552
#define VAS_prompt_false 2553

//Define VAS Transfer Menu IDC's
#define VAS_transfer_MainMenu 2560
#define VAS_transfer_unitsMenu 2600
#define VAS_transfer_UnitsList 2601
#define VAS_transfer_SaveMainMenu 2700
#define VAS_transfer_save_list 2711
#define VAS_transfer_save_text 2712

//Control Macros
#define VAS_getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define VAS_getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])