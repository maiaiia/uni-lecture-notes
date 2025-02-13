# Getter Functions
Class: [[ FP]]
Type: Seminar 
Tags: # 
Date: October 8th 2024
Teacher: [[Vasilica Moldovan]]

Notes:
## Def 
A getter function is used to make the transition between different representations of certain objects (list /dict. representation) smoother
## Code:
```python
'''
A city is defined by its name (string) and a population (integer)
	- See all cities
	- Add a city from the console
	- Generate random cities
	- Sort the list by population
	- Exit the program
'''

#A city = [name, population] OR
#A city = {"name" : name, "population" : population}

import random

def printMenu():
	print("1. See all cities")
	print("2. Add a city")
	print("3. Generate n random cities")
	print("4. Sort")
	print("0. Exit")

def createCity(name, population):
	#return [name, population]
	return {"name" : name, "population" : population}

#Getter functions make the transition between 
#the list representation and the dictionary representation smoother
def getCityName(city):
	return city["name"]

def getCityPopulation(city):
	return city["population"]

def printCities(listOfCities):
	for i in range(len(listOfCities)):
	#print("City's name = ", listOfCities[i][0], " | Population = ", listOfCities[i][1])
	print("City's name = ", getCityName(listOfCities[i]), " | Population = ", getCityPopulation(listOfCities[i]))

def generateNRandomCities(listOfCities, n):
	cityNames = ["Cluj-Napoca", "Vaslui", "Bacau", "Braila", "Iasi", "Constanta", "Bistrita", "Debrecen", "Paris", "London", "Brasov", "Caracal"]
	for i in range(n):
		population = random.randint(0, 4000000)
		nameIndex = random.randint(0, len(cityNames) - 1)
		listOfCities.append(createCity(cityNames[nameIndex], population))

def SortCities(listOfCities):
	sorted = False
	while sorted == False:
		sorted = True
		for i in range(1, len(listOfCities)):
		if (getCityPopulation(listOfCities[i]) < getCityPopulation(listOfCities[i-1])):
			sorted = False
			city = listOfCities[i]
			listOfCities[i] = listOfCities[i-1]
			listOfCities[i-1] = city

def main():
	listOfCities = []
	while(True):
		printMenu()
		option = input("Choose an option: ")
		
		if option == "0":
			break
		elif option == "1":
			printCities(listOfCities)
		elif option == "2":
			name = input("Name = ")
			population = input("Population = ")
			listOfCities.append(createCity(name, population))
		elif option == "3":
			n = int(input("N = "))
			generateNRandomCities(listOfCities, n)
		elif option == "4":
			SortCities(listOfCities)

main()
```