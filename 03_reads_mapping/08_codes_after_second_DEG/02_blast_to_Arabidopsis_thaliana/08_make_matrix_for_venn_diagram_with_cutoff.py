import sys

outfmt6_file_names = []
for outfmt6_file_order in range(1, 21):
    outfmt6_file_names.append(str(sys.argv[outfmt6_file_order]))
percent_identity = float(sys.argv[21])
length = float(sys.argv[22])
bit_score = float(sys.argv[23])
conditions = []
for condition_order in range(24, 29):
    conditions.append(str(sys.argv[condition_order]))
uniprot_accession_matrix_file_name = str(sys.argv[29])
trinity_header_matrix_file_name = str(sys.argv[30])

def gather_uniprot_accessions_and_trinity_headers(outfmt6_file_name, uniprot_accessions_set, trinity_headers_set):
    outfmt6_file = open(outfmt6_file_name, "r")
    for row in outfmt6_file.readlines():
        each_row_elements = row.strip().split()
        if float(each_row_elements[2]) > percent_identity:
            if float(each_row_elements[3]) > length:
                if float(each_row_elements[11]) > bit_score:
                    uniprot_accession = each_row_elements[1].split('|')[1]
                    uniprot_accessions_set.add(uniprot_accession)
                    trinity_header = each_row_elements[0]
                    trinity_headers_set.add(trinity_header)
    outfmt6_file.close()

    return None

def exist_uniprot_accession_and_trinity_headers(outfmt6_file_name, uniprot_accessions_list, trinity_headers_list, bool_uniprot_accessions_list, bool_trinity_headers_list):
    outfmt6_file_rows = []
    outfmt6_file_uniprot_accessions = []
    outfmt6_file_trinity_headers = []
    outfmt6_file = open(outfmt6_file_name, "r")
    for row in outfmt6_file.readlines():
        each_row_elements = row.strip().split()
        outfmt6_file_rows.append(each_row_elements)
        uniprot_accession = each_row_elements[1].split('|')[1]
        outfmt6_file_uniprot_accessions.append(uniprot_accession)
        trinity_header = each_row_elements[0]
        outfmt6_file_trinity_headers.append(trinity_header)
    outfmt6_file.close()
    
    uniprot_accession_list_length = len(uniprot_accessions_list)
    print(str(len(bool_uniprot_accessions_list)))
    outfmt6_file_uniprot_accessions_length = len(outfmt6_file_uniprot_accessions)
    for uniprot_accession_list_order in range(uniprot_accession_list_length):
        bool_exist = False
        for outfmt6_file_uniprot_accession_order in range(outfmt6_file_uniprot_accessions_length):
            if outfmt6_file_uniprot_accessions[outfmt6_file_uniprot_accession_order] == uniprot_accessions_list[uniprot_accession_list_order]:
                if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][2]) > percent_identity:
                    if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][3]) > length:
                        if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][11]) > bit_score:
                            bool_exist = True
                            bool_uniprot_accessions_list[uniprot_accession_list_order] = "TRUE"
                            break

        if bool_exist == False:
            bool_uniprot_accessions_list[uniprot_accession_list_order] = "FALSE"

    trinity_headers_list_length = len(trinity_headers_list)
    print(str(len(bool_trinity_headers_list)))
    outfmt6_file_trinity_headers_length = len(outfmt6_file_trinity_headers)
    for trinity_header_list_order in range(trinity_headers_list_length):
        bool_exist = False
        for outfmt6_file_trinity_header_order in range(outfmt6_file_trinity_headers_length):
            if outfmt6_file_trinity_headers[outfmt6_file_trinity_header_order] == trinity_headers_list[trinity_header_list_order]:
                if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][2]) > percent_identity:
                    if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][3]) > length:
                        if float(outfmt6_file_rows[outfmt6_file_uniprot_accession_order][11]) > bit_score:
                            bool_exist = True
                            bool_trinity_headers_list[trinity_header_list_order] = "TRUE"
                            break
        
        if bool_exist == False:
            bool_trinity_headers_list[trinity_header_list_order] = "FALSE"

    return None

def combine_two_bool_list(bool_list1, bool_list2):
    combined_bool_list = []
    #print(len(bool_list1))
    #print(len(bool_list2))
    bool_list_length = len(bool_list1)
    for bool_order in range(bool_list_length):
        if bool_list1[bool_order] == "TRUE" or bool_list2[bool_order] == "TRUE":
            combined_bool_list.append("TRUE")
        else:
            combined_bool_list.append("FALSE")

    return combined_bool_list

uniprot_accessions = set([])
trinity_headers = set([])
outfmt6_file_names_length = len(outfmt6_file_names)
for outfmt6_file_order in range(outfmt6_file_names_length):
    gather_uniprot_accessions_and_trinity_headers(outfmt6_file_names[outfmt6_file_order], uniprot_accessions, trinity_headers)

uniprot_accessions = list(uniprot_accessions)
trinity_headers = list(trinity_headers)

#print("-"*100)
#print(len(uniprot_accessions))
#print(len(trinity_headers))
#print("-"*100)

bool_uniprot_accessions_lists = []
bool_trinity_headers_lists = []
for outfmt6_file_order in range(outfmt6_file_names_length):
    added_bool_uniprot_accessions_list = ["FALSE"]*len(uniprot_accessions)
    added_bool_trinity_headers_list = ["FALSE"]*len(trinity_headers)
    exist_uniprot_accession_and_trinity_headers(outfmt6_file_names[outfmt6_file_order], uniprot_accessions, trinity_headers, added_bool_uniprot_accessions_list, added_bool_trinity_headers_list)
    bool_uniprot_accessions_lists.append(added_bool_uniprot_accessions_list)
    bool_trinity_headers_lists.append(added_bool_trinity_headers_list)

print(outfmt6_file_names_length)

combined_bool_uniprot_accessions_lists = []
for outfmt6_file_order in range(0, outfmt6_file_names_length, 2):
    combined_bool_uniprot_accession_list = combine_two_bool_list(bool_uniprot_accessions_lists[outfmt6_file_order], bool_uniprot_accessions_lists[outfmt6_file_order + 1])
    combined_bool_uniprot_accessions_lists.append(combined_bool_uniprot_accession_list)

combined_bool_trinity_headers_lists = []
for outfmt6_file_order in range(0, outfmt6_file_names_length, 2):
    combined_bool_triniry_headers_list = combine_two_bool_list(bool_trinity_headers_lists[outfmt6_file_order], bool_trinity_headers_lists[outfmt6_file_order + 1])
    combined_bool_trinity_headers_lists.append(combined_bool_triniry_headers_list)

conditions_length = len(conditions)
uniprot_accession_matrix_file = open(uniprot_accession_matrix_file_name, "w")
uniprot_accession_matrix_file.write("\t")
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        uniprot_accession_matrix_file.write(conditions[condition1] + "vs." + conditions[condition2])
        uniprot_accession_matrix_file.write("\t")
uniprot_accession_matrix_file.write("\n")

uniprot_accessions_length = len(uniprot_accessions)
for uniprot_accession_order in range(uniprot_accessions_length):
    uniprot_accession_matrix_file.write(uniprot_accessions[uniprot_accession_order])
    uniprot_accession_matrix_file.write("\t")
    for bool_uniprot_accessions_list in combined_bool_uniprot_accessions_lists:
        uniprot_accession_matrix_file.write(bool_uniprot_accessions_list[uniprot_accession_order])
        uniprot_accession_matrix_file.write("\t")
    uniprot_accession_matrix_file.write("\n")
'''uniprot_accession_matrix_file.write("\t")
for uniprot_accession in uniprot_accessions:
    uniprot_accession_matrix_file.write(uniprot_accession)
    uniprot_accession_matrix_file.write("\t")
uniprot_accession_matrix_file.write("\n")

combined_bool_uniprot_accessions_lists_index = 0
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        uniprot_accession_matrix_file.write(conditions[condition1] + "vs." + conditions[condition2])
        uniprot_accession_matrix_file.write("\t")
        for bool_value in combined_bool_uniprot_accessions_lists[combined_bool_uniprot_accessions_lists_index]:
            uniprot_accession_matrix_file.write(bool_value)
            uniprot_accession_matrix_file.write("\t")
        uniprot_accession_matrix_file.write("\n")
        combined_bool_uniprot_accessions_lists_index += 1'''
uniprot_accession_matrix_file.close()

trinity_header_matrix_file = open(trinity_header_matrix_file_name, "w")
trinity_header_matrix_file.write("\t")
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        trinity_header_matrix_file.write(conditions[condition1] + "vs." + conditions[condition2])
        trinity_header_matrix_file.write("\t")
trinity_header_matrix_file.write("\n")

trinity_headers_length = len(trinity_headers)
for trinity_header_order in range(trinity_headers_length):
    trinity_header_matrix_file.write(trinity_headers[trinity_header_order])
    trinity_header_matrix_file.write("\t")
    for bool_trinity_headers_list in combined_bool_trinity_headers_lists:
        trinity_header_matrix_file.write(bool_trinity_headers_list[trinity_header_order])
        trinity_header_matrix_file.write("\t")
    trinity_header_matrix_file.write("\n")
'''trinity_header_matrix_file.write("\t")
for trinity_header in trinity_headers:
    trinity_header_matrix_file.write(trinity_header)
    trinity_header_matrix_file.write("\t")
trinity_header_matrix_file.write("\n")

combinded_bool_trinity_headers_lists_index = 0
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        trinity_header_matrix_file.write(conditions[condition1] + "vs." + conditions[condition2])
        trinity_header_matrix_file.write("\t")
        for bool_value in combined_bool_trinity_headers_lists[combinded_bool_trinity_headers_lists_index]:
            trinity_header_matrix_file.write(bool_value)
            trinity_header_matrix_file.write("\t")
        trinity_header_matrix_file.write("\n")
        combinded_bool_trinity_headers_lists_index += 1'''
trinity_header_matrix_file.close()

print("Writing matrix files is done.")

print("Start writing files for debug.")
uniprot_accession_matrix_file_for_debug_name = uniprot_accession_matrix_file_name[:len(uniprot_accession_matrix_file_name) - 4] + "_for_debug" + ".txt"
trinity_header_matrix_file_for_debug_name = trinity_header_matrix_file_name[:len(trinity_header_matrix_file_name) - 4] + "_for_debug" + ".txt"
#print(uniprot_accession_matrix_file_name)
#print(uniprot_accession_matrix_file_for_debug_name)
#print(trinity_header_matrix_file_name)
#print(trinity_header_matrix_file_for_debug_name)

uniprot_accession_matrix_file_for_debug = open(uniprot_accession_matrix_file_for_debug_name, "w")
uniprot_accession_matrix_file_for_debug.write("compare_conditions\t" + "counts\n")

bool_uniprot_accessions_lists_index = 0
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        uniprot_accession_matrix_file_for_debug.write(conditions[condition1] + " up compared to " + conditions[condition2] + "\t")
        uniprot_accession_matrix_file_for_debug.write(str(bool_uniprot_accessions_lists[bool_uniprot_accessions_lists_index].count("TRUE")) + "\n")
        bool_uniprot_accessions_lists_index += 1
        uniprot_accession_matrix_file_for_debug.write(conditions[condition2] + " up compared to " + conditions[condition1] + "\t")
        uniprot_accession_matrix_file_for_debug.write(str(bool_uniprot_accessions_lists[bool_uniprot_accessions_lists_index].count("TRUE")) + "\n")
        bool_uniprot_accessions_lists_index += 1
uniprot_accession_matrix_file_for_debug.close()

trinity_header_matrix_file_for_debug = open(trinity_header_matrix_file_for_debug_name, "w")
trinity_header_matrix_file_for_debug.write("compare_conditions\t" + "counts\n")

bool_trinity_headers_lists_index = 0
for condition1 in range(conditions_length - 1):
    for condition2 in range(condition1 + 1, conditions_length):
        trinity_header_matrix_file_for_debug.write(conditions[condition1] + " up compared to " + conditions[condition2] + "\t")
        trinity_header_matrix_file_for_debug.write(str(bool_trinity_headers_lists[bool_trinity_headers_lists_index].count("TRUE")) + "\n")
        bool_trinity_headers_lists_index += 1
        trinity_header_matrix_file_for_debug.write(conditions[condition2] + " up compared to " + conditions[condition1] + "\t")
        trinity_header_matrix_file_for_debug.write(str(bool_trinity_headers_lists[bool_trinity_headers_lists_index].count("TRUE")) + "\n")
        bool_trinity_headers_lists_index += 1
trinity_header_matrix_file_for_debug.close()
# Here is a problem with trinity headers

print("Writing files for debug is done.")
