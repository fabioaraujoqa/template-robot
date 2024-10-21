from robot.api.deco import keyword

class CustomKeywords:
    
    @keyword("Diga Olá")
    def say_hello(self, name):
        print(f"Hello, {name}!")

    @keyword("Somar dois números")
    def add_two_numbers(self, a, b):
        return a + b

    @keyword("Checar se número é par")
    def check_if_number_is_even(self, number):
        if number % 2 == 0:
            return True
        else:
            return False