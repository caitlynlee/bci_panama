import os
import itertools as it
import heapq

def getProb(combo):
    p = 1
    for t in traits:
        if t in combo:
            p *= traits[t][0]
        else:
            p *= 1 - traits[t][0]

    return p


def fillCombo(comboSet):
    for t in traits:
        if t not in comboSet:
            comboSet.add(traits[t][1])

    return list(comboSet)


traits = { "t1": (0.44, "T1"),
           "t2": (0.90, "T2"),
           "t3": (0.19, "T3"),
           "t4": (0.65, "T4"),
           "t5": (0.512, "T5"),
           "t6": (0.22, "T6"),
         }

pq = []

for n in range(len(traits) + 1):
    for combo in it.combinations(traits, n):
        p = getProb(combo)
        heapq.heappush(pq, (-p, fillCombo(set(combo))))

with open('RESULTS.txt', 'w') as f:
    while pq:
        item = heapq.heappop(pq)
        f.write(str(item[1]) + ": " + str(-item[0]) + "\n")
