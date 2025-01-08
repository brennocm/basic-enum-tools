<div align="center">
    <img src="images/reconnaissance .png" alt="reconnaissance" width="180px">
    <h2 align="center"> Basic Enum Tools</h2>
  </div>

Script voltado para automatizar a instalação e configuração de ferramentas de enumeração de subdomínios, resolução de endpoints, crawler de URLs, fuzzing, e automação de testes de segurança.

### Funcionalidades

- Atualização do sistema e instalação de dependências essenciais;
- Instalação do Python e Golang;
- Instalação e configuração de ferramentas.

##### Utilitários Gerais (Instalados via `apt`)
*   `unzip`: Descompactação de arquivos ZIP;
*   `tar`: Manipulação de arquivos TAR (compactação e descompactação);
*   `bzip2`: Manipulação de arquivos BZIP2 (compactação e descompactação);
*   `vim`: Editor de texto avançado;
*   `curl`: Ferramenta para transferência de dados via URL;
*   `git`: Sistema de controle de versões distribuído;
*   `net-tools`: Conjunto de ferramentas para rede (inclui `netstat`);
*   `python3-pip`: Gerenciador de pacotes para Python 3;
*   `python3-venv`: Ferramenta para criar ambientes virtuais Python;
*   `jq`: Processador de JSON via linha de comando.

#### Ferramentas de Enumeração de Subdomínios (Instaladas via `go install`)
*   `assetfinder`: Encontra subdomínios relacionados a um domínio alvo;
*   `subfinder`: Enumera subdomínios, focada em diferentes fontes de dados;
*   `anew`: Filtra e mantém listas de texto sem duplicatas;
*   `amass`: Ferramenta para coleta de inteligência de código aberto, incluindo subdomínios;
*   `findomain`: Ferramenta para encontrar subdomínios.

#### Ferramentas de Resolução de Subdomínios (Instaladas via `go install`)
*   `httpx`: Ferramenta multiuso para sondar servidores web e identificar status code;
*   `httprobe`: Verifica se uma lista de hosts responde ao HTTP(S) desejado;
*   `gowitness`: Ferramenta para tirar screenshots de sites e armazená-los;
*   `dnsx`: Ferramenta flexível para realizar consultas DNS.

#### Ferramentas de Crawler (Instaladas via `go install`)
*   `waybackurls`: Obtém URLs do Wayback Machine para um domínio;
*   `gau`: Obtém URLs de várias fontes de arquivos de indexadores web.

#### Ferramenta de Enumeração de Pontos de Entrada (Instalada via `go install`)
*   `gf`: Gera padrões customizados para `grep` e outros filtros.

#### Ferramentas de Enumeração de JavaScript (Instaladas via `go install`)
*   `subjs`: Encontra arquivos JavaScript em uma lista de URLs
*   `anti-burl`: FIltra perante resposta 200 HTTP.

#### Ferramentas de Enumeração de Diretórios e Fuzzing (Instaladas via `go install`)
*   `gobuster`: Ferramenta para realizar brute-force em diretórios e arquivos;
*   `ffuf`: Ferramenta para fuzzing web (encontrar arquivos e diretórios).

#### Ferramenta de Automação de Enumeração (Instalada via `go install`)
*   `nuclei`: Framework para executar verificações automatizadas de vulnerabilidades.

#### Ferramentas Adicionais (Instaladas via `go install`)
*   `Goop`: Busca de CVEs;
*   `meg`: Extrai informações e dados de textos;
*   `freq`: identifica frequências de strings e caracteres;
*    `sdlookup`: Extrai informações de subdomínios;
*   `sigurlfind3r`: Extrai URLs de arquivos e texto;
*   `airixss`: Identifica parâmetros XSS vulneráveis;
*   `nilo`: FIltra perante resposta 200 HTTP;
* Atualização automática de templates (ex.: Nuclei);

### Como usar?

<br>

> ⚠️ **Atenção:** Certifique-se do usuário ter permissões administrativas no sistema.

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
