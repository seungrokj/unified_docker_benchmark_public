#!/usr/bin/bash
## float16
./vllm_benchmark_report.sh -s latency -m meta-llama/Meta-Llama-3.1-8B-Instruct   -g 1 -d float16
./vllm_benchmark_report.sh -s latency -m meta-llama/Meta-Llama-3.1-70B-Instruct  -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m meta-llama/Meta-Llama-3.1-405B-Instruct -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m meta-llama/Llama-2-7b-chat-hf           -g 1 -d float16
./vllm_benchmark_report.sh -s latency -m meta-llama/Llama-2-70b-chat-hf          -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m mistralai/Mixtral-8x7B-Instruct-v0.1    -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m mistralai/Mixtral-8x22B-Instruct-v0.1   -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m mistralai/Mistral-7B-Instruct-v0.3      -g 1 -d float16
./vllm_benchmark_report.sh -s latency -m Qwen/Qwen2-7B-Instruct                  -g 1 -d float16
./vllm_benchmark_report.sh -s latency -m Qwen/Qwen2-72B-Instruct                 -g 8 -d float16
./vllm_benchmark_report.sh -s latency -m core42/jais-13b-chat                    -g 1 -d float16
./vllm_benchmark_report.sh -s latency -m core42/jais-30b-chat-v3                 -g 1 -d float16

./vllm_benchmark_report.sh -s throughput -m meta-llama/Meta-Llama-3.1-8B-Instruct   -g 1 -d float16
./vllm_benchmark_report.sh -s throughput -m meta-llama/Meta-Llama-3.1-70B-Instruct  -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m meta-llama/Meta-Llama-3.1-405B-Instruct -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m meta-llama/Llama-2-7b-chat-hf           -g 1 -d float16
./vllm_benchmark_report.sh -s throughput -m meta-llama/Llama-2-70b-chat-hf          -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m mistralai/Mixtral-8x7B-Instruct-v0.1    -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m mistralai/Mixtral-8x22B-Instruct-v0.1   -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m mistralai/Mistral-7B-Instruct-v0.3      -g 1 -d float16
./vllm_benchmark_report.sh -s throughput -m Qwen/Qwen2-7B-Instruct                  -g 1 -d float16
./vllm_benchmark_report.sh -s throughput -m Qwen/Qwen2-72B-Instruct                 -g 8 -d float16
./vllm_benchmark_report.sh -s throughput -m core42/jais-13b-chat                    -g 1 -d float16
./vllm_benchmark_report.sh -s throughput -m core42/jais-30b-chat-v3                 -g 1 -d float16

## float8
./vllm_benchmark_report.sh -s latency -m amd/Meta-Llama-3.1-8B-Instruct-FP8-KV   -g 1 -d float8
./vllm_benchmark_report.sh -s latency -m amd/Meta-Llama-3.1-70B-Instruct-FP8-KV  -g 8 -d float8
./vllm_benchmark_report.sh -s latency -m amd/Meta-Llama-3.1-405B-Instruct-FP8-KV -g 8 -d float8
./vllm_benchmark_report.sh -s latency -m amd/Mixtral-8x7B-Instruct-v0.1-FP8-KV   -g 8 -d float8
./vllm_benchmark_report.sh -s latency -m amd/Mixtral-8x22B-Instruct-v0.1-FP8-KV  -g 8 -d float8

./vllm_benchmark_report.sh -s throughput -m amd/Meta-Llama-3.1-8B-Instruct-FP8-KV   -g 1 -d float8
./vllm_benchmark_report.sh -s throughput -m amd/Meta-Llama-3.1-70B-Instruct-FP8-KV  -g 8 -d float8
./vllm_benchmark_report.sh -s throughput -m amd/Meta-Llama-3.1-405B-Instruct-FP8-KV -g 8 -d float8
./vllm_benchmark_report.sh -s throughput -m amd/Mixtral-8x7B-Instruct-v0.1-FP8-KV   -g 8 -d float8
./vllm_benchmark_report.sh -s throughput -m amd/Mixtral-8x22B-Instruct-v0.1-FP8-KV  -g 8 -d float8
