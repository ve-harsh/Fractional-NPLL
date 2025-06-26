# Fractional-NPLL
# 🧠 Binary Sequence Generator for Fractional-N PLLs

## 📌 Overview

This project explores different techniques to generate 1-bit binary sequences with a desired average value (α), useful in **fractional-N Phase-Locked Loops (PLLs)**. The goal is to design a method that achieves the correct average while maintaining good spectral performance — ideally minimizing spurs and shaping quantization noise.

## 🚀 Project Journey

The work began with a deep dive into traditional **Digital Delta-Sigma Modulators (DDSMs)**:

- ✅ **First-order and Second-order DDSMs**
- 🔬 Implemented and tested in MATLAB
- 📉 Power Spectral Density (PSD) analysis for noise shaping

Next, I proposed a **custom deterministic method** using a **jittered pattern**:

- 🧮 Simple, average-accurate binary sequence generator
- ❗ Limitation: Introduced **spectral spurs** due to quasi-periodic behavior

After feedback from **Himanshu Vyas**, I explored more advanced architectures:

### ➤ MASH Architectures
- Implemented **HK-MASH-111** and **SP-MASH** in Verilog
- Designed testbenches to extract 1-bit output streams
- Performed **MATLAB-based PSD analysis**
- Compared results against jittered and DDSM methods

## 🔍 Key Learnings

- Deterministic methods can generate correct averages but may lead to spectral issues.
- MASH architectures provide **better noise shaping** and suppress unwanted frequency components.
- MATLAB + Verilog workflow helped validate sequence accuracy and spectral performance.

## 📊 Tools Used

- 🧰 **MATLAB** – Sequence analysis, PSD computation
- 🔧 **Verilog** – RTL design of MASH and jittered methods
- 🖥️ **GTKWave** – Waveform simulation
- 📚 **Vivado** / **ModelSim** (optional) – Simulation & synthesis (for hardware readiness)

## 📁 Directory Structure

