from __future__ import division
import csv
import json
import os



cwd = os.getcwd()
callDict = {}

currentSpecies = None
currentSum = 0
currentNum = 0

with open('calls.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = next(reader)
    for row in reader:
        if not currentSpecies:
            currentSpecies = row[0]

        if row[0] != currentSpecies:
            callDict[currentSpecies] = currentSum/currentNum

            currentSpecies = row[0]
            currentSum = 0
            currentNum = 0

        else:
            print float(row[6])
            currentSum += float(row[6])
            currentNum += 1

    callDict[currentSpecies] = currentSum/currentNum
    
speciesCallsFile = os.path.join(cwd, 'speciesCalls.json')
with open(speciesCallsFile, 'w') as f:
    json.dump(callDict, f, sort_keys=True, indent=4)
