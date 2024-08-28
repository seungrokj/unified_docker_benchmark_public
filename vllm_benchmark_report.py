import csv, sys, json
import argparse
import os

# parse arg
parser = argparse.ArgumentParser(description='Convert vllm csv output format to DLM csv output format')
parser.add_argument("--mode",
                        type=str,
                        help="latency or throughput")
parser.add_argument("--model",
                        type=str,
                        help="model name")
parser.add_argument("--tp",
                        type=str,
                        help="tensorparallel size")
parser.add_argument("--batch-size",
                        type=str,
                        help="batch size")
parser.add_argument("--num-prompts",
                        type=str,
                        help="input requests")
parser.add_argument("--input-len",
                        type=str,
                        help="input seq length")
parser.add_argument("--output-len",
                        type=str,
                        help="output seq length")
parser.add_argument("--dtype",
                        type=str,
                        help="data_type")
parser.add_argument("--input-json",
                        help="path to the input_json file")
parser.add_argument("--output-csv",
                        help="path to the output_csv file")

# read args
args = parser.parse_args()

if args.mode == "latency":
    with open(args.input_json, newline='') as inpf:
        header_write = 0 if os.path.exists(args.output_csv) else 1
        with open(args.output_csv,'a+',newline='') as outf:
            writer = csv.writer(outf, delimiter=',')
            if header_write:
                writer.writerow(['model', 'latency (ms)', 'latency_per_tkn (ms)','tp', 'batch_size', 'input_len', 'output_len', 'dtype']) if header_write else None
            reader = json.load(inpf)
            try:
                latency_per_tkn = str(reader["avg_latency"] / int(args.output_len) * 1000)
                model_details = args.model                       ,\
                                str(reader["avg_latency"] * 1000),\
                                latency_per_tkn                  ,\
                                args.tp                          ,\
                                args.batch_size                  ,\
                                args.input_len                   ,\
                                args.output_len                  ,\
                                args.dtype
                writer.writerow(model_details)
            except csv.Error as e:
                sys.exit('file {}, line {}: {}'.format(args.input_json, reader.line_num, e))

elif args.mode == "throughput":
    with open(args.input_json, newline='') as inpf:
        header_write = 0 if os.path.exists(args.output_csv) else 1
        with open(args.output_csv,'a+',newline='') as outf:
            writer = csv.writer(outf, delimiter=',')
            if header_write:
                writer.writerow(['model', 'throughput_tot (tok/sec)', 'throughput_gen (tok/sec)', 'tp', 'requests', 'input_len', 'output_len', 'dtype']) if header_write else None
            reader = json.load(inpf)
            try:
                gen_throughput = str(int(int(args.num_prompts) * int(args.output_len) / reader["elapsed_time"]))
                model_details = args.model                            ,\
                                str(int(reader["tokens_per_second"])) ,\
                                gen_throughput                        ,\
                                args.tp                               ,\
                                args.num_prompts                      ,\
                                args.input_len                        ,\
                                args.output_len                       ,\
                                args.dtype
                writer.writerow(model_details)
            except csv.Error as e:
                sys.exit('file {}, line {}: {}'.format(args.input_json, reader.line_num, e))
