## Overview

This repository supports the research presented in our paper titled "Exploring Models for Energy Consumption Estimation in Diverse Application Scenarios," submitted to CASCON. Our study explores the relationships between system behavior and energy consumption, employing various machine learning algorithms to predict energy usage across different applications. This research aims to enhance the accuracy of energy estimation in software systems by utilizing performance counters and system calls.

### Datasets

The datasets included in this repository are a core component of our research. They encompass data collected from a range of scenarios involving diverse applications—Stress-ng, Firefox, and MongoDB—to build and test the efficacy of our proposed models under varied conditions. The datasets are divided into several categories:
- **Original**: Raw data collected from our experiments.
- **Normalized**: Datasets that have been processed through normalization, missing value addition, and feature removal. Data in both directories are categorized into event-based, syscall-based, and hybrid datasets.

### Scripts

The scripts provided in this repository are designed to run our experiments, including data collection, modeling, and evaluation. They include:
- **Application**: Scripts to operate Stress-ng, Firefox, and MongoDB, simulating diverse task loads. Please note that all data used in the MongoDB test cases are fictitious and intended solely for simulation purposes in this research context.
  
We use the following command to trace system call data:   
```bash
perf trace
```
This is used to capture software and hardware events: 
```bash
perf stat -e cache-misses,context-switches,page-faults,minor-faults,major-faults,branch-misses,instructions,cpu-cycles,cache-references,msr/tsc/,cpu-clock,ex_ret_instr
```
In addition, the following is used to measure energy consumption: 
```bash
perf stat -e power/energy-pkg/
```
- **Modeling**: Scripts used for training and evaluating machine learning models, employing linear and non-linear regression techniques.

**Note that**: Some scripts has been developed with the assistance of ChatGPT. The tool was used for tasks such as:

- Code generation and refactoring
- Debugging and troubleshooting specific sections
- Providing suggestions for improving algorithm efficiency

## Setup and Installation

Some addtional tools/packages are required before running the scripts under **Application**, such as Firefox, Stress-ng, xdotool, etc.

Before running the scripts under **Modeling**, ensure you have the necessary libraries installed. You can install the required Python packages using the following command:

```bash
pip install pandas scikit-learn
