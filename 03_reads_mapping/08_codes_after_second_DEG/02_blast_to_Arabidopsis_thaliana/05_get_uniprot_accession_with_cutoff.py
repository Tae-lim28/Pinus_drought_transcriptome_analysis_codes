import sys

outfmt6_file_name = str(sys.argv[1])
percent_identity = float(sys.argv[2])
length = float(sys.argv[3])
bit_score = float(sys.argv[4])
accession_file_name = str(sys.argv[5])

outfmt6_rows = []

outfmt6_file = open(outfmt6_file_name, "r")
for row in outfmt6_file.readlines():
    added_row = row.strip()
    outfmt6_rows.append(added_row)

outfmt6_file.close()

uniprot_accessions = set([])

for row in outfmt6_rows:
    each_row_elements = row.split()
    if float(each_row_elements[2]) > percent_identity:
        if float(each_row_elements[3]) > length:
            if float(each_row_elements[11]) > bit_score:
                uniprot_accession = each_row_elements[1].split('|')[1]
                uniprot_accessions.add(uniprot_accession)

accession_file = open(accession_file_name, "w")
for uniprot_accession in uniprot_accessions:
    accession_file.write(uniprot_accession)
    accession_file.write("\n")

accession_file.close()

print("Writing file is done.")
