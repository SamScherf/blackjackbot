import sys
import random

CARDS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
VALS = {'a': 1, 'A': 11, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, '10': 10, 'J': 10, 'Q': 10, 'K': 10}


def generateOneHand():
    deck = CARDS * 4
    random.shuffle(deck)
    dealerHand = [deck[0], deck[1]]
    playerHand = [deck[2], deck[3]]
    shouldHit = None
    playerVal = sum([VALS[card] for card in playerHand])
    originalPlayerVal = playerVal
    print(dealerHand, playerHand)
    tryHitting = random.randint(0, 1)

    # Try hitting
    if tryHitting == 1 and shouldHit is None:
        print("Try hitting")
        playerHand.append(deck[4])
        playerVal += VALS[deck[4]]
        if playerVal > 21:  # We busted
            if 'A' in playerHand:
                playerVal -= 10
                playerAce = playerHand.index('A')
                playerHand[playerAce] = 'a'
            else:
                shouldHit = False
        if shouldHit is None:
            dealerVal = sum([VALS[card] for card in dealerHand])
            i = 5
            while dealerVal < 17:
                dealerHand.append(deck[i])
                dealerVal += VALS[deck[i]]
                if dealerVal > 21:
                    if 'A' in dealerHand:
                        aceIndex = dealerHand.index('A')
                        dealerHand[aceIndex] = 'a'
                        dealerVal -= 10
                    else:
                        shouldHit = True
                        break
                i += 1
        if shouldHit is None:
            shouldHit = playerVal >= dealerVal or (playerVal < dealerVal and playerVal >= originalPlayerVal)
        print(dealerHand, playerHand)
        if shouldHit:
            print("Hitting was correct")
        else:
            print("Hitting was incorrect")
    # Try staying
    elif tryHitting == 0 and shouldHit is None:
        print("Try staying")
        dealerVal = sum([VALS[card] for card in dealerHand])
        i = 4
        while dealerVal < 17:
            dealerHand.append(deck[i])
            dealerVal += VALS[deck[i]]
            if dealerVal > 21:
                if 'A' in dealerHand:
                    aceIndex = dealerHand.index('A')
                    dealerHand[aceIndex] = 'a'
                    dealerVal -= 10
                else:
                    shouldHit = False
                    break
            i += 1
        if shouldHit is None:
            shouldHit = playerVal < dealerVal
        print(dealerHand, playerHand)
        if not shouldHit:
            print("Staying was correct")
        else:
            print("Staying was incorrect")
    result = (VALS[deck[0]], VALS[deck[2]] + VALS[deck[3]], shouldHit)
    print(str(result[0]) + ',' + str(result[1]) + ',' + str(int(result[2])))
    return str(result[0]) + ',' + str(result[1]) + ',' + str(int(result[2])) + '\n'

def main():
    trainingData = open(r"training1.txt", "w")
    for i in range(10000):
        generateOneHand()
        trainingData.write(generateOneHand())

if __name__ == '__main__':
    main()