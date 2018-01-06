import csv
import os

idDict = {}
cwd = os.getcwd()

srcStr = raw_input("Source file: ")
destStr = raw_input("Destination file:")
filledStr = destStr.split(".")[0] + "FILLED.csv"

srcCol = input("Reference column in source file [0-indexed]: ")
destCol = input("Reference column in destination file [0-indexed]")

copyColsStr = raw_input("Columns to copy (in source file): ")
copyCols = [int(x) for x in copyColsStr.split(",")]
# Optional
destColsStr = raw_input("Columns to fill (in dest): ")
destCols = [int(x) for x in destColsStr.split(",")]

# just being safe
src = os.path.join(cwd, srcStr)
dest = os.path.join(cwd, destStr)
filling = os.path.join(cwd, filledStr)


data = []

with open(src, 'rU') as completeFile:
    reader = csv.reader(completeFile)

    # if header, uncomment
    header = next(reader)

    for row in reader:
        str.rstrip(row[srcCol])
        idDict[row[srcCol]] = [row[x] for x in copyCols]

with open(dest) as emptyFile:
    reader = csv.reader(emptyFile)

    # if header, uncomment
    header = next(reader)

    for row in reader:
        if row[destCol] not in idDict:
            print "id " + str(row[destCol]) + " not found in complete spreadsheet"
        else:
            count = 0
            for elem in idDict[row[destCol]]:
                row[destCols[count]] = elem
                count += 1

        data.append(row)

with open(filling, 'w') as emptyFile:
    writer = csv.writer(emptyFile)

    for line in data:
        writer.writerow(line)
