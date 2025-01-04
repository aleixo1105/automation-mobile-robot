# resources/data_generator.py

from faker import Faker

fake = Faker()

def gerar_nome():
    return fake.first_name()

def gerar_email():
    return fake.email()

def gerar_telefone():
    return fake.msisdn()[:10]  # Número de telefone com 10 dígitos

def gerar_senha():
    return fake.password(length=8)

if __name__ == "__main__":
    nome = gerar_nome()
    email = gerar_email()
    telefone = gerar_telefone()
    senha = gerar_senha()

    # Imprimir os dados gerados
    print(f"Nome gerado: {nome}")
    print(f"Email gerado: {email}")
    print(f"Telefone gerado: {telefone}")
    print(f"Senha gerada: {senha}")
