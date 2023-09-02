import sys

gene_counts = int(sys.argv[1])
genes = []
for gene_order in range(gene_counts):
    genes.append(str(sys.argv[gene_order + 2]))
matrix_file_name = str(sys.argv[gene_counts + 2])
output_file_name = str(sys.argv[gene_counts + 3])

matrix_rows = []
matrix_file = open(matrix_file_name, "r")
for row in matrix_file.readlines():
    matrix_rows.append(row)
matrix_file.close()

output_file = open(output_file_name, "w")
output_file.write('\t' + "Control-50-1_RSEM" + '\t' + "Control-51-12_RSEM" + '\t' + "Control-53-6_RSEM" + '\t' + "0h-50-1_RSEM" + '\t' + "0h-51-12_RSEM" + '\t' + "0h-53-6_RSEM" + '\t' + "1h-50-1_RSEM" + '\t' + "1h-51-12_RSEM" + '\t' + "1h-53-6_RSEM" + '\t' + "23h-50-1_RSEM" + '\t' + "23h-51-12_RSEM" + '\t' + "23h-53-6_RSEM" + '\t' + "48h-50-1_RSEM" + '\t' + "48h-51-12_RSEM" + '\t' + "48h-53-6_RSEM" + '\n')

for gene in genes:
    for row in matrix_rows:
        each_row_elements = row.split()
        if each_row_elements[0] == gene:
            output_file.write(row)
            break
output_file.close()

print("writing trinity matrix file is done.")
