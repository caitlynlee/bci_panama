from __future__ import division
import csv
import json
import os
import statistics
#avg, max
MODE = "avg"
cwd = os.getcwd()
callDict = {}

currentSpecies = None
currentSum = 0
currentNum = 0
currentMax = 0
currentData = []

with open('calls.csv') as csvfile:
    reader = csv.reader(csvfile)
    header = next(reader)
    for row in reader:
        if not currentSpecies:
            currentSpecies = row[0]

        if row[0] != currentSpecies:
            if MODE == "avg":
                callDict[currentSpecies] = (statistics.mean(currentData),
                                            statistics.stdev(currentData))
                currentData = []

            if MODE == "max":
                callDict[currentSpecies] = currentMax
                currentMax = 0

            currentSpecies = row[0]

        else:
            if MODE == "avg":
                currentData.append(float(row[6]))

            if MODE == "max":
                if float(row[6]) > currentMax:
                    currentMax = float(row[6])


    if MODE == "avg":
        callDict[currentSpecies] = statistics.mean(currentData)

    if MODE == "max":
        callDict[currentSpecies] = currentMax

speciesCallsFile = os.path.join(cwd, 'speciesCalls.json')
with open(speciesCallsFile, 'w') as f:
    json.dump(callDict, f, sort_keys=True, indent=4)
