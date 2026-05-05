export HF_ENDPOINT=https://hf-mirror.com
base_PATH=deepseek-ai/DeepSeek-R1-Distill-Llama-8B
# Eagle3_PATH=/wings/zeus-kimi-k2-flush-a-na131-m-test/hub/models--yuhuili--EAGLE3-Vicuna1.3-13B/snapshots/651195736adad4c05282d140e94bfff058b1fc8b
Eagle3_PATH=/home/shenyuhao.syh/specforge-os/eagle3_deepseek
Drafter_PATH=/your_own_path/vicuna-68m
TEMP=0.0
GPU_DEVICES=4

bench_NAME="qa"
MODEL_ID="deepseekr1_baseline"
DEPTH=5
TOP_K=8
TOTAL_TOKEN=32
NUM_GPUS_TOTAL=1


# usage: gen_baseline_answer_ds.py [-h] [--ea-model-path EA_MODEL_PATH] [--base-model-path BASE_MODEL_PATH] [--load-in-8bit] [--model-id MODEL_ID] [--bench-name BENCH_NAME] [--question-begin QUESTION_BEGIN] [--question-end QUESTION_END]
#                               [--answer-file ANSWER_FILE] [--max-new-token MAX_NEW_TOKEN] [--total-token TOTAL_TOKEN] [--depth DEPTH] [--top-k TOP_K] [--num-choices NUM_CHOICES] [--num-gpus-per-model NUM_GPUS_PER_MODEL]
#                               [--num-gpus-total NUM_GPUS_TOTAL] [--max-gpu-memory MAX_GPU_MEMORY] [--temperature TEMPERATURE] [--tree-choices TREE_CHOICES] []


CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 

bench_NAME="humaneval"
CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 

bench_NAME="gsm8k"
CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 

bench_NAME="alpaca"
CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 

bench_NAME="sum"
CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 

bench_NAME="mt_bench"
CUDA_VISIBLE_DEVICES=${GPU_DEVICES} python -m eagle3.evaluation.gen_baseline_answer_ds --ea-model-path $Eagle3_PATH --base-model-path $base_PATH --model-id $MODEL_ID --bench-name $bench_NAME  --total-token $TOTAL_TOKEN --depth $DEPTH --top-k $TOP_K --num-gpus-total $NUM_GPUS_TOTAL --temperature $TEMP 
