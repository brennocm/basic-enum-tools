<div align="center">
    <img src="images/reconnaissance .png" alt="reconnaissance" width="220px">
    <h2 align="center"> Basic Enum Tools</h2>
</div>

Script designed to automate the installation and configuration of tools for subdomain enumeration, endpoint resolution, URL crawling, fuzzing, and security testing automation.

### Features

- System update and installation of essential dependencies;
- Installation of Python and Golang;
- Installation and configuration of tools.

##### General Utilities (Installed via `apt`)
*   `unzip`: ZIP file extraction;
*   `tar`: TAR file manipulation (compression and extraction);
*   `bzip2`: BZIP2 file manipulation (compression and extraction);
*   `vim`: Advanced text editor;
*   `curl`: Data transfer tool via URL;
*   `git`: Distributed version control system;
*   `net-tools`: Network tools suite (includes `netstat`);
*   `python3-pip`: Package manager for Python3;
*   `python3-venv`: Tool to create Python virtual environments;
*   `jq`: Command-line JSON processor.

#### Subdomain Enumeration Tools (Installed via `go install`)
*   `assetfinder`: Finds subdomains related to a target domain;
*   `subfinder`: Enumerates subdomains, focused on different data sources;
*   `anew`: Filters and maintains text lists without duplicates;
*   `amass`: Tool for open-source intelligence gathering, including subdomains;
*   `findomain`: Tool to find subdomains.

#### Subdomain Resolution Tools (Installed via `go install`)
*   `httpx`: Multi-purpose tool for probing web servers and identifying status codes;
*   `httprobe`: Checks if a list of hosts responds to the desired HTTP(S);
*   `gowitness`: Tool for taking screenshots of websites and storing them;
*   `dnsx`: Flexible tool for performing DNS queries.

#### Crawler Tools (Installed via `go install`)
*   `waybackurls`: Fetches URLs from the Wayback Machine for a domain;
*   `gau`: Fetches URLs from various sources of web indexers.

#### Endpoint Enumeration Tool (Installed via `go install`)
*   `gf`: Generates custom patterns for `grep` and other filters.

#### JavaScript Enumeration Tools (Installed via `go install`)
*   `subjs`: Finds JavaScript files in a list of URLs;
*   `anti-burl`: Filters based on HTTP 200 responses.

#### Directory Enumeration and Fuzzing Tools (Installed via `go install`)
*   `gobuster`: Tool for brute-forcing directories and files;
*   `ffuf`: Web fuzzing tool (finding files and directories).

#### Enumeration Automation Tool (Installed via `go install`)
*   `nuclei`: Framework for performing automated vulnerability checks.

#### Additional Tools (Installed via `go install`)
*   `Goop`: CVE search tool;
*   `meg`: Extracts information and data from texts;
*   `freq`: Identifies string and character frequencies;
*   `sdlookup`: Extracts subdomain information;
*   `sigurlfind3r`: Extracts URLs from files and text;
*   `airixss`: Identifies vulnerable XSS parameters;
*   `nilo`: Filters based on HTTP 200 responses;
*   Automatic template updates (e.g., Nuclei).

### How to Use?

<div align="center">
    <img src="images/banner.png" alt="banner" width="70%">
</div>

<br><br>

> ⚠️ **Warning:** Ensure the user has administrative permissions on the system.

<br>

 Clone this repository:
```bash
git clone https://github.com/brennocm/basic-enum-tools.git
```


Navigate to the project directory:
```bash
cd basic-enum-tools
```
Run the script using the `bash` utility with administrative permissions:
```bash
sudo bash basic-enum-tools.sh
```

#### OR 

Make the script executable:
```bash
chmod +x basic-enum-tools.sh
```

Run the script with administrative permissions:
```bash
sudo ./basic-enum-tools.sh
```
