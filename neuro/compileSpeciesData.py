import csv
import os
import collections


class Katydid:

    def __init__(self, name):
        self.name = name
        self.playbackDict = {}


cwd = os.getcwd()
playbackdir = os.path.join(cwd, "playbackLogs")
katydids = []

def isSpecies(name):
    if len(name.split("_")) == 3:
        return True

    return False

def getPlayback(species):
    for insect in os.listdir(playbackdir):
        insectName = insect[:-4]
        if (insectName == species):

            order = []
            with open(os.path.join(playbackdir,insect)) as f:
                for line in f:
                    data = line.rstrip().split(" ")
                    if len(data) > 1:
                        order.append(int(data[3].split("\\")[2][:-7]))

    return order


with open('thresholds.csv', 'rU') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    for row in reader:
        name = row[0]
        if isSpecies(name):
            k = Katydid(name)

            thresh =[int(x) for x in row[1:]]
            order = getPlayback(name)

            for i in range(len(thresh)):
                k.playbackDict[order[i]] = thresh[i]

            katydids.append(k)


with open('SORTED.csv', 'w') as f:
    writer = csv.writer(f, delimiter=',')

    for katydid in katydids:
        ordered = collections.OrderedDict(sorted(katydid.playbackDict.items()))
        th = [katydid.name]

        for k,v in ordered.iteritems():
            th.append(v)
        writer.writerow(th)
