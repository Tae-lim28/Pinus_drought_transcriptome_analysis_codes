import sys

outfmt6_file_names = []
for file_order in range(1, 21):
    outfmt6_file_names.append(str(sys.argv[file_order]))
matrix_file_name = str(sys.argv[21])
percent_identity = float(sys.argv[22])
length = float(sys.argv[23])
bit_score = float(sys.argv[24])
output_file_name = str(sys.argv[25])

trinity_headers = set()

for file_order in range(len(outfmt6_file_names)):
    outfmt6_file = open(outfmt6_file_names[file_order], "r")
    for outfmt6_row in outfmt6_file.readlines():
        each_row_elements = outfmt6_row.split()
        if float(each_row_elements[2]) > percent_identity:
            if float(each_row_elements[3]) > length:
                if float(each_row_elements[11]) > bit_score: 
                    trinity_headers.add(each_row_elements[0])

    outfmt6_file.close()

trinity_matrix_file = open(matrix_file_name, "r")
trinity_rows = []
for trinity_row in trinity_matrix_file.readlines():
    trinity_rows.append(trinity_row)
trinity_matrix_file.close()

output_file = open(output_file_name, "w")
output_file.write('\t' + "Control-50-1_RSEM" + '\t' + "Control-51-12_RSEM" + '\t' + "Control-53-6_RSEM" + '\t' + "0h-50-1_RSEM" + '\t' + "0h-51-12_RSEM" + '\t' + "0h-53-6_RSEM" + '\t' + "1h-50-1_RSEM" + '\t' + "1h-51-12_RSEM" + '\t' + "1h-53-6_RSEM" + '\t' + "23h-50-1_RSEM" + '\t' + "23h-51-12_RSEM" + '\t' + "23h-53-6_RSEM" + '\t' + "48h-50-1_RSEM" + '\t' + "48h-51-12_RSEM" + '\t' + "48h-53-6_RSEM" + '\n')

for each_header in enumerate(trinity_headers):
    for each_row in range(len(trinity_rows)):
        each_trinity_row_elements = trinity_rows[each_row].split()
        if each_header[1] == each_trinity_row_elements[0]:
            output_file.write(trinity_rows[each_row])
            break
output_file.close()

print("writing trinity matrix file is done.")
