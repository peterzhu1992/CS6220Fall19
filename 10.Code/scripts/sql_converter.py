import csv
import sys
import os

# Written by RyanAnderson
# This is a script to sort the combined data and insert them into the mysql database

if len(sys.argv) > 1:
    baseFolder = sys.argv[1]
else:
    sys.exit()

if len(sys.argv) > 2:
    source = sys.argv[2]
else:
    source = 'Amazon'

fullPath = os.path.join(os.getcwd(), baseFolder)

categories = os.listdir(fullPath)


with open("sqlStatements.txt", "w+") as sql:
    for category in categories:
        print(category)
        files = []

        name = os.path.join(fullPath, category)

        csvList = os.listdir(os.path.join(fullPath, category))
        for csvFileName in csvList:
            if os.path.isfile(os.path.join(name,csvFileName)):
                files.append(os.path.join(name, csvFileName))

        for csvFile in files:
            try:
                with open(csvFile) as reviewCsv:
                    readCSV = csv.reader(reviewCsv, delimiter=',')
                    
                    firstRow = readCSV.__next__()
                    itemIndex = firstRow.index("asin")
                    reviewIndex = firstRow.index("reviewText")
                    ratingIndex = firstRow.index("overall")
                    sentimentIndex = firstRow.index("Sentiment")

                    nextLine = readCSV.__next__()
                    while nextLine:
                        item = nextLine[itemIndex]
                        review = nextLine[reviewIndex]
                        rating = nextLine[ratingIndex]
                        sentiment = nextLine[sentimentIndex]
                
                        statement = "INSERT INTO db.Data (source, department, itemId, score, review, sentiment)"
                        statement += " VALUES (\"%s\", \"%s\", \"%s\", %s, \"%s\", %s);\n" % (source, category, item, rating, review, sentiment)
                        sql.write(statement)

                        nextLine = readCSV.__next__()
            except:
                continue




