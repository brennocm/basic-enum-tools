#!/bin/bash

# ASCII Art Banner
cat << "EOF"
╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗

/$$$$$$$                      /$$                 /$$$$$$$$                                           /$$                         /$$          
| $$__  $$                    |__/                | $$_____/                                          | $$                        | $$          
| $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$$      | $$       /$$$$$$$  /$$   /$$ /$$$$$$/$$$$        /$$$$$$    /$$$$$$   /$$$$$$ | $$  /$$$$$$$
| $$$$$$$  |____  $$ /$$_____/| $$ /$$_____/      | $$$$$   | $$__  $$| $$  | $$| $$_  $$_  $$      |_  $$_/   /$$__  $$ /$$__  $$| $$ /$$_____/
| $$__  $$  /$$$$$$$|  $$$$$$ | $$| $$            | $$__/   | $$  \ $$| $$  | $$| $$ \ $$ \ $$        | $$    | $$  \ $$| $$  \ $$| $$|  $$$$$$ 
| $$  \ $$ /$$__  $$ \____  $$| $$| $$            | $$      | $$  | $$| $$  | $$| $$ | $$ | $$        | $$ /$$| $$  | $$| $$  | $$| $$ \____  $$
| $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$|  $$$$$$$      | $$$$$$$$| $$  | $$|  $$$$$$/| $$ | $$ | $$        |  $$$$/|  $$$$$$/|  $$$$$$/| $$ /$$$$$$$/
|_______/  \_______/|_______/ |__/ \_______/      |________/|__/  |__/ \______/ |__/ |__/ |__/         \___/   \______/  \______/ |__/|_______/ 
                                                                                                                                                 

    by: brennocm (https://github.com/brennocm/basic-enum-tools)
╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
EOF

# Define colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# Success message
success_message() {
    echo -e "${GREEN}[✔] $1${RESET}"
}

# Error message
error_message() {
    echo -e "${RED}[✘] $1${RESET}"
}

# Info message
info_message() {
    echo -e "${YELLOW}[ℹ] $1${RESET}"
}

# Section separator
separator() {
    echo -e "\n${CYAN}=============================================================${RESET}"
    echo -e "${CYAN}>>> $1 <<<${RESET}"
    echo -e "${CYAN}=============================================================${RESET}\n"
}

# Function to check and install tool
check_and_install_tool() {
    local name=$1
    local command=$2
    local install_command=$3 # Add install command parameter

    info_message "Checking $name..."
    if command -v "$command" &>/dev/null; then
        success_message "$name is installed and available."
    else
        error_message "$name is not installed. Installing..."
        eval "$install_command" && success_message "$name installed successfully!" || error_message "Failed to install $name."
    fi
}

# Function to check tool installation
check_tool() {
    local name=$1
    local command=$2

    info_message "Checking $name..."
    if command -v "$command" &>/dev/null; then
        success_message "$name is installed and available."
        return 0
    else
        error_message "$name is not installed or not in the PATH."
        return 1
    fi
}

# Update the system
separator "System Update"
info_message "Updating the system..."
sudo apt update && sudo apt upgrade -y && success_message "System updated successfully!" || error_message "System update failed."

# Function to check Golang version
check_go_version() {
    if command -v go &>/dev/null; then
        GO_VERSION=$(go version | cut -d' ' -f3)
        success_message "Golang version: $GO_VERSION"
        return 0
    else
        error_message "Golang is not properly installed"
        return 1
    fi
}

# Function to install Golang
install_golang() {
    info_message "Downloading and installing Golang..."
    
    # Download the latest stable version of Go
    wget -q https://go.dev/dl/go1.22.0.linux-amd64.tar.gz -O /tmp/go.linux-amd64.tar.gz
    if [[ $? -ne 0 ]]; then
        error_message "Failed to download Golang."
        return 1
    fi

    # Remove any previous Go installation
    sudo rm -rf /usr/local/go

    # Extract Go to /usr/local
    sudo tar -C /usr/local -xzf /tmp/go.linux-amd64.tar.gz
    if [[ $? -ne 0 ]]; then
        error_message "Failed to extract Golang tarball."
        return 1
    fi

    # Set up environment variables
    echo 'export GOPATH=$HOME/go' | sudo tee /etc/profile.d/go.sh
    echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' | sudo tee -a /etc/profile.d/go.sh
    sudo chmod +x /etc/profile.d/go.sh

    # Source the new environment variables
    source /etc/profile.d/go.sh
    
    # Create go directory structure
    mkdir -p $HOME/go/{bin,src,pkg}

    # Verify installation
    if ! check_go_version; then
        error_message "Golang installation verification failed."
        return 1
    fi

    # Clean up
    rm -f /tmp/go.linux-amd64.tar.gz
    
    success_message "Golang installed successfully!"
    return 0
}

# Install Golang section
separator "Golang Installation"
if ! check_go_version; then
    info_message "Golang not found. Installing..."
    if install_golang; then
        success_message "Golang installation completed successfully."
    else
        error_message "Failed to install Golang. Exiting..."
        exit 1
    fi
else
    success_message "Golang is already installed."
fi

# Install general utilities
separator "General Utilities"
info_message "Checking and installing general utilities..."
UTILITIES=(
    "unzip"
    "tar"
    "bzip2"
    "vim"
    "curl"
    "git"
    "netstat" #netstat is from net-tools
    "python3"
    "pip3" #pip is from python3-pip
    "python3-venv"
    "jq"
)
check_and_install_tool "unzip" "unzip" "sudo apt install -y unzip"
check_and_install_tool "tar" "tar" "sudo apt install -y tar"
check_and_install_tool "bzip2" "bzip2" "sudo apt install -y bzip2"
check_and_install_tool "vim" "vim" "sudo apt install -y vim"
check_and_install_tool "curl" "curl" "sudo apt install -y curl"
check_and_install_tool "git" "git" "sudo apt install -y git"
check_and_install_tool "net-tools" "netstat" "sudo apt install -y net-tools"
check_and_install_tool "python3" "python3" "sudo apt install -y python3"
check_and_install_tool "python3-pip" "pip3" "sudo apt install -y python3-pip"
check_and_install_tool "python3-venv" "python3-venv" "sudo apt install -y python3-venv"
check_and_install_tool "jq" "jq" "sudo apt install -y jq"

# Verify Python installation
separator "Python Verification"
info_message "Verifying Python installation..."
if command -v python3 &>/dev/null; then
    success_message "Python installed successfully! Version: $(python3 --version)"
else
    error_message "Python was not installed correctly."
    exit 1
fi

# Verify jq installation
separator "jq Verification"
info_message "Verifying jq installation..."
if command -v jq &>/dev/null; then
    success_message "jq installed successfully! Version: $(jq --version)"
else
    error_message "jq was not installed correctly."
    exit 1
fi

# Install subdomain enumeration tools
separator "Subdomain Enumeration Tools"
install_tool() {
    local name=$1
    local command=$2
    info_message "Installing $name..."
    eval $command && success_message "$name installed successfully!" || error_message "Failed to install $name."
}

install_tool "Assetfinder" "go install github.com/tomnomnom/assetfinder@latest && sudo mv /root/go/bin/assetfinder /usr/bin"
install_tool "Subfinder" "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest && sudo mv /root/go/bin/subfinder /usr/bin"
install_tool "Anew" "go install -v github.com/tomnomnom/anew@latest && sudo mv /root/go/bin/anew /usr/bin"
install_tool "Amass" "go install -v github.com/owasp-amass/amass/v4/...@master && sudo mv /root/go/bin/amass /usr/bin"
install_tool "Findomain" "curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip && unzip findomain-linux.zip && rm findomain-linux.zip && chmod +x findomain && sudo mv findomain /usr/bin"

# Install subdomain resolution tools
separator "Subdomain Resolution Tools"
install_tool "httpx" "go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest && sudo mv /root/go/bin/httpx /usr/bin"
install_tool "httprobe" "go install github.com/tomnomnom/httprobe@latest && sudo mv /root/go/bin/httprobe /usr/bin"
install_tool "gowitness" "go install github.com/sensepost/gowitness@latest && sudo mv /root/go/bin/gowitness /usr/bin"
install_tool "dnsx" "go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest && sudo mv /root/go/bin/dnsx /usr/bin"

# Install crawler tools
separator "Crawler Tools"
install_tool "waybackurls" "go install github.com/tomnomnom/waybackurls@latest && sudo mv /root/go/bin/waybackurls /usr/bin"
install_tool "gau" "go install github.com/lc/gau/v2/cmd/gau@latest && sudo mv /root/go/bin/gau /usr/bin"

# Configure gau
info_message "Creating configuration for gau..."
cat <<EOL > /root/.gau.toml
# Configuration file for gau
# Add custom options here
EOL
success_message "Configuration file for gau created."

# Install endpoint enumeration tools
separator "Endpoint Enumeration Tools"
install_tool "gf" "go install github.com/tomnomnom/gf@latest && sudo mv /root/go/bin/gf /usr/bin"

# Install JavaScript enumeration tools
separator "JavaScript Enumeration Tools"
install_tool "subjs" "wget https://github.com/lc/subjs/releases/download/v1.0.1/subjs_1.0.1_linux_386.tar.gz -O subjs.tar.gz && tar xvf subjs.tar.gz && rm subjs.tar.gz && sudo mv subjs /usr/bin"
install_tool "anti-burl" "go install github.com/tomnomnom/hacks/anti-burl@master && sudo mv /root/go/bin/anti-burl /usr/bin"

# Install directory enumeration and fuzzing tools
separator "Directory Enumeration & Fuzzing Tools"
install_tool "gobuster" "go install github.com/OJ/gobuster/v3@latest && sudo mv /root/go/bin/gobuster /usr/bin"
install_tool "ffuf" "go install github.com/ffuf/ffuf/v2@latest && sudo mv /root/go/bin/ffuf /usr/bin"

# Install enumeration automation tools
separator "Enumeration Automation Tools"
install_tool "nuclei" "go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest && sudo mv /root/go/bin/nuclei /usr/bin"
info_message "Updating nuclei templates..."
nuclei -update-templates && success_message "Nuclei templates updated successfully!" || error_message "Failed to update nuclei templates."

# Install additional tools
separator "Additional Tools"
install_tool "Goop" "go install github.com/deletescape/goop@latest && sudo mv ~/go/bin/goop /usr/bin"
install_tool "meg" "go install github.com/tomnomnom/meg@latest && sudo mv ~/go/bin/meg /usr/bin"
install_tool "freq" "go install github.com/takshal/freq@latest && sudo mv ~/go/bin/freq /usr/bin"
install_tool "sdlookup" "go install github.com/j3ssie/sdlookup@latest && sudo mv ~/go/bin/sdlookup /usr/bin"
install_tool "sigurlfind3r" "go install -v github.com/hueristiq/xurlfind3r/cmd/xurlfind3r@latest && sudo mv ~/go/bin/xurlfind3r /usr/bin"
install_tool "airixss" "go install github.com/ferreiraklet/airixss@latest && sudo mv ~/go/bin/airixss /usr/bin"
install_tool "nilo" "go install github.com/ferreiraklet/nilo@latest && sudo mv ~/go/bin/nilo /usr/bin"

# Validation of tools and utilities that were not checked previously
separator "Verifying Tools Installation"

# Define the verification list
TOOLS=(
    "Assetfinder:assetfinder"
    "Subfinder:subfinder"
    "Anew:anew"
    "Amass:amass"
    "Findomain:findomain"
    "httpx:httpx"
    "httprobe:httprobe"
    "gowitness:gowitness"
    "dnsx:dnsx"
    "waybackurls:waybackurls"
    "gau:gau"
    "gf:gf"
    "subjs:subjs"
    "anti-burl:anti-burl"
    "gobuster:gobuster"
    "ffuf:ffuf"
    "nuclei:nuclei"
    "Goop:goop"
    "meg:meg"
    "freq:freq"
    "sdlookup:sdlookup"
    "sigurlfind3r:xurlfind3r"
    "airixss:airixss"
    "nilo:nilo"
)

# Verify each tool
for TOOL in "${TOOLS[@]}"; do
    IFS=":" read -r name command <<< "$TOOL"
    check_tool "$name" "$command"
done

# Verify each utility
separator "Verifying Utilities Installation"
for UTIL in "${UTILITIES[@]}"; do
   check_tool "$UTIL" "$UTIL"
done

# Finalization
separator "Installation and Validation Complete"
success_message "All tools and utilities installed and validated successfully! 🎉"
exit 0