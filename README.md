<div align="center">
    <img src="images/reconnaissance .png" alt="reconnaissance" width="180px">
    <h2 align="center"> Basic Enum Tools</h2>
  </div>

Script voltado para automatizar a instalação e configuração de ferramentas de enumeração de subdomínios, resolução de endpoints, crawler de URLs, fuzzing, e automação de testes de segurança.

### Funcionalidades

- Atualização automática do sistema e instalação de dependências essenciais;
- Instalação do Python e Golang;
- Instalação e configuração das seguintes ferramentas:

##### Utilitários Gerais (Instalados via `apt`)
*   `unzip`: Para descompactar arquivos ZIP.
*   `tar`: Para manipular arquivos TAR (compactação e descompactação).
*   `bzip2`: Para manipular arquivos BZIP2 (compactação e descompactação).
*   `vim`: Editor de texto avançado.
*   `curl`: Ferramenta para transferência de dados via URL.
*   `git`: Sistema de controle de versões distribuído.
*   `net-tools`: Conjunto de ferramentas para rede (inclui `netstat`).
*   `python3`: Linguagem de programação Python versão 3.
*   `python3-pip`: Gerenciador de pacotes para Python 3.
*   `python3-venv`: Ferramenta para criar ambientes virtuais Python.
*   `jq`: Processador de JSON via linha de comando.

#### Ferramentas de Enumeração de Subdomínios (Instaladas via `go install`)
*   `assetfinder`: Para encontrar subdomínios relacionados a um domínio alvo.
*   `subfinder`: Outra ferramenta para enumeração de subdomínios, focada em diferentes fontes de dados.
*   `anew`: Para filtrar e manter listas de texto sem duplicatas.
*   `amass`: Ferramenta para coleta de inteligência de código aberto, incluindo subdomínios.
*   `findomain`: Ferramenta rápida para encontrar subdomínios.

#### Ferramentas de Resolução de Subdomínios (Instaladas via `go install`)
*   `httpx`: Ferramenta multiuso para sondar servidores web e identificar status codes.
*   `httprobe`: Para verificar se uma lista de hosts responde a HTTP(S).
*   `gowitness`: Ferramenta para tirar screenshots de sites e armazená-los.
*   `dnsx`: Ferramenta flexível e rápida para realizar consultas DNS.

#### Ferramentas de Crawler (Instaladas via `go install`)
*   `waybackurls`: Para obter URLs do Wayback Machine para um domínio.
*   `gau`: Ferramenta para obter URLs de várias fontes de arquivos de indexadores web.

#### Ferramenta de Enumeração de Pontos de Entrada (Instalada via `go install`)
*   `gf`: Para gerar padrões customizados para `grep` e outros filtros.

#### Ferramentas de Enumeração de JavaScript (Instaladas via `go install`)
*   `subjs`: Para encontrar arquivos JavaScript em uma lista de URLs
*   `anti-burl`: Para evitar o carregamento de links externos.

#### Ferramentas de Enumeração de Diretórios e Fuzzing (Instaladas via `go install`)
*   `gobuster`: Ferramenta para realizar brute-force em diretórios e arquivos.
*   `ffuf`: Ferramenta rápida para fuzzing web (encontrar arquivos e diretórios).

#### Ferramenta de Automação de Enumeração (Instalada via `go install`)
*   `nuclei`: Framework para executar verificações automatizadas de vulnerabilidades.

#### Ferramentas Adicionais (Instaladas via `go install`)
*   `Goop`: Ferramenta para buscar vulnerabilidades em projetos Golang.
*   `meg`: Para extrair informações e dados de textos.
*   `freq`: Para identificar frequências de strings e caracteres.
*    `sdlookup`: Ferramenta para extrair informações de subdomínios.
*   `sigurlfind3r`: Para extrair URLs de arquivos e texto
*   `airixss`: Para identificar parâmetros XSS vulneráveis.
*   `nilo`: Para testar vulnerabilidades NLO.

- Atualização automática de templates (ex.: Nuclei).

### Como usar?

<br>

> ⚠️ **Atenção:** Certifique-se do usuário ter permissões administrátivas no sistema.

<br>

 Clone este repositório:
```bash
git clone https://github.com/brennocm/basic-enum-tools.git
```

Navegue para o diretório do projeto:
```bash
cd basic-enum-tools
```

Execute o script a partir do utilitário `bash` e com permissões administrativas:
```bash
sudo bash basic-enum-tools.sh
```

#### OU 

Torne o script executável:
```bash
chmod +x basic-enum-tools.sh
```

Execute o script com permissões administrativas:
```bash
sudo ./basic-enum-tools.sh
```
