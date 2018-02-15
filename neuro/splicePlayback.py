import csv
import os
from datetime import datetime


cwd = os.getcwd()
#playbackLog = os.path.join(os.path.expanduser("~"), "Desktop", "Avisoft Bioacoustics", "playback.log")
playbackLog = os.path.join(cwd, "playback.log")
insects = os.path.join(cwd, "keep")

order = []
delim = "/"
with open(playbackLog, 'r') as logFile:
    reader = csv.reader(logFile, delimiter=' ')

    first = True
    for row in reversed(list(reader)):
        if first:
            date = row[0]
            time = int(row[1].replace(":",""))
            first = False
        time2 = int(row[1].replace(":",""))
        if (time2 + 500 > time):
            order.append(row[3].split("\\")[2].split(".")[0])
            time = time2
        else:
            break

print time

print list(reversed(order))
print os.listdir(insects)
print str(datetime.fromtimestamp(os.path.getmtime(insects))).split(" ")[1]


def compareDate(playbackDate, playbackTime, insectDir):
    insectUnixTime = str(datetime.fromtimestamp(os.path.getmtime(insectDir)))
    # format year/mon/day
    insectDate = insectUnixTime.split(" ")[0].replace("-","/")

    #reformatting playback date
    playbackDateStr = playbackDate.split("/")
    dateComponents = ("20" + playbackDateStr[2], playbackDateStr[0], playbackDateStr[1])
    playbackDate = delim.join(dateComponents)

    # format hour:min:sec (24 hour time)
    insectTime = int(insectUnixTime[1].replace(":",""))

    #playback time
    if playbackTime[2] == "5":
        playbackTime[1] = str(int(playbackTime) + 1)
        playbackTime[2] = 0

    #COMPARE DATE
    if (insectDate != playbackDate):
        return False

    # COMPARE time
    if (playbackTime + 1000) > insectTime:
        return False

    return True
