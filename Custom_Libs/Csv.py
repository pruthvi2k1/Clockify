import csv

def read_csv_file(filename):
    data = []
    with open(filename,'rb') as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            data.append(row)
    return data


#read_csv_file("C:\\Users\\Owner\\PycharmProjects\\Clockify\\Data\\Users.csv")