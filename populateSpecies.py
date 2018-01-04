import csv
import os

idDict = {}
cwd = os.getcwd()

complete = "testComplete.csv"
empty = "testIncomplete.csv"
filled = "testIncompleteFILLED.csv"

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
        idDict[row[0]] = row[1]

print idDict
with open(toBeFilled) as emptyFile:
    reader = csv.reader(emptyFile)

    # if header, uncomment
    #header = next(reader)

    for row in reader:
        if row[0] not in idDict:
            print "id " + str(row[0]) + " not found in complete spreadsheet"
        else:
            row[4] = idDict[row[0]]
        data.append(row)

with open(filling, 'w') as emptyFile:
    writer = csv.writer(emptyFile)

    for line in data:
        writer.writerow(line)

    #if header, uncomment
    #header = next(writer)
