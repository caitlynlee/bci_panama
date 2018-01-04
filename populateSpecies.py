import csv
import os

idDict = {}
cwd = os.getcwd()

complete = "testComplete.csv"
empty = "testIncomplete.csv"
filled = empty.split(".")[0] + "ALLTHEWAYDONE.csv"

idToSpecies = os.path.join(cwd, complete)
toBeFilled = os.path.join(cwd, empty)
filling = os.path.join(cwd, filled)


data = []

with open(idToSpecies, 'rU') as completeFile:
    reader = csv.reader(completeFile)

    # if header, uncomment
    header = next(reader)

    for row in reader:
        #str.rstrip(row[0])
        # 0 should be replaced by column of ID# - 1
        # 1 should be repaced by column of species name - 1
        idDict[row[0]] = row[1]

with open(toBeFilled) as emptyFile:
    reader = csv.reader(emptyFile)

    # if header, uncomment
    header = next(reader)

    for row in reader:
        # again 0 is the column # of ID# -1
        if row[0] not in idDict:
            print "id " + str(row[0]) + " not found in complete spreadsheet"
        else:
            # 4 is the column in the unfilled spreadhsheet where the name
            # should go ( again subtract 1)
            row[4] = idDict[row[0]]
        data.append(row)

with open(filling, 'w') as emptyFile:
    writer = csv.writer(emptyFile)

    for line in data:
        writer.writerow(line)

    #if header, uncomment
    #header = next(writer)
