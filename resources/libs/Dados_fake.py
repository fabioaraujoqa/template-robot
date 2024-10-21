from faker import Faker
fake = Faker('pt_BR')

def criar_usuario():
    return {
        'nome': fake.name(),
        'email': fake.email(),
        'senha': "Teste@1010!"
    }