class Animal:
    def __init__(self):
        self.name = "Wilbert"
        self.size = 9
        self.greeting = 'Hi my name is '

    def greetMe(self):
        print(self.greeting + self.name)

    @staticmethod
    def static_hello():
        print("Hello")

wilbert = Animal()
wilbert.greetMe()
Animal.static_hello()
