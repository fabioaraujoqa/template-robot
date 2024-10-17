from faker import Faker
fake = Faker('pt_BR')

def usuario():
    return {
        'email': "fabio.araujo@keeggo.com",
        'senha': "Fff@2020"
    }

def criar_usuario():
    return {
        'nome': fake.name(),
        'email': fake.email(),
        'senha': "Teste@1010!"
    }