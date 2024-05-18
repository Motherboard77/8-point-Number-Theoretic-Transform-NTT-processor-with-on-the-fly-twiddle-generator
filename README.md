# 8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
The Number Theoretic transform brings down the time complexity of polynomial multiplication of large intergers to quasi-linear complexity O(nlogn). In this pet project, we demonstrate the NTT transform of 8-point POLY with twiddle factors generated in real-time.

NTT VER 5 use the following modules:
1) JMOD_UNIT
2) BUF_indexGEN
3) twiddle_GEN_WITH_MOD_VER1
4) BUFunit_VER2_MODIFIED

The algorithm optimization employs loop fusion of the conventional CT NTT algorithm, having the observation that the NTT structure resembles an analogous version of its signal processing counterpart: the FFT, where each stage consists of N/2 butterfly units and there are a total of log2(N) stages. We came up with an index calculation formula(K), and a twiddle factor generator formula(select) for on-the-fly twiddle generation. However, this can also be done in memory, i.e. storing the constants (twiddles) on a lookup table(LUT) and using proper Twiddle address logic to access them. If we want to compute a 256-point NTT using a single 8-point NTT, we need to iterate the process 32 times. In terms of hardware, there are 2 possible areas of optimization: configuration optimization and Butterfly optimization.

Configuration optimization involves using more no of 8-point cores (instead of using a single one) to parallelize the process and improve speedup. The other technique is loop unrolling, to accommodate more no of butterfly processing units, inside a single 8-point NTT core to parallelize the computation process. Note that we can have at max N/2(in this case N/2 = 4, N=8) butterfly processing units in a core.

