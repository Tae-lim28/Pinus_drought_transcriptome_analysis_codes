import sys

outfmt6_file_name = str(sys.argv[1])
accession_file_name = str(sys.argv[2])

uniprot_accessions = set([])

outfmt6_file = open(outfmt6_file_name, "r")
for row in outfmt6_file.readlines():
    uniprot_accession = row.split()[1].split("|")[1]
    uniprot_accessions.add(uniprot_accession)

outfmt6_file.close()

accession_file = open(accession_file_name, "w")
for uniprot_accession in uniprot_accessions:
    accession_file.write(uniprot_accession)
    accession_file.write("\n")

accession_file.close()

print("Writing uniprot accession file is done.")
