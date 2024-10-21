# template-robot

Referência: 
https://github.com/MarketSquare/robotframework-browser

Documentação em: https://marketsquare.github.io/robotframework-browser/Browser.html

instalar o node 
instalar o python
Update pip: pip install -U pip

pip install -r requirements.txt
rfbrowser init

executar:
robot -d results nome_arquivo.robot

Rodar com tags
robot -d results -i negativo  .\tests\login_edukee_test.robot

Rodar com variáveis de ambiente caso precise mudar o ambiente: 
source .env.qa && robot -d results tests/login_test.robot

Ou pode carregar primeiro a variável de ambiente antes de rodar os testes:
source .env.qa




