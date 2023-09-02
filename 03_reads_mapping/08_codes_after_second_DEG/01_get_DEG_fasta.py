import sys

first_condition = str(sys.argv[1])
second_condition = str(sys.argv[2])
p_value = str(sys.argv[3])
fasta_file_name = str(sys.argv[4])
first_condition_up_DEG_fasta_file_name = str(sys.argv[5])
second_condition_up_DEG_fasta_file_name = str(sys.argv[6])

first_condition_up_file_name = "Pinus_Drought.isoform.counts.matrix." + first_condition + "_vs_" + second_condition + ".edgeR.DE_results.P" + p_value + "_C2." + first_condition + "-UP.subset"

first_condition_up_DEG_transcripts_headers = []
first_condition_up_file = open(first_condition_up_file_name, "r")
for row in first_condition_up_file.readlines():
    if row[0] == "T":
        DEG_trinity_header = row.split()[0]
        first_condition_up_DEG_transcripts_headers.append(DEG_trinity_header)

first_condition_up_file.close()

second_condition_up_file_name = "Pinus_Drought.isoform.counts.matrix." + first_condition + "_vs_" + second_condition + ".edgeR.DE_results.P" + p_value + "_C2." + second_condition + "-UP.subset"

second_condition_up_DEG_transcripts_headers = []
second_condition_up_file = open(second_condition_up_file_name, "r")
for row in second_condition_up_file.readlines():
    if row[0] == "T":
        DEG_trinity_header = row.split()[0]
        second_condition_up_DEG_transcripts_headers.append(DEG_trinity_header)

second_condition_up_file.close()

fasta_headers = []
fasta_sequences = []

fasta_file = open(fasta_file_name, "r")
for row in fasta_file.readlines():
    if row[0] == ">":
        trinity_header = row.split()[0][1:]
        fasta_headers.append(trinity_header)
    else:
        fasta_sequences.append(row.strip())

fasta_file.close()

first_condition_up_DEG_fasta_file = open(first_condition_up_DEG_fasta_file_name, "w")
second_condition_up_DEG_fasta_file = open(second_condition_up_DEG_fasta_file_name, "w")
fasta_haders_length = len(fasta_headers)
for fasta_header_order in range(fasta_haders_length):
    if fasta_headers[fasta_header_order] in first_condition_up_DEG_transcripts_headers:
        first_condition_up_DEG_fasta_file.write(">")
        first_condition_up_DEG_fasta_file.write(fasta_headers[fasta_header_order])
        first_condition_up_DEG_fasta_file.write("\n")
        first_condition_up_DEG_fasta_file.write(fasta_sequences[fasta_header_order])
        first_condition_up_DEG_fasta_file.write("\n")
    if fasta_headers[fasta_header_order] in second_condition_up_DEG_transcripts_headers:
        second_condition_up_DEG_fasta_file.write(">")
        second_condition_up_DEG_fasta_file.write(fasta_headers[fasta_header_order])
        second_condition_up_DEG_fasta_file.write("\n")
        second_condition_up_DEG_fasta_file.write(fasta_sequences[fasta_header_order])
        second_condition_up_DEG_fasta_file.write("\n")

first_condition_up_DEG_fasta_file.close()
second_condition_up_DEG_fasta_file.close()

print("Writing DEG fasta files is done.")
