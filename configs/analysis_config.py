#!/usr/bin/python
# coding=utf-8
FW_NAME = ""
RESULTS_DIR = ""
FW_RESULTS = ""
UFG_RESULTS = ""
SIM_RESULTS = ""
VULN_RESULTS = ""
ROOT_PATH = ""
INPUT_PATH = ""
HEADLESS_GHIDRA = "/opt/ghidra_10.1.2_PUBLIC/support/analyzeHeadless" 
GHIDRA_SCRIPT = "/app/exec_pth_rec/ghidra_analysis.py" 
GHIDRA_FEATURE_SCRIPT = "/app/ver_proc_recog/feature_extraction.py" 
JSCFG_SCRIPT = "/app/exec_pth_rec/control_flows/js_cfg.js"
CORPUS_CONFIG = "/app/configs/vuln_corpus_config.yml"
FEATURES_PATH = "/home/chkup/Desktop/cases/features"
FEATURE_CORPUS = "/home/chkup/Desktop/cases/feature_corpus"
DFG_CORPUS = "/home/chkup/Desktop/cases/dfg_corpus"


def assert_file(path):
    try:
        fp=open(path, "r")
        fp.close()
    except:
        assert False
        
assert_file(HEADLESS_GHIDRA)
assert_file(GHIDRA_SCRIPT)
assert_file(GHIDRA_FEATURE_SCRIPT)
assert_file(JSCFG_SCRIPT)
assert_file(CORPUS_CONFIG)